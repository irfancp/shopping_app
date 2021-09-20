import 'package:app/screens/home.dart';
import 'package:app/screens/navBar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar(),
    );
  }
}

