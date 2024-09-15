import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forget_password.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  Color _usernameBorderColor = Colors.transparent;
  Color _passwordBorderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      setState(() {
        _usernameBorderColor =
            _usernameFocusNode.hasFocus ? Colors.blue : Colors.transparent;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordBorderColor =
            _passwordFocusNode.hasFocus ? Colors.blue : Colors.transparent;
      });
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply gradient background here
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and Title Section
                  Image.asset(
                    './lib/assets/logo.png', // Replace with your image path
                    height: 200,
                  ),
                  const SizedBox(height: 20),

                  // Username and Password Fields
                  _buildTextField(
                    focusNode: _usernameFocusNode,
                    labelText: 'Email or Phone Number',
                    isPassword: false,
                    borderColor: _usernameBorderColor,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    focusNode: _passwordFocusNode,
                    labelText: 'Password',
                    isPassword: true,
                    borderColor: _passwordBorderColor,
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password Section
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle login action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7ab9ec), // Blue color
                      foregroundColor: Colors.white, // White text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign Up Section
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up now.',
                          style: const TextStyle(
                            color: Color(0xFF3A8DB2),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to the SignUpPage when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // OR Divider Section
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Social Media Buttons Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Custom Social Media Icon Button
                      IconButton(
                        icon: Image.asset(
                          './lib/assets/facebook.png', // Replace with your image path
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle custom social media login
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Image.asset(
                          './lib/assets/google.png', // Replace with your image path
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle custom social media login
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Image.asset(
                          './lib/assets/apple.png', // Replace with your image path
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle custom social media login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required FocusNode focusNode,
    required String labelText,
    required bool isPassword,
    required Color borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
