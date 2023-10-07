



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/verification.dart';
import 'package:my_app2/home.dart';



  class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //  final user = FirebaseAuth.instance.currentUser!;
  final  emailContoller = TextEditingController();

  final passwordContoller = TextEditingController();

void signUserIn() async{
  showDialog(
    context: context,
     builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );

     },
     );
 

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailContoller.text, 
     password: passwordContoller.text,
     );

    //  Navigator.pop(context);
}
on FirebaseAuthException catch (e){
   Navigator.pop(context);

  if (e.code == 'user-not-found'){
    wrongEmailMessage();
  }
  else if(e.code == 'wrong-password'){
    wrongPasswordMessage();
  }
}

}

void wrongEmailMessage () {
  showDialog(
    context: context,
     builder: (context){
      return const AlertDialog(
        title: Text("Incorrect Email"),
      );
      
     },
      );
}

      void wrongPasswordMessage () {
  showDialog(
    context: context,
     builder: (context){
      return  const AlertDialog(
        title: Text("Incorrect Password")
      );
      
     }
      );
      }


     

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
                                controller: emailContoller,
                                decoration: const InputDecoration( hintText: "Username" , labelText: "Username" ),
                              ),
                              const SizedBox( height: 20,),
                             
                              TextFormField(
                                controller: passwordContoller,
                                obscureText: true,
                                decoration: const InputDecoration( hintText: "Enter Password" , labelText: " Enter Password" ),
                              ),
                             const SizedBox( height: 20,
                             ),
                             ElevatedButton.icon( 
                              
                              onPressed:(){
      
                             signUserIn();
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),
                              ),
                             
                              );
      
                             }, icon: const Icon(Icons.arrow_circle_right), 
                             label: Text("Login"),
      
                             
                             )
                             
                            ],
                          ),
                        )
                        ),

                        const Padding(
                          padding: EdgeInsets.all(29),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                              Text("Forgot Password?", style: TextStyle( color: Colors.blueGrey),)
                             ],
                          
                          ),
                        ),
                        


                        //  Padding(
                        //   padding: const EdgeInsets.all(20.0),
                        //   child: Row(
                        //     children:[

                        //       Expanded(
                        //         child: Divider(
                        //           thickness: 0.5,
                        //           color: Colors.black,
                        //         ),
                        //         ),
                            
                          

                        // Padding(
                        //   padding: EdgeInsets.all(20.0),
                        //   child: Text("Or continue with", 
                        //   style: TextStyle(color: Colors.grey),)
                        // ),
                        // Expanded(
                        //   child: divide(0.7, Colors.grey)
                        //   )
                          
                        //     ]
                        //   ),
                        //  ),
          
                    ],
                      
                  ),
                ),
              ),
              ),
      ), 
            


        );
    
        
    
  }
      }

