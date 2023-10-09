import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Loginpage.dart';
import 'package:my_app2/Loginpage.dart';
import 'package:my_app2/verification.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

   final user = FirebaseAuth.instance.currentUser!;

   void signUserOut(){
    FirebaseAuth.instance.signOut();
    
   }

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              signUserOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
              }, 
            icon: Icon(Icons.logout),
            )
        ],
      ),

      // body:Center(child: Text("Logged in" + user.email!,
      // style: TextStyle(fontSize: 25),
      // )
      
      // ),

             
          
        
      
      
      
        
          
          
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: UserAccountsDrawerHeader(
                      accountName: Text("Gaurav"),
                      accountEmail: Text("gaurav2211028@akgec.ac.in"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/image.jpg'),
                      ),
                    )),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  subtitle: Text("Personal"),
                  trailing: Icon(Icons.edit),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  subtitle: Text("Personal"),
                  trailing: Icon(Icons.share),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  subtitle: Text("Personal"),
                  trailing: Icon(Icons.shape_line_rounded),
                ),
              ],
            ),
          ),
               body:Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.9,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 30, 15, 71),
                      Color.fromARGB(255, 68, 59, 176)
                    ])),
                    alignment: Alignment.topCenter,
                    height: 60,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Welcome on my App",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 239, 39, 39),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

          // drawer: Drawer();

          );
    
  }
}


