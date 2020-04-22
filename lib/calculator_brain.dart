import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight}) {
    this._bmi = _bmi = (weight / pow(height / 100, 2));
  }

  final int height;
  final int weight;
  double _bmi;

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Eat Less';
    } else if (_bmi > 18.5) {
      return 'Huzzah';
    } else {
      return 'Eat MOAR';
    }
  }
}
