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
    apiKey: 'AIzaSyAVZbkBrG_CQfzpiPX12acKfPeVVdnMSyk',
    appId: '1:588002334455:web:4830f7d7eafd5d727b65f2',
    messagingSenderId: '588002334455',
    projectId: 'auth-first-step-shopify',
    authDomain: 'auth-first-step-shopify.firebaseapp.com',
    storageBucket: 'auth-first-step-shopify.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjuYYXiULQ0q-nau8hD-DZimnj_ETQjPg',
    appId: '1:588002334455:android:7553a4a6a71382cb7b65f2',
    messagingSenderId: '588002334455',
    projectId: 'auth-first-step-shopify',
    storageBucket: 'auth-first-step-shopify.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOMZaFyEVXpVgWclUFH4rlWIkMs7WbKgc',
    appId: '1:588002334455:ios:7448ec628d770e077b65f2',
    messagingSenderId: '588002334455',
    projectId: 'auth-first-step-shopify',
    storageBucket: 'auth-first-step-shopify.appspot.com',
    iosBundleId: 'com.example.authFirstStepShopify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOMZaFyEVXpVgWclUFH4rlWIkMs7WbKgc',
    appId: '1:588002334455:ios:9aa50a2e61465e497b65f2',
    messagingSenderId: '588002334455',
    projectId: 'auth-first-step-shopify',
    storageBucket: 'auth-first-step-shopify.appspot.com',
    iosBundleId: 'com.example.authFirstStepShopify.RunnerTests',
  );
}
