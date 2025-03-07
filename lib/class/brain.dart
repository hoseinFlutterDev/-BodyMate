import 'dart:math';

class Brain {
  Brain({required this.hight, required this.weight});
  final int weight;
  final int hight;
  double? _bmi;
  String calculateBmi() {
    _bmi = weight / pow(hight / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getDetail() {
    if (_bmi! >= 25) {
      return "Your BMI is higher than normal, so you should eat a little less and exercise more.";
    } else if (_bmi! > 18.5) {
      return 'Your BMI is normal, well done!';
    } else {
      return 'Your BMI is slightly lower than normal, you can eat a little more';
    }
  }
}
