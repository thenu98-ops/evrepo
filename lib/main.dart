import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import '../services/firestore.dart';
import 'firebase_options.dart';





void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //     apiKey: 'AIzaSyCSfurzlb6eZTAtxFoU8J_2HO_688ttE-o',
  //     authDomain: 'noreply@evapp-6e864.firebaseapp.com',
  //     // databaseURL: 'https://cradlecare-1.firebaseio.com',
  //     projectId: 'evapp-6e864',
  //     storageBucket: 'evapp-6e864.appspot.com',
  //     messagingSenderId: '753585201226',
  //     appId: '1:753585201226:android:8b22db0c42bf8cba9b86b3', 
  //     // measurementId: 'G-1',
  // ),
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    
    
  );
FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  Login(),
    );
  }
}

