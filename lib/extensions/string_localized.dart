import 'package:easy_localization/easy_localization.dart';

extension ImprovedLocalizedString on String {
  String localized({Map<String, String>? args}) => this.tr(namedArgs: args);
}
