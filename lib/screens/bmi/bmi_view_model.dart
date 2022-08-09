enum MeasureSystem { metric, imperial }

class BmiViewModel {
  String result = '';
  MeasureSystem system = MeasureSystem.metric;
  double? height;
  double? weight;
  late List<bool> isSelected;

  void process() {
    isSelected = _generateIsSelected();
  }

  void toggleMeasure(index) {
    system = index == 0 ? MeasureSystem.metric : MeasureSystem.imperial;
    isSelected = _generateIsSelected();
  }

  String getHeightHintMessage() {
    String systemValue = system == MeasureSystem.metric ? 'meters' : 'inch';
    return 'Please insert your height in $systemValue';
  }

  String getWeightHintMessage() {
    String systemValue = system == MeasureSystem.metric ? 'kilos' : 'pounds';
    return 'Please insert your weight in $systemValue';
  }

  void computeInfos(String heightValue, String weightValue) {
    double height = double.tryParse(heightValue) ?? 0;
    double weight = double.tryParse(weightValue) ?? 0;
    double multiplier = system == MeasureSystem.metric ? 1 : 703;
    double bmi = 0;
    bmi = weight * multiplier / (height * height);
    result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
  }

  List<bool> _generateIsSelected() =>
      [system == MeasureSystem.metric, system == MeasureSystem.imperial];
}
