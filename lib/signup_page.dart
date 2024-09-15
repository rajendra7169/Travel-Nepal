import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Color _nameBorderColor = Colors.transparent;
  Color _emailBorderColor = Colors.transparent;
  Color _phoneBorderColor = Colors.transparent;
  Color _passwordBorderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    _nameFocusNode.addListener(() {
      setState(() {
        _nameBorderColor =
            _nameFocusNode.hasFocus ? Colors.blue : Colors.transparent;
      });
    });

    _emailFocusNode.addListener(() {
      setState(() {
        _emailBorderColor =
            _emailFocusNode.hasFocus ? Colors.blue : Colors.transparent;
      });
    });

    _phoneFocusNode.addListener(() {
      setState(() {
        _phoneBorderColor =
            _phoneFocusNode.hasFocus ? Colors.blue : Colors.transparent;
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
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  // Title Section
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 60), // Added margin of 20px

                  // Name, Email, Phone, and Password Fields
                  _buildTextField(
                    focusNode: _nameFocusNode,
                    labelText: 'Name',
                    isPassword: false,
                    borderColor: _nameBorderColor,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    focusNode: _emailFocusNode,
                    labelText: 'Email Address',
                    isPassword: false,
                    borderColor: _emailBorderColor,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    focusNode: _phoneFocusNode,
                    labelText: 'Phone',
                    isPassword: false,
                    borderColor: _phoneBorderColor,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    focusNode: _passwordFocusNode,
                    labelText: 'Password',
                    isPassword: true,
                    borderColor: _passwordBorderColor,
                  ),
                  const SizedBox(height: 20),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle sign-up action
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
                      'Create Account',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Section
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login.',
                          style: const TextStyle(
                            color: Color(0xFF3A8DB2),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Login Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
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
                        child: Text('Or'),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Social Media Buttons Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          './lib/assets/google.png', // Replace with your image path
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle Google sign-up
                        },
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Image.asset(
                          './lib/assets/facebook.png', // Replace with your image path
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Handle Facebook sign-up
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
                          // Handle Apple sign-up
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
