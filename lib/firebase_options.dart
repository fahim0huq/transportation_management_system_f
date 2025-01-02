// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDvym5anWDPfa0h1xVilBGLgNRr-3YVPyM',
    appId: '1:35665806099:web:cbd9901885e246f8dc10e6',
    messagingSenderId: '35665806099',
    projectId: 'transportation-cd496',
    authDomain: 'transportation-cd496.firebaseapp.com',
    storageBucket: 'transportation-cd496.firebasestorage.app',
    measurementId: 'G-RZN5TEHLLT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc1P3w-B2r2PH3FkHAPwsK822-X5JgRJ0',
    appId: '1:35665806099:android:27f71565a4f0cc0ddc10e6',
    messagingSenderId: '35665806099',
    projectId: 'transportation-cd496',
    storageBucket: 'transportation-cd496.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZTLbIfDtv3WAnqq1ZghJeDjj9lTVQe9U',
    appId: '1:35665806099:ios:cfdca34594a6e44edc10e6',
    messagingSenderId: '35665806099',
    projectId: 'transportation-cd496',
    storageBucket: 'transportation-cd496.firebasestorage.app',
    iosBundleId: 'com.example.tmsIiuc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDvym5anWDPfa0h1xVilBGLgNRr-3YVPyM',
    appId: '1:35665806099:web:cbd9901885e246f8dc10e6',
    messagingSenderId: '35665806099',
    projectId: 'transportation-cd496',
    authDomain: 'transportation-cd496.firebaseapp.com',
    storageBucket: 'transportation-cd496.firebasestorage.app',
    measurementId: 'G-RZN5TEHLLT',
  );
}
