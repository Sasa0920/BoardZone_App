import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50, // Light blue background
      appBar: AppBar(
        title: const Text("My Bookings"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Booking Page Content",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}