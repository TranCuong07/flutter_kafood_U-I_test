import 'package:flutter/material.dart';
import 'package:myapp/screen/allergy.dart';
import 'package:myapp/screen/bmi.dart';
import 'package:myapp/screen/login.dart';
import 'package:myapp/screen/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
