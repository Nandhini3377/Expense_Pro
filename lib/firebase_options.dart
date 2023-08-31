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
    apiKey: 'AIzaSyCtgs6ZjsFwZ-JRpZCtj6KkJfNheRlb_Rw',
    appId: '1:87236432677:web:2e54621ac2eb97537b40cc',
    messagingSenderId: '87236432677',
    projectId: 'expensify-b55bd',
    authDomain: 'expensify-b55bd.firebaseapp.com',
    storageBucket: 'expensify-b55bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZX0oJiZrlVnhF3v0JSflbbqqz6a6uW5o',
    appId: '1:87236432677:android:381158d24e258cda7b40cc',
    messagingSenderId: '87236432677',
    projectId: 'expensify-b55bd',
    storageBucket: 'expensify-b55bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAc4aeMKqsepUIuNo5HKDhQb8TnlS0D1GE',
    appId: '1:87236432677:ios:74308d21997429ec7b40cc',
    messagingSenderId: '87236432677',
    projectId: 'expensify-b55bd',
    storageBucket: 'expensify-b55bd.appspot.com',
    iosClientId: '87236432677-sebo0pumur80c1kld2sm3snrfjvaivq3.apps.googleusercontent.com',
    iosBundleId: 'com.example.expenseTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAc4aeMKqsepUIuNo5HKDhQb8TnlS0D1GE',
    appId: '1:87236432677:ios:1f1f6571838a63017b40cc',
    messagingSenderId: '87236432677',
    projectId: 'expensify-b55bd',
    storageBucket: 'expensify-b55bd.appspot.com',
    iosClientId: '87236432677-qlulhsoljruk4d9a4haq8rlu0kl3l3un.apps.googleusercontent.com',
    iosBundleId: 'com.example.expenseTracker.RunnerTests',
  );
}
