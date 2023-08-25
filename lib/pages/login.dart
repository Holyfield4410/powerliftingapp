import 'package:flutter/material.dart';

import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database_helper.dart';
import '../objects/user.dart';

class LoginScreen extends StatefulWidget {
  final Function(bool) onAuthenticationStatusChanged;

  LoginScreen({required this.onAuthenticationStatusChanged});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _loginUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Retrieve user from the database based on the provided username
    User? user = await DatabaseHelper().getUserByUsername(username);

    if (user != null && user.password == password) {
      // User is authenticated
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);

      widget.onAuthenticationStatusChanged(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Invalid credentials
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _loginUser,
              child: Text('Login'),
            ),
            SizedBox(height: 8.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
