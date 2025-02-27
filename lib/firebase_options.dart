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
    apiKey: 'AIzaSyCSfurzlb6eZTAtxFoU8J_2HO_688ttE-o',
    appId: '1:753585201226:web:bf686290febd62119b86b3',
    messagingSenderId: '753585201226',
    projectId: 'evapp-6e864',
    authDomain: 'evapp-6e864.firebaseapp.com',
    databaseURL: 'https://evapp-6e864-default-rtdb.firebaseio.com',
    storageBucket: 'evapp-6e864.firebasestorage.app',
    measurementId: 'G-4MR22PWV8J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9jXXTGwSa-Jwbw4mFqV73l_SS4NUYQBI',
    appId: '1:753585201226:android:8b22db0c42bf8cba9b86b3',
    messagingSenderId: '753585201226',
    projectId: 'evapp-6e864',
    databaseURL: 'https://evapp-6e864-default-rtdb.firebaseio.com',
    storageBucket: 'evapp-6e864.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArAIJElOFsBYMtUTbnvD69OGhOpzboqaY',
    appId: '1:753585201226:ios:368e9934866fe2169b86b3',
    messagingSenderId: '753585201226',
    projectId: 'evapp-6e864',
    databaseURL: 'https://evapp-6e864-default-rtdb.firebaseio.com',
    storageBucket: 'evapp-6e864.firebasestorage.app',
    iosBundleId: 'com.example.ev',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArAIJElOFsBYMtUTbnvD69OGhOpzboqaY',
    appId: '1:753585201226:ios:368e9934866fe2169b86b3',
    messagingSenderId: '753585201226',
    projectId: 'evapp-6e864',
    databaseURL: 'https://evapp-6e864-default-rtdb.firebaseio.com',
    storageBucket: 'evapp-6e864.firebasestorage.app',
    iosBundleId: 'com.example.ev',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCSfurzlb6eZTAtxFoU8J_2HO_688ttE-o',
    appId: '1:753585201226:web:a1350a09f108e81c9b86b3',
    messagingSenderId: '753585201226',
    projectId: 'evapp-6e864',
    authDomain: 'evapp-6e864.firebaseapp.com',
    databaseURL: 'https://evapp-6e864-default-rtdb.firebaseio.com',
    storageBucket: 'evapp-6e864.firebasestorage.app',
    measurementId: 'G-9ZHNQ67VLN',
  );
}
