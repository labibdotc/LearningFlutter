import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: double.infinity,
                width: 100,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height:100,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100,
                    height:100,
                    color: Colors.green,
                  ),
                ]
              ),
              Container(
                  color: Colors.blue,
                  height: double.infinity,
                  width: 100,
              ),

            ]
          )
        )
      ),
    );
  }
}


