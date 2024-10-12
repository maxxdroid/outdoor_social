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
        return macos;
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
    apiKey: 'AIzaSyBa7K6z13ozqL-x8r1XjwHYge73qwdsed4',
    appId: '1:499627515169:web:a60e3f5dd734f642013260',
    messagingSenderId: '499627515169',
    projectId: 'outdoor-social',
    authDomain: 'outdoor-social.firebaseapp.com',
    storageBucket: 'outdoor-social.appspot.com',
    measurementId: 'G-KDG9M5XS89',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoSg7piknvsvYOvlRJ2i95wkt19m9sRMY',
    appId: '1:499627515169:android:51f47a23b19b4da1013260',
    messagingSenderId: '499627515169',
    projectId: 'outdoor-social',
    storageBucket: 'outdoor-social.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYp1ywCRI1HfeAInk-f-TiPmprjXCS2sM',
    appId: '1:499627515169:ios:53435e97fab6aca7013260',
    messagingSenderId: '499627515169',
    projectId: 'outdoor-social',
    storageBucket: 'outdoor-social.appspot.com',
    iosBundleId: 'com.example.outdoorSocial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYp1ywCRI1HfeAInk-f-TiPmprjXCS2sM',
    appId: '1:499627515169:ios:53435e97fab6aca7013260',
    messagingSenderId: '499627515169',
    projectId: 'outdoor-social',
    storageBucket: 'outdoor-social.appspot.com',
    iosBundleId: 'com.example.outdoorSocial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBa7K6z13ozqL-x8r1XjwHYge73qwdsed4',
    appId: '1:499627515169:web:e3a9b27b69b5003a013260',
    messagingSenderId: '499627515169',
    projectId: 'outdoor-social',
    authDomain: 'outdoor-social.firebaseapp.com',
    storageBucket: 'outdoor-social.appspot.com',
    measurementId: 'G-GE1D0LS8XK',
  );
}
