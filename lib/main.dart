import 'package:all_sports/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set the system navigation bar color to black
    // ignore: prefer_const_constructors
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.purpleAccent, // Set navigation bar color
      systemNavigationBarIconBrightness: Brightness.light, // Set icons to light (white)
      statusBarColor: Colors.transparent, // Make status bar transparent if needed
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      
      
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //    // Set scaffold background to black
        
      //   colorScheme: const ColorScheme.light(), // Use a dark color scheme
      // ),
      home: MyHomePage(),
    );
  }
}