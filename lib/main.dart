import "package:flutter/material.dart";
import 'package:flutter_tutorial/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Messenger",
      home: HomeScreen()
    );
  }
}