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
    apiKey: 'AIzaSyAcXOUxRWym9hqmVhWvYdPd3-wHa6g9Uks',
    appId: '1:948167491315:web:37d3ff58771a5d57910186',
    messagingSenderId: '948167491315',
    projectId: 'sch-app-e839b',
    authDomain: 'sch-app-e839b.firebaseapp.com',
    databaseURL: 'https://sch-app-e839b-default-rtdb.firebaseio.com',
    storageBucket: 'sch-app-e839b.appspot.com',
    measurementId: 'G-53DHWT8N5B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-0S0EraxZTEEU_VRM1_L0-Q9WNFwKG_A',
    appId: '1:948167491315:android:0f079e89b5cc7502910186',
    messagingSenderId: '948167491315',
    projectId: 'sch-app-e839b',
    databaseURL: 'https://sch-app-e839b-default-rtdb.firebaseio.com',
    storageBucket: 'sch-app-e839b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4NEIdDhAZGl0MuyQV6DuzaUyz0T2wk4k',
    appId: '1:948167491315:ios:af18508ed5f1eda4910186',
    messagingSenderId: '948167491315',
    projectId: 'sch-app-e839b',
    databaseURL: 'https://sch-app-e839b-default-rtdb.firebaseio.com',
    storageBucket: 'sch-app-e839b.appspot.com',
    iosClientId:
        '948167491315-p86i4kb0so71ua9r8c8d91f08b23altv.apps.googleusercontent.com',
    iosBundleId: 'com.example.applicationPaperwork',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4NEIdDhAZGl0MuyQV6DuzaUyz0T2wk4k',
    appId: '1:948167491315:ios:8d3fd753d2ec8b88910186',
    messagingSenderId: '948167491315',
    projectId: 'sch-app-e839b',
    databaseURL: 'https://sch-app-e839b-default-rtdb.firebaseio.com',
    storageBucket: 'sch-app-e839b.appspot.com',
    iosClientId:
        '948167491315-r95kqdhfu61pq6bds6hah72fo31tis7m.apps.googleusercontent.com',
    iosBundleId: 'com.example.applicationPaperwork.RunnerTests',
  );
}
