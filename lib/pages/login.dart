import 'package:boardzone_app/pages/signup.dart';
import 'package:boardzone_app/pages/bottomnav.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "";

  final TextEditingController mailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      
      // Navigate to BottomNav on success
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Bottomnav()));
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No User Found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Error: ${e.message}",
          style: const TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "images/login.png", // Make sure you have a login image or use logo.png
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 5.0),
              Center(
                  child: Text("Login",
                      style: AppWidget.headlinetextstyle(20.0))),
              const SizedBox(height: 5.0),
              Center(
                child: Text(
                  "Please enter the details to continue.",
                  style: AppWidget.normaltextstyle(17.0),
                ),
              ),
              const SizedBox(height: 40.0), 
              
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Email", style: AppWidget.normaltextstyle(20.0)),
              ),
              const SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: mailcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 4, 104, 186),
                    ),
                    hintText: "Enter Email",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              
              const SizedBox(height: 20.0),
              
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child:
                    Text("Password", style: AppWidget.normaltextstyle(20.0)),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 4, 104, 186),
                    ),
                    hintText: "Enter Password",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              
              // ===== Forgot Password (Optional) =====
              const SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(right: 30.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: AppWidget.normaltextstyle(16.0),
                ),
              ),

              const SizedBox(height: 40.0),

              // ===== Login Button =====
              GestureDetector(
                onTap: () {
                  if(mailcontroller.text != "" && passwordcontroller.text != "") {
                    setState(() {
                      email = mailcontroller.text;
                      password = passwordcontroller.text;
                    });
                    userLogin();
                  }
                },
                child: Center(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 104, 200, 107),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20.0),
              
              // ===== Link to Sign Up =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppWidget.normaltextstyle(14.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 104, 186),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}