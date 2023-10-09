import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/SignUp.dart';
import 'package:my_app2/firebase_options.dart';
import 'package:my_app2/new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app2/verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    

  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
    ),
  );
}
