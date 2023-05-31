import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = '4';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String messageText = '';
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        // debugPrint(loggedInUser?.email);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void messagesStream() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var doc in snapshot.docs) {
        final data = doc.data();
        data.forEach((key, value) {
          debugPrint(key + ' : ' + value.toString());
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      messageTextController.clear();
                      //Implement send functionality.
                      //messageText + loggedInUser.email
                      //let's add that to our database's collection messages
                      DateTime time = DateTime.now();
                      firestore.collection('messages').add(
                          {'sender': loggedInUser?.email, 'text': messageText, 'time': time.toString()});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (buildContext, snapshot) {
        if (snapshot.hasData) {
          List<Widget> messageWidgets = [];
          final messages = snapshot.data?.docs;
          if (messages != null) {
            for (var message in messages!) {
              final messageText = message['text'];
              final messageSender = message['sender'];
              final currentUser = loggedInUser?.email;
              final widget = MessageBubble(
                  sender: messageSender,
                  text: messageText,
                  isMe: messageSender == currentUser);
              messageWidgets.add(widget);
            }
          }
          return Expanded(
            // height: 90,
            // width: 300,
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                reverse: true,
                children: messageWidgets),
          );
        }
        return const CircularProgressIndicator(
          backgroundColor: Colors.lightBlueAccent,
        );

      },
      stream: firestore.collection('messages').orderBy('time',descending: true).snapshots(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});
  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          Material(
              color: Colors.lightBlueAccent,
              borderRadius: !isMe
                  ? const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              elevation: 5,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)))),
        ],
      ),
    );
  }
}
