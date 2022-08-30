abstract class CrashManager {
  void recordFatalError();
  void recordErrorOutsideOfContext();
  void toogleCrashReporting();
  bool isCrashReportingEnabled();
}
