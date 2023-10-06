import 'package:flutter/material.dart';

import 'package:my_app2/home.dart';



  class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return 
    
         Container(



      // check
      
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/5172658.jpg"), 
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
                              
                              const SizedBox( height: 20,),
                              TextFormField(
                                
                                decoration: const InputDecoration( hintText: "Username" , labelText: "Username" ),
                              ),
                              const SizedBox( height: 20,),
                             
                              TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration( hintText: "Enter Password" , labelText: " Enter Password" ),
                              ),
                             const SizedBox( height: 20,
                             ),
                             ElevatedButton.icon( 
                              
                              onPressed:(){
      
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),
                              ),
                             
                              );
      
                             }, icon: const Icon(Icons.arrow_circle_right), 
                             label: Text("Login"),
      
                             
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
            


        );
    
        
    
  }
}
