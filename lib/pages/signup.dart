import 'package:boardzone_app/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Subtle gradient that complements the illustration
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 196, 211, 252), 
              Color.fromARGB(255, 96, 168, 102), 
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                
                // --- Replaced Icon with your Image ---
                Center(
                  child: Container(
                    height: 220, // Adjusted height for the illustration
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // Optional: subtle shadow to make the image pop
                      /*
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                      */
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/signup.jpg', 
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E), // Deep blue matching the image
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please enter the details to continue.",
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // --- Input Fields ---
                _buildInputField(
                  label: "Name", 
                  hint: "Enter Name", 
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  label: "Email", 
                  hint: "Enter Email", 
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  label: "Password", 
                  hint: "Enter Password", 
                  icon: Icons.lock_outline, 
                  isPassword: true,
                ),
                
                const SizedBox(height: 40),

                // --- Sign Up Button ---
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 21, 87, 39), // Bright blue from the illustration
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      shadowColor: const Color.fromARGB(255, 25, 44, 75).withOpacity(0.4),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18, 
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // --- Login Link ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Color.fromARGB(255, 50, 68, 76)),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                         );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Color(0xFF1A237E),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label, 
    required String hint, 
    required IconData icon, 
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 14,
            color: Color(0xFF1A237E),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF4A69FF)),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
