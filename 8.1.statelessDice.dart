import 'package:flutter/material.dart';

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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Expanded(child: TextButton(
          onPressed: () {
            debugPrint('Received click');
          },
          child: Image.asset('images/dice1.png'),
          style: TextButton.styleFrom(
            // minimumSize: Size.zero,
            // padding: EdgeInsets.zero,
            // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        )),

        Expanded(
          child: TextButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: Image.asset('images/dice1.png'),


          ),),

      ]),
    );
  }
}
