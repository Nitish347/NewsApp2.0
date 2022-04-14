import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoneauth/Intro/intro.dart';

import 'package:phoneauth/Tabs/breaking_news_tab.dart';
import 'package:phoneauth/chooseLanguage.dart';
import 'package:phoneauth/home.dart';
import 'package:phoneauth/otpPage.dart';
import 'package:phoneauth/LoginPage.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
    );
  }
}

