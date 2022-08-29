// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDIFKDZFQU3Dl5AKQpDRncLSxY5f3_7G2Q',
    appId: '1:87289715144:web:ecd19391694e2ebc2348fd',
    messagingSenderId: '87289715144',
    projectId: 'flutter-clean-archi',
    authDomain: 'flutter-clean-archi.firebaseapp.com',
    storageBucket: 'flutter-clean-archi.appspot.com',
    measurementId: 'G-J9F2W0M191',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArp-kbcjNhNqUYdydF4SNV_5xW-qb715Y',
    appId: '1:87289715144:android:f1313fa023e5dd082348fd',
    messagingSenderId: '87289715144',
    projectId: 'flutter-clean-archi',
    storageBucket: 'flutter-clean-archi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpzVWpcixIUCAw91pj4apHtAGToSqn10E',
    appId: '1:87289715144:ios:1a30f2095ba248412348fd',
    messagingSenderId: '87289715144',
    projectId: 'flutter-clean-archi',
    storageBucket: 'flutter-clean-archi.appspot.com',
    iosClientId: '87289715144-3k9rkgkrv2ej91ruc1ma3gl0uico6kee.apps.googleusercontent.com',
    iosBundleId: 'com.example.globoFitness',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpzVWpcixIUCAw91pj4apHtAGToSqn10E',
    appId: '1:87289715144:ios:1a30f2095ba248412348fd',
    messagingSenderId: '87289715144',
    projectId: 'flutter-clean-archi',
    storageBucket: 'flutter-clean-archi.appspot.com',
    iosClientId: '87289715144-3k9rkgkrv2ej91ruc1ma3gl0uico6kee.apps.googleusercontent.com',
    iosBundleId: 'com.example.globoFitness',
  );
}
