import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  final String word;
  final double bmi;
  final String description;
  ResultsPage({required  this.word, required  this.bmi, required  this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('BMI Calculator')),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 0),
        child: Text('Your Results', style: yourResultsTextStyle),
          ),
          Expanded(
          child: ReusableCard(
        color: activeCardColor,
        cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(word, style: resultWordTextStyle),
              Text(bmi.round().toString(), style: bmiTextStyle),
              Text(
                description,
                style: bmiDescriptionTextStyle,
                textAlign: TextAlign.center,
              ),
            ]),
          )),
          GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InputPage())
          );
        },
        child: Container(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text('Re-Calculate', style: largeButtonTextStyle),
                )),
            color: Color(0xFFEB1555),
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            height: bottomButtonHeight),
          )
        ]));
  }
}
