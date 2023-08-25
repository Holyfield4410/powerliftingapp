import 'package:flutter/material.dart';
import 'package:powerlifting_meets_application/pages/home_page.dart';
import 'package:powerlifting_meets_application/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    checkAuthenticationStatus();
  }

  void checkAuthenticationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool storedIsAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    setState(() {
      isAuthenticated = storedIsAuthenticated;
    });
  }

  void onAuthenticationStatusChanged(bool isAuthenticated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
    setState(() {
      this.isAuthenticated = isAuthenticated;
    });
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    setState(() {
      isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isAuthenticated
          ? HomePage() // Remove the logout parameter from the HomePage widget
          : LoginScreen(
              onAuthenticationStatusChanged: onAuthenticationStatusChanged,
            ),
    );
  }
}
