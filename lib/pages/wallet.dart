import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50, // Light green background
      appBar: AppBar(
        title: const Text("My Wallet"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "\$0.00",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "Wallet Balance",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}