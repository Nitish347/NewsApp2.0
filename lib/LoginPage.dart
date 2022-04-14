import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/Constants/constants.dart';
import 'package:phoneauth/otpPage.dart';

import 'chooseLanguage.dart';

class LoginPage extends StatefulWidget {
static String Name = "";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void getName(){
    LoginPage.Name = name.text;
  }
  bool _otpSending = false;
  final TextEditingController name = new TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verficationID_received = "";
  bool next = false;

  bool otp_visible = false;
  bool _buttonPressed = true;


  final loginStyle = TextStyle(
    fontSize: 50,
    color: Colors.teal,
    shadows: <Shadow>[
      Shadow(
        color: Colors.black.withOpacity(0.4),
        offset: Offset(5.0, 5.0),
        blurRadius: 16.0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
            Center(
              child: Container(
                height: 180,
                width: 180,
                decoration: Constants.decorationNeumorphic2,
                child: Center(
                    child: Image.asset(
                  "assets/images/splash.jpg",
                  height: 150,
                  width: 150,
                )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height /25,
            ),
            Text("Log In", style: GoogleFonts.poppins(textStyle: loginStyle)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [

                Container(
                  // padding: EdgeInsets.all(.0),
                  decoration: Constants.decorationNeumorphic3,
                  child:
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your Name",
                          hintStyle: TextStyle(color: Colors.teal[200])),
                    ),
                  ),
                ),
                  SizedBox(height: 10,),
                  Container(
                    // padding: EdgeInsets.all(.0),
                    decoration:Constants.decorationNeumorphic3,
                    child:
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: _phoneNumber,
                            decoration: InputDecoration(
                              prefix: Text("+91",style: TextStyle(color: Colors.black),),
                                border: InputBorder.none,
                                hintText: " Phone Number",
                                hintStyle: TextStyle(color: Colors.teal[200])),
                          ),
                        ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  InkWell(
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 5),
                      height: 50,
                      decoration: Constants.decorationNeumorphic,
                      child: const Center(
                        child: Text(
                                "Send OTP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    onTap: () {
                      getName();
                      if(_phoneNumber.text.isNotEmpty){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>OTP_Verification(phoneNumber: _phoneNumber.text)));
                      }
                    },

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
