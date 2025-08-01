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
    apiKey: 'AIzaSyCd-7ko2htncXBb0YcaqPwZuJ13XkgcP6s',
    appId: '1:608848829670:web:d66b432fb3582d1849af27',
    messagingSenderId: '608848829670',
    projectId: 'estante-af0b7',
    authDomain: 'estante-af0b7.firebaseapp.com',
    storageBucket: 'estante-af0b7.firebasestorage.app',
    measurementId: 'G-QD41V3VPJQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt7iR70wCm37mJ8331CUxzKspQtyfAyO8',
    appId: '1:608848829670:android:b5d326566cfad82c49af27',
    messagingSenderId: '608848829670',
    projectId: 'estante-af0b7',
    storageBucket: 'estante-af0b7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7m4ADck0FMgsRwjF6lghd0WQjWKQm7CE',
    appId: '1:608848829670:ios:689577370ffae9f849af27',
    messagingSenderId: '608848829670',
    projectId: 'estante-af0b7',
    storageBucket: 'estante-af0b7.firebasestorage.app',
    iosBundleId: 'com.example.bookApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7m4ADck0FMgsRwjF6lghd0WQjWKQm7CE',
    appId: '1:608848829670:ios:689577370ffae9f849af27',
    messagingSenderId: '608848829670',
    projectId: 'estante-af0b7',
    storageBucket: 'estante-af0b7.firebasestorage.app',
    iosBundleId: 'com.example.bookApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCd-7ko2htncXBb0YcaqPwZuJ13XkgcP6s',
    appId: '1:608848829670:web:2fd605d0db75c00449af27',
    messagingSenderId: '608848829670',
    projectId: 'estante-af0b7',
    authDomain: 'estante-af0b7.firebaseapp.com',
    storageBucket: 'estante-af0b7.firebasestorage.app',
    measurementId: 'G-ZDYC2WH95V',
  );
}
