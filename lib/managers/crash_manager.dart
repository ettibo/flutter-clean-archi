import 'package:api/models/app/managers/crash.dart';

import 'package:api/dependency_injection.dart';

final CrashManager _crashManager =
    DependecyInjection.instance.get<CrashManager>();

void activateCrashReportIfEnabled() {
  if (_crashManager.isCrashReportingEnabled()) {
    _crashManager.recordErrorOutsideOfContext();
    _crashManager.recordFatalError();
  }
}

void toggleCrashReporting() => _crashManager.toogleCrashReporting();
