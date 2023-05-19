import 'question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  List<Question> _questionz = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  List<Icon> _scorekeeper = [];

  int _questionNum = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = _questionz[_questionNum].questionAnswer;

    if (correctAnswer == userPickedAnswer)
      _scorekeeper.add(Icon(Icons.check, color: Colors.green));
    else
      _scorekeeper.add(Icon(Icons.close, color: Colors.red));
  }

  void nextQuestion(BuildContext context) {
    if (_questionNum + 1 < _questionz.length)
      _questionNum++;
    else {
      var alertStyle = AlertStyle(alertAlignment: Alignment.bottomCenter);
      // Reusable alert style
      var alertStyle2 = AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.red,
          ),
          constraints: BoxConstraints.expand(width: 300),
          //First to chars "55" represents transparency of color
          overlayColor: Color(0x55000000),
          alertElevation: 0,
          alertAlignment: Alignment.center);
      Alert(
        context: context,
        title: "Finished!",
        desc: "You have reached the end of the quiz",
        buttons: [
          DialogButton(
            child: Text(
              "Replay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
        style: alertStyle2,
      ).show();
      _questionNum = 0;
      _scorekeeper.clear();
    }
  }

  String getQuestionName() {
    return _questionz[_questionNum].questionText;
  }

  List<Icon> getScoreKeeper() {
    return _scorekeeper;
  }
}
