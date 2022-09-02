import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/bmi/bmi_view_model.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final BmiViewModelBase viewModel =
      DependecyInjection.instance.get<BmiViewModelBase>();

  final TextStyle textStyle = const TextStyle(fontSize: 18);
  final double horizontalPadding = 16;

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  List<Widget> getToggleButtons() => [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(LocaleKeys.metricUnitName.tr(), style: textStyle)),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(LocaleKeys.imperialUnitName.tr(), style: textStyle))
      ];

  Widget getTextField(
          {TextEditingController? controller,
          Function(String)? onChanged,
          void Function(String)? onSubmitted,
          String? hintText,
          FocusNode? focusNode,
          TextInputType keyboardType =
              const TextInputType.numberWithOptions(signed: true),
          double paddingAll = 25}) =>
      Padding(
        padding: EdgeInsets.all(paddingAll),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          keyboardType: keyboardType,
          decoration: InputDecoration(hintText: hintText),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Observer(builder: observerBuilder),
        ),
      ),
    );
  }

  Widget observerBuilder(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              isSelected: viewModel.isSelected,
              onPressed: viewModel.toggleMeasure,
              children: getToggleButtons(),
            ),

            // Height TextField
            getTextField(
              controller: viewModel.txtHeightController,
              onChanged: viewModel.setHeight,
              onSubmitted: (_) => viewModel.weightFocusNode.requestFocus(),
              hintText: LocaleKeys.hintBmiTextField.tr(
                namedArgs: {
                  'unit': LocaleKeys.height.tr().toLowerCase(),
                  'system': viewModel.getHeightUnitHint(context)
                },
              ),
            ),
            // Weight TextField
            getTextField(
              controller: viewModel.txtWeightController,
              onChanged: viewModel.setWeight,
              focusNode: viewModel.weightFocusNode,
              hintText: LocaleKeys.hintBmiTextField.tr(
                namedArgs: {
                  'unit': LocaleKeys.weight.tr().toLowerCase(),
                  'system': viewModel.getWeightUnitHint(context),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                viewModel.getBmiString(context),
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
}
