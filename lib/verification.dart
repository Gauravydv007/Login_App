import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/home.dart';
import 'package:my_app2/new.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot) {

          if (snapshot.hasData){
            return Homepage();
          }
          else{
            return Authpage();
          }
         }
      )


    );
  }
}