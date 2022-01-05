import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      home: const HomePage(),
    );
  }
}
