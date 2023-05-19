import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:english_words/english_words.dart';

void main() => runApp(XylophoneApp());

void playSound(int num) {
  AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.play(AssetSource('note$num.wav'));
}
Widget buildKey(int num, MaterialColor keyColor) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        playSound(num);

      },
      child: Container(color: keyColor),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
  );
}

class XylophoneApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: SafeArea(
          child: Container(

              child: Column(
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orange),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blue),
              buildKey(7, Colors.purple),

            ],
          )),
        ),
      ),
    );
  }
}
