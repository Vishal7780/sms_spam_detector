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
    apiKey: 'AIzaSyAiZh4wNdgC4rJbyFBWtwUT3AbQC3Sc2E4',
    appId: '1:604381495836:web:a1bbb8fbfdbb7f1f5315d9',
    messagingSenderId: '604381495836',
    projectId: 'smsspamdetection-c6035',
    authDomain: 'smsspamdetection-c6035.firebaseapp.com',
    storageBucket: 'smsspamdetection-c6035.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwOMVFlpaCyE1EBWz-PBQ5tZjN_q3vuxw',
    appId: '1:604381495836:android:49fbd645eac49c7c5315d9',
    messagingSenderId: '604381495836',
    projectId: 'smsspamdetection-c6035',
    storageBucket: 'smsspamdetection-c6035.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASSOdd6hFEwM03TRc_1CgiaIIJN-K00Ow',
    appId: '1:604381495836:ios:dd988f587d3c5eea5315d9',
    messagingSenderId: '604381495836',
    projectId: 'smsspamdetection-c6035',
    storageBucket: 'smsspamdetection-c6035.appspot.com',
    iosClientId: '604381495836-lvr509k2f106c0uc2iidt3vo1s11o3te.apps.googleusercontent.com',
    iosBundleId: 'com.example.dummy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASSOdd6hFEwM03TRc_1CgiaIIJN-K00Ow',
    appId: '1:604381495836:ios:dd988f587d3c5eea5315d9',
    messagingSenderId: '604381495836',
    projectId: 'smsspamdetection-c6035',
    storageBucket: 'smsspamdetection-c6035.appspot.com',
    iosClientId: '604381495836-lvr509k2f106c0uc2iidt3vo1s11o3te.apps.googleusercontent.com',
    iosBundleId: 'com.example.dummy',
  );
}
