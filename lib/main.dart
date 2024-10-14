import 'package:all_sports/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Size mq;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set the system navigation bar color to black
    // ignore: prefer_const_constructors
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      
      
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //    // Set scaffold background to black
        
      //   colorScheme: const ColorScheme.dark(), // Use a dark color scheme
      // ),
      home: MyHomePage(),
    );
  }
}