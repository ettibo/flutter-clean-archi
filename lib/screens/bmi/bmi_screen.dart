import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:api/dependency_injection.dart';

import 'package:globo_fitness/screens/bmi/bmi_view_model.dart';
import 'package:globo_fitness/shared/platform_text_wrapper.dart';
import 'package:globo_fitness/shared/platform_textfield.dart';

import 'package:globo_fitness/translations/locale_keys.g.dart';
import 'package:globo_fitness/extensions/string_localized.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final BmiViewModelBase viewModel =
      DependecyInjection.instance.get<BmiViewModelBase>();

  final double horizontalPadding = 16;
  final textStyle = const TextStyle(fontSize: 18);

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
            child: textPlatform(
                content: LocaleKeys.bmi_screen_metric_unit_name.localized(),
                style: textStyle)),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: textPlatform(
                content: LocaleKeys.bmi_screen_imperial_unit_name.localized(),
                style: textStyle))
      ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Observer(builder: _observerBuilder),
      ),
    );
  }

  Widget _observerBuilder(BuildContext context) => SingleChildScrollView(
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
            getPlatformTextField(
              context: context,
              controller: viewModel.txtHeightController,
              onChanged: viewModel.setHeight,
              onSubmitted: (_) => viewModel.weightFocusNode.requestFocus,
              hintText: LocaleKeys.bmi_screen_hint_bmi_text_field.localized(
                args: {
                  'unit':
                      LocaleKeys.bmi_screen_height.localized().toLowerCase(),
                  'system': viewModel.getHeightUnitHint(context)
                },
              ),
            ),
            // Weight TextField
            getPlatformTextField(
              context: context,
              controller: viewModel.txtWeightController,
              onChanged: viewModel.setWeight,
              focusNode: viewModel.weightFocusNode,
              hintText: LocaleKeys.bmi_screen_hint_bmi_text_field.localized(
                args: {
                  'unit':
                      LocaleKeys.bmi_screen_weight.localized().toLowerCase(),
                  'system': viewModel.getWeightUnitHint(context),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: textPlatform(
                content: viewModel.getBmiString(context),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
}
