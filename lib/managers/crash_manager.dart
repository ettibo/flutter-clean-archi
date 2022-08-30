import 'package:api/models/app/managers/crash.dart';

import 'package:api/dependency_injection.dart';

final CrashManager crashManager =
    DependecyInjection.instance.get<CrashManager>();

void activateCrashReportIfEnabled() {
  if (crashManager.isCrashReportingEnabled()) {
    crashManager.recordErrorOutsideOfContext();
    crashManager.recordFatalError();
  }
}

void toggleCrashReporting() => crashManager.toogleCrashReporting();
