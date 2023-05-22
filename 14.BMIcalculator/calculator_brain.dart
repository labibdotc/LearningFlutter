import 'dart:math';

class CalculatorBrain{
  final int weight;
  final int age;
  final int height;


  CalculatorBrain({required this.weight,required this.age, required this.height});
  double _bmi = 0;
  String _category = '';

  double calculateBmi(){
    _bmi = (weight/(pow(height,2)/10000));
    return (weight/(pow(height,2)/10000));
  }
  String category() {

    _category = _bmi <= 18.5 ? 'Underweight' : (_bmi <= 24.9 ? 'Normal' : ((_bmi <= 29.9 ? 'Overweight' : 'Obesity')));
    return _bmi <= 18.5 ? 'Underweight' : (_bmi <= 24.9 ? 'Normal' : ((_bmi <= 29.9 ? 'Overweight' : 'Obesity')));
  }
  String description() {
    String res = '';
    if(_category == 'Underweight') {
      res = 'You have a lower than normal body weight. You can eat a bit more.';
    } else if(_category == 'Normal') {
      res = 'You have a normal body weight. Good job!';
    } else {
      res = 'You have a higher than normal body weight. Try to exercise more.';
    }
    return res;
  }

}