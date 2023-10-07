// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//    Future<String> signUpUser({
//     required String email,
//      required String password,
//       required String username,
//        required String bio,
//       //  required UintBList file,



//   })
//   async{

//     String res = "Some error occured";
//     try {
//       if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file != null){

//        UserCredential cred = await _auth.createUserWithEmailAndPassword( email: email , password:password );
      
       
      
//       }

//     }catch(err){
//       res = err.toString();
//     }
//     return res;
//   }

// }