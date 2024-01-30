import 'package:flutter/material.dart';
import 'package:saran_calculator/bmi.dart';
import 'package:saran_calculator/gst.dart';
import 'package:saran_calculator/new.dart';
import 'package:saran_calculator/task%203.dart';

import 'calculator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: cal(),
    );
  }
}