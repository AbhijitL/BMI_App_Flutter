import 'dart:math';


class CalculatorBMI{
  CalculatorBMI({this.height, this.weight});
  int height;
  int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>25){
      return 'Overweight';
    }else if(_bmi >18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi>25){
      return 'You have a higher than normal body weight: Try Exercise more';
    }else if(_bmi >18.5){
      return 'You have a normal body weight: Keep it up';
    }else{
      return 'You have a lower than normal body weight: Try eating more';
    }
  }
}