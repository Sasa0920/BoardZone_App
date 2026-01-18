import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';    // Make sure these match your actual file paths
import 'booking.dart';
import 'profile.dart';
import 'wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;

  late Home homePage;
  late Booking booking;
  late Profile profile;
  late Wallet wallet;

  int currentTabIndex = 0;

  @override
  void initState() {
    homePage = Home();
    booking = Booking();
    profile = Profile();
    wallet = Wallet();

    pages = [homePage, booking, wallet, profile];
    super.initState();
  } 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 90, 83, 28),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.book_online, size: 30, color: Colors.white),
          Icon(Icons.wallet, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}