import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:newflutterproject/Frontend/forgotpasswordpage.dart';
import 'package:newflutterproject/Frontend/student_logged_in.dart';

class student_login extends StatelessWidget {
   student_login({Key? key}) : super(key: key);

  final TextEditingController _password1 = TextEditingController();
  final TextEditingController _email1 = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    var url = Uri.parse('http://localhost:3000/user/enterLogin'); // Replace with your server URL
    var response = await http.post(
      url,
      body: {
        'email': _email1.text,
        'password': _password1.text,
      },
    );

    if (response.statusCode == 200) {
      // Handle successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StudentLoggedIn()),
      );
    } else {
      // Handle failed login
      Fluttertoast.showToast(
        msg: "Login failed. Please check your credentials.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple.shade700),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.purple.shade200],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sign in to Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            controller: _email1,
                            decoration: InputDecoration(
                              labelText: 'Please enter Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _password1,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Please enter Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.purple.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_password1.text.isEmpty || _email1.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "Credentials are empty",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 10,
                          backgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        loginUser(context); // Call function to handle login
                      }
                    },
                    child: Text('LOGIN'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple.shade300),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

