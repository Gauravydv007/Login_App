import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Loginpage.dart';
import 'package:my_app2/Loginpage.dart';
import 'package:my_app2/verification.dart';

// Define the MenuAction enum here
enum MenuAction {
  signUserOut,
  // Add more menu actions if needed
}

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  get devtools => null;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showExitConfirmationDialog(context);
        },
        child: Scaffold(
            appBar: AppBar( centerTitle: true,
              title: Text(" Home"),
              actions: [
                PopupMenuButton<MenuAction>(
                  onSelected: (value) async {
                    
                    switch (value) {
                      case MenuAction.signUserOut:
                        final shouldLogout = await showSignOutDialog(context);

                        if (shouldLogout) {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<MenuAction>>[
                      PopupMenuItem<MenuAction>(
                          child: Text('signout'),
                          value: MenuAction.signUserOut),
                    ];
                  },
                ),
              ],
            ),
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
                          backgroundImage:
                              AssetImage('assets/images/home.jpg'),
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
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Signout"),
                    subtitle: Text("Signout from here"),
                    trailing: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(
                    opacity: 0.9,
                    // child: Container(
                    //   decoration: const BoxDecoration(
                    //       gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 30, 15, 71),
                    //     Color.fromARGB(255, 68, 59, 176)
                    //   ])),
                    //   alignment: Alignment.topCenter,
                    //   height: 60,
                    //   width: MediaQuery.sizeOf(context).width * 0.8,
                    //   padding: const EdgeInsets.all(10),
                    //   child: const Text(
                    //     "",
                    //     style: TextStyle(
                    //       fontSize: 32,
                    //       color: Color.fromARGB(255, 239, 39, 39),
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            )

            // drawer: Drawer();

            ));
  }
}

Future<bool> showSignOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you you you want to Signout?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Signout'))
        ],
      );
    },
  ).then((value) => value ?? false);
}

Future<bool> showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
