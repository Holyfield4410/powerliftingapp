import 'package:flutter/material.dart';
import 'package:powerlifting_meets_application/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  HomePage(); // Remove the logout parameter from the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Powerlifting Event Booking'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Powerlifting Event Booking App!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the event listing page
              Navigator.pushNamed(context, '/events');
            },
            child: Text('View Events'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to the booking page
              Navigator.pushNamed(context, '/booking');
            },
            child: Text('Book Event'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
