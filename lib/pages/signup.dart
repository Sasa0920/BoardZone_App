import 'package:boardzone_app/pages/login.dart';
import 'package:boardzone_app/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:boardzone_app/services/database.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';
import 'bottomnav.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  registration() async {
    if (password != null &&
        namecontroller.text != "" &&
        mailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String id = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap = {
          "name": namecontroller.text,
          "email": mailcontroller.text,
          "Id": id,
        };
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserEmail(mailcontroller.text);
        await SharedpreferenceHelper().saveUserId(id);
        await DatabaseMethods().addUserInfo(userInfoMap, id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registration Successful",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnav()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "The password provided is too weak.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "The account already exists for that email.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          // Added scroll view to prevent overflow on small screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "images/signup.jpg", // Ensure you have a valid image path here
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                  child: Text("Sign Up",
                      style: AppWidget.headlinetextstyle(20.0))),
              SizedBox(height: 5.0),
              Center(
                child: Text(
                  "Please enter the details to continue.",
                  style: AppWidget.normaltextstyle(17.0),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Name", style: AppWidget.normaltextstyle(14.0)),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 4, 104, 186),
                    ),
                    hintText: "Enter Name",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Email", style: AppWidget.normaltextstyle(20.0)),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: mailcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: const Color.fromARGB(255, 4, 104, 186),
                    ),
                    hintText: "Enter Email",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child:
                    Text("Password", style: AppWidget.normaltextstyle(20.0)),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true, // Added for security
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: const Color.fromARGB(255, 4, 104, 186),
                    ),
                    hintText: "Enter Password",
                    hintStyle: AppWidget.normaltextstyle(18.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // FIXED GESTURE DETECTOR SYNTAX HERE
              GestureDetector(
                onTap: () async {
                  if (namecontroller.text != "" &&
                      mailcontroller.text != "" &&
                      passwordcontroller.text != "") {
                    setState(() {
                      password = passwordcontroller.text;
                      name = namecontroller.text;
                      email = mailcontroller.text;
                    });
                    await registration();
                  }
                }, 
                child: Center(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 192, 141, 13),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text(
                        "Sign Up",
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
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppWidget.normaltextstyle(14.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 104, 186),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ], // Close Children
          ),
        ),
      ),
    );
  }
}