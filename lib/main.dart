import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:phoneauth/Tabs/breaking_news_tab.dart';
import 'package:phoneauth/chooseLanguage.dart';
import 'package:phoneauth/home.dart';
import 'package:phoneauth/otpPage.dart';
import 'package:phoneauth/phone_number.dart';
import 'package:phoneauth/save%20data/shared_preferences.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

      MyApp());
}

class MyApp extends StatelessWidget {
 SaveData _saveData = new SaveData();

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
// if(otp_visible ==true){
// verifycode();
// }
// else{
// verify();
// }
// },

