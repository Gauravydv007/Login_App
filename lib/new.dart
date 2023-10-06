import 'package:flutter/material.dart';
import 'package:my_app2/Loginpage.dart';
import 'package:my_app2/SignUp.dart';
class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      
      
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/homi.jpg"), 
          fit: BoxFit.cover),
      ),

      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 200,
            child: Container(

              alignment: Alignment.center,
              width: double.maxFinite,
              
              child: Text("Welcome to My_APP", style: TextStyle( fontSize: 30 , color: Colors.white)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                ElevatedButton.icon(onPressed: (){
                  
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),
                              ));
                },  label: Text("Signup"), 
                icon:Icon(Icons.arrow_back_sharp,
                
                ) , 
                ),
                ElevatedButton.icon(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),
                              ));
                }, label: Text("Login"), 
                icon:Icon(Icons.arrow_forward_sharp ),)
              ],
            )

          ),
        ],
      ),
    


    )
    );
  }
}

  
