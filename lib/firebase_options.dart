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
    apiKey: 'AIzaSyDGMt5mtpUK8W7sPTTPw8wRCJ0hIbYvQTg',
    appId: '1:1082842985559:web:aa47e614634373be471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    authDomain: 'hideyuki-firebase.firebaseapp.com',
    storageBucket: 'hideyuki-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSlSYSeoa9fA43KGdCPov3LtAMeXQZ0BY',
    appId: '1:1082842985559:android:2e1831b69d3f6204471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-N8lZNZRZl5PCVMAhxTkA_edocgPYm7Q',
    appId: '1:1082842985559:ios:f49c708e527fa681471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
    androidClientId: '1082842985559-a0lh8n0fi1ohs49v0n991jg5ui6flo2v.apps.googleusercontent.com',
    iosClientId: '1082842985559-efq7rf2upkbr7sl1g84e0l3gll6ljg6g.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushSender',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-N8lZNZRZl5PCVMAhxTkA_edocgPYm7Q',
    appId: '1:1082842985559:ios:ac348d6c2ec6f63f471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
    androidClientId: '1082842985559-a0lh8n0fi1ohs49v0n991jg5ui6flo2v.apps.googleusercontent.com',
    iosClientId: '1082842985559-clu9qkgdlu5ru4sjau2d96ij4rofqqrg.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushSender.RunnerTests',
  );
}
