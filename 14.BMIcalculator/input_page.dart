import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
/*  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;*/
  var selectedCard = Gender.male;
  var height = 170.0;
  var weight = 70;
  var age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: selectedCard == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                      function: () {
                        setState(() {
                          selectedCard = Gender.male;
                          // updateColor(Gender.male);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedCard == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                      function: () {
                        setState(() {
                          selectedCard = Gender.female;
                          // updateColor(Gender.female);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: activeCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: labelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.round().toString(),
                              style: numberTextStyle),
                          Text('cm', style: labelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                              disabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28),
                        ),
                        child: Slider(
                          value: height,
                          min: 120.0,
                          max: 220.0,
                          label: 120.round().toString(),
                          activeColor: Colors.white,
                          inactiveColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: MaterialStatePropertyAll<Color>(
                              Color(0x40EB1555)),
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: labelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(weight.toString(),
                                    style: numberTextStyle),
                                Text('kg', style: labelTextStyle)
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    heroTag: 1,
                                    child: Icon(Icons.remove,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 0) weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  RoundIconButton(
                                    heroTag: 2,
                                    child:
                                        Icon(Icons.add, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ])
                          ]),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: labelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(age.toString(), style: numberTextStyle),
                              Text('y/o', style: labelTextStyle)
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  heroTag: 3,
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                  heroTag: 4,
                                  child: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ])
                        ]),
                  ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain brain = CalculatorBrain(weight: weight, age: age, height: height.round());
                var bmi = brain.calculateBmi();
                var word = brain.category();
                var description = brain.description();
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultsPage(word: word,bmi:bmi,description:description))
                );
              },
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: Center(child: Text('Calculate', style: largeButtonTextStyle)),
                  ),
                  color: Color(0xFFEB1555),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  height: bottomButtonHeight),
            )
          ],
        ));
  }
}
