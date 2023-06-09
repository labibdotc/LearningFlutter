import 'package:flutter/material.dart';
import 'package:flashchat/widgets/roundedButton.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/firebase_common.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginScreen extends StatefulWidget {
  static const String id = '3';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String pass ='';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                    email = value;
                },
                  style:const TextStyle(color: Colors.black),
                decoration: KUserInputDecoration.copyWith(hintText: 'Enter your email')
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  pass = value;
                  //Do something with the user input.
                },
                  style: const TextStyle(color: Colors.black),
                decoration: KUserInputDecoration.copyWith(hintText:'Enter your password' )
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(callback: () async{
                setState(() {
                  showSpinner = true;
                });
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: pass
                  );
                  if(credential != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
                setState(() {
                  showSpinner = false;
                });
              }, color: Colors.lightBlueAccent, text: 'Log in')
            ],
          ),
        ),
      ),
    );
  }
}
