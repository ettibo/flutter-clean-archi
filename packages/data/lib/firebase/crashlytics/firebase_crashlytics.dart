import 'dart:isolate';

import 'package:flutter/material.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:api/models/app/managers/crash.dart';

class CrashlyticsFirebase implements CrashManager {
  final FirebaseCrashlytics _instance = FirebaseCrashlytics.instance;

  // Automatically catch all errors that are thrown within the Flutter framework by overriding FlutterError.onError
  @override
  void recordFatalError() =>
      FlutterError.onError = _instance.recordFlutterFatalError;

  // To catch errors that happen outside of the Flutter context, install an error listener on the current Isolate:
  @override
  void recordErrorOutsideOfContext() =>
      Isolate.current.addErrorListener(RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await _instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
          fatal: true,
        );
      }).sendPort);

  @override
  void toogleCrashReporting() => _instance.setCrashlyticsCollectionEnabled(
      !_instance.isCrashlyticsCollectionEnabled);

  @override
  bool isCrashReportingEnabled() => _instance.isCrashlyticsCollectionEnabled;
}
