import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/services/auth_service.dart';
import 'package:my_app2/verification.dart';
import 'package:my_app2/home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUserIn() async {
    print("called");
    try {
      print("remote");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("return............");
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/5172658.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: "Username", labelText: "Username"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Enter Password",
                                labelText: " Enter Password"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: signUserIn,
                            icon: Icon(Icons.arrow_circle_right),
                            label: Text("Login"),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blueGrey),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.7,
                            color: Colors.grey,
                          )),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.black26),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          )),
                        ])),
                    InkWell(
                      onTap: () => AuthService().signInWithGoogle(),
                      child: Container(
                        padding: EdgeInsetsDirectional.all(7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          "assets/images/google.png",
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
