import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:boardzone_app/pages/bottomnav.dart'; 
import 'package:boardzone_app/pages/login.dart';
import 'package:boardzone_app/pages/signup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoardZone', 
      debugShowCheckedModeBanner: false, // remove the corner label
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 3. THIS IS THE KEY CHANGE:
      // Instead of showing 'Home' or 'Login' directly, we show the Navigation Bar wrapper.
      home: LoginScreen(), 
    );
  }
}