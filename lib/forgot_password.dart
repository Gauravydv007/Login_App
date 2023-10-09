

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/services/auth_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
final _emailController = TextEditingController();

@override
void dispose() {
  _emailController.dispose();
  super.dispose();
}
Future passwordReset() async{

try {
  await FirebaseAuth.instance
  .sendPasswordResetEmail( email: _emailController.text.trim());

  // ignore: use_build_context_synchronously
  showDialog(
     context: context,
     builder: (context){
      return const AlertDialog(
        content: Text( 'Password reset link sent! check email')
        
      );
}
  );
}
on FirebaseAuthException catch(e) {
 print(e);
 // ignore: use_build_context_synchronously
 showDialog(
     context: context,
     builder: (context){
      return AlertDialog(
        content: Text(e.message.toString()),

      );
     }

 );

}
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
        body:  Column(
          children:  [
             Padding(
              padding: EdgeInsets.all(20),
               child: Text('Enter your Email', 
               
                   ),
             ),
             

             Padding(
              padding: const EdgeInsets.symmetric( horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Email' ,
                fillColor: Colors.grey[200],
                filled: true,
                    ),
                    
              ),
              ),
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){
                 passwordReset(); 

              },
              child: Text('Reset Password'),
              color: Colors.amber,
              )
          ]
          ),

    );
  }
}