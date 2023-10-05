import 'package:flutter/material.dart';

import 'package:my_app2/home.dart';
import 'package:my_app2/Loginpage.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
final userNameContoller = TextEditingController();
final passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
    
        appBar: AppBar(
          title: const Text("Signup Page"),
        ),
        body: Container(
      
      
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/computer.jpg"), 
          fit: BoxFit.cover),
      ),

      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              
                child:Card(
                  child: Column(
                    children: <Widget>[
                       Form(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration( hintText: "Enter Username" , labelText: "Username" ),
                              ),
                              const SizedBox( height: 20,),
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration( hintText: "Create Password" , labelText: "Password" ),
                              ),
                              const SizedBox( height: 20,),
                             
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration( hintText: "enter Password" , labelText: " Re-enter Password" ),
                              ),
                             const SizedBox( height: 20,
                             ),
                             ElevatedButton.icon( 
                              
                              onPressed:(){
      
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),
                              ),
                              );
      
                             }, icon: const Icon(Icons.arrow_circle_right), 
                             label: Text("sign Up"),
      
                             
                             )
                             
                            ],
                          ),
                        )
                        ),
                        
          
                    ],
                      
                  ),
                ),
              ),
              ),
      ), 
            


        )
        ),
    );


    
  }
}
