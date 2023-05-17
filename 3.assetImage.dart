import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Labib'),
          backgroundColor: Colors.black12,
        ),
        body: const Center(
          child: Image(
              image: AssetImage('images/NoNetwork.jpeg'),
          ),
        ),
      ),
    ),
  );
}
