import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/bmi/bmi_view_model.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

import '../../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final BmiViewModel viewModel = BmiViewModel();
  final TextStyle textStyle = const TextStyle(fontSize: 18);

  @override
  void initState() {
    viewModel.process();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              ToggleButtons(
                  isSelected: viewModel.isSelected,
                  onPressed: (index) {
                    setState(() {
                      viewModel.toggleMeasure(index);
                    });
                  },
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Metric', style: textStyle)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Imperial', style: textStyle))
                  ]),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: (InputDecoration(
                      hintText: viewModel.getHeightHintMessage())),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    controller: txtWeight,
                    keyboardType: TextInputType.number,
                    decoration: (InputDecoration(
                        hintText: viewModel.getWeightHintMessage()))),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      viewModel.computeInfos(txtHeight.text, txtWeight.text);
                    });
                  },
                  child: Text(
                    'Calculate BMI',
                    style: textStyle,
                  )),
              Text(viewModel.result, style: textStyle)
            ]),
          ),
        ));
  }
}
