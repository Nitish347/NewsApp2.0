import 'package:flutter/material.dart';
import 'package:newsapp2/chooseLanguage.dart';
import 'package:newsapp2/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        shadowColor: Colors.greenAccent,
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}

