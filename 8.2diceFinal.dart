import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeBothDices() {
    setState((){
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6)+1;
      // print('diceNumber = $leftDiceNumber');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: TextButton(
              onPressed: () {
                changeBothDices();

                // debugPrint('Received click');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
              style: TextButton.styleFrom(
                // minimumSize: Size.zero,
                // padding: EdgeInsets.zero,
                // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            )),
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeBothDices();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),


              ),),
          ]),
    );
  }
}
