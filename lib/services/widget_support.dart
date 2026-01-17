import 'package:flutter/widgets.dart';
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
}