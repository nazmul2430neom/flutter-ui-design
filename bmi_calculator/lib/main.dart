// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/bmi_design.dart';
import 'package:bmi_calculator/design_bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DesignBmiPage(),
    );
  }
}

