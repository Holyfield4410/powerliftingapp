import 'package:flutter/material.dart';
import 'package:powerlifting_meets_application/pages/login.dart';

class SettingsPage extends StatelessWidget {
  final Function(bool) onAuthenticationStatusChanged; // Add this line

  SettingsPage({
    required this.onAuthenticationStatusChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     onAuthenticationStatusChanged(
            //         false); // Update the authentication status
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreen(
            //           onAuthenticationStatusChanged:
            //               onAuthenticationStatusChanged, // Pass the function to the LoginScreen widget
            //         ),
            //       ),
            //     );
            //   },
            //   child: Text('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
