import 'package:flutter/material.dart';

Color primary = Color(0xFF87CEFA);
Color dark = Color(0xFF060414);
const Color grayText = Color(0xFF323232);

BoxDecoration lightGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primary, Colors.white],
  ),
);
