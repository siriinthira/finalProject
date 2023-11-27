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
    apiKey: 'AIzaSyB-Ipf0_o5X6wKeaSb1YbFUPhS7E1gkUVw',
    appId: '1:1039168860002:web:59b1e905ece6f6855e063b',
    messagingSenderId: '1039168860002',
    projectId: 'sxn-293df',
    authDomain: 'sxn-293df.firebaseapp.com',
    databaseURL: 'https://sxn-293df-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sxn-293df.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZgQDXYVkTQkpeM1Y_wi3EGQX_uKIXmPE',
    appId: '1:1039168860002:android:6353b2d7038bce345e063b',
    messagingSenderId: '1039168860002',
    projectId: 'sxn-293df',
    databaseURL: 'https://sxn-293df-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sxn-293df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNLy3LsYgMY6NbCajjWmtuxUKXAANsFCk',
    appId: '1:1039168860002:ios:8105123c250243805e063b',
    messagingSenderId: '1039168860002',
    projectId: 'sxn-293df',
    databaseURL: 'https://sxn-293df-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sxn-293df.appspot.com',
    androidClientId: '1039168860002-3q03grc2en4t4qc9jhd068pkj9h89mlm.apps.googleusercontent.com',
    iosClientId: '1039168860002-e9je5q00ocrgpl334qja3q95qlirpv3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNLy3LsYgMY6NbCajjWmtuxUKXAANsFCk',
    appId: '1:1039168860002:ios:8e0e407e84b43b9b5e063b',
    messagingSenderId: '1039168860002',
    projectId: 'sxn-293df',
    databaseURL: 'https://sxn-293df-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sxn-293df.appspot.com',
    androidClientId: '1039168860002-3q03grc2en4t4qc9jhd068pkj9h89mlm.apps.googleusercontent.com',
    iosClientId: '1039168860002-lq3v0mll4ktsbfm5v1539a1u5qgvk674.apps.googleusercontent.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
