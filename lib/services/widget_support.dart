import 'package:flutter/material.dart';

class AppWidget{
  // Static method to return a white text style with a given font size
  static TextStyle whitetextstyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w500, // You can change this if needed
    );
  }
  static TextStyle headlinetextstyle(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.bold, // You can change this if needed
    );
  }
  static TextStyle contentstyle(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.w300, // You can change this if needed
    );
  }
}