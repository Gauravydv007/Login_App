import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app2/SignUp.dart';
import 'package:my_app2/emailverification.dart';
import 'package:my_app2/services/auth_service.dart';
import 'package:my_app2/verification.dart';
import 'package:my_app2/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app2/forgot_password.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText1 = true;
  
  // ignore: unused_field
  String _password='';

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _submitForm() {
    if (_formkey.currentState!.validate()) {}
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> signUserIn() async {
    print("called");

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      print("remote");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Check if the user's email is verified
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        // Show a message to the user to check their email for verification
        //  showInfoMessage(context, "A verification email has been sent. Please check your email.");
      }

      print("return............");
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Homepage(),
      //   ),
      // );

      Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => Homepage(),
  ),
  (route) => false, // This will remove all existing routes from the stack
);



    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showInfoMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/peakpx.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
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

                             validator: _validateEmail,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                            controller: emailController,

            
            
                            decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: 'Email',
                                      labelText: " Email",
                                      labelStyle: TextStyle(
                                        color:Colors.black54, 
                                      ),
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(


                            validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter Password";
                                      }
                                      else if(passwordController.text.length <6){
                                        return "Password length should be more than 6 Letters";
                                      }
                                      return null;
                                    },
                            controller: passwordController,
                            obscureText: _obscureText1,

            
                            decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: 'Enter Password',
                                      labelText: " Enter Password",
                                      labelStyle: TextStyle(
                                        color:Colors.black54, 
                                      ),
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      suffixIconConstraints: BoxConstraints(
                                        minHeight: 10,

                                      ),
                                      suffixIcon: IconButton(onPressed: _toggle, icon: _obscureText1 ? Icon(Icons.remove_red_eye_rounded, ): Icon(Icons.remove_red_eye_outlined))
                                    ),
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
                    Padding(
                      padding: EdgeInsets.all(29),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          ElevatedButton.icon(
                          
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ));
                    },
                    label: Text("Signup"),
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                    ),
                  ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ForgotPasswordPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            color: Colors.white,
                          )),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          )),
                        ])),
                    InkWell(
                      onTap: () async {
            
            
                        showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                        final user = await AuthService().signInWithGoogle();
                        if (user != null) {
                          

                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                            (Route<dynamic> route) =>
                                false, // This predicate keeps no routes in the stack
                          );
                        } else {
                          // if sign in fail
                          print("Error");
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 18),
                        width: 170,
                        padding: EdgeInsetsDirectional.all(7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 173, 157, 204),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/google.png",
                                height: 40,
                              ),
                              Text(
                                'GOOGLE',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ]),
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
