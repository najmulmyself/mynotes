import 'package:flutter/material.dart';
import 'package:mynotes/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Registration'),
        ),
        body: Homepage(),
      ),
    );
  }
}
