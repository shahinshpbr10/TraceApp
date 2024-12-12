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
    apiKey: 'AIzaSyDEJPRuJujWD68-cNBzk4RWl2x4xmAp_uY',
    appId: '1:455249285995:web:e14e2c3c910fd084c0722e',
    messagingSenderId: '455249285995',
    projectId: 'trace-101d3',
    authDomain: 'trace-101d3.firebaseapp.com',
    storageBucket: 'trace-101d3.firebasestorage.app',
    measurementId: 'G-72J0TZ63PR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9OAE_3rK7gJv3DyQXUebSxvKjxc-VSbM',
    appId: '1:455249285995:android:9d2d362e89559353c0722e',
    messagingSenderId: '455249285995',
    projectId: 'trace-101d3',
    storageBucket: 'trace-101d3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA4_kyaOFS8tEEBqmc6dG-jnKfNxmtqvU',
    appId: '1:455249285995:ios:a740cfce87611321c0722e',
    messagingSenderId: '455249285995',
    projectId: 'trace-101d3',
    storageBucket: 'trace-101d3.firebasestorage.app',
    iosBundleId: 'com.trace.bus.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDA4_kyaOFS8tEEBqmc6dG-jnKfNxmtqvU',
    appId: '1:455249285995:ios:4e3d63ecbb6c2a62c0722e',
    messagingSenderId: '455249285995',
    projectId: 'trace-101d3',
    storageBucket: 'trace-101d3.firebasestorage.app',
    iosBundleId: 'com.example.traceapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEJPRuJujWD68-cNBzk4RWl2x4xmAp_uY',
    appId: '1:455249285995:web:48097e7d94f001b1c0722e',
    messagingSenderId: '455249285995',
    projectId: 'trace-101d3',
    authDomain: 'trace-101d3.firebaseapp.com',
    storageBucket: 'trace-101d3.firebasestorage.app',
    measurementId: 'G-WDCYP3LHJT',
  );
}
