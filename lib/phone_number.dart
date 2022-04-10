import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/otpPage.dart';
import 'package:phoneauth/save%20data/shared_preferences.dart';

import 'chooseLanguage.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _otpSending = false;

  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verficationID_received = "";
  bool next = false;

  bool otp_visible = false;
  bool _buttonPressed = true;
  SaveData nnnn = new SaveData();

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
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      // offset: Offset(-6.0, -6.0),
                      blurRadius: 16.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                  color: Color(0xFFEFEEEE),
                  borderRadius: BorderRadius.circular(120.0),
                ),
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
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(6.0, 7.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: TextField(
                            controller: _phoneNumber,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone Number",
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
                      decoration: BoxDecoration(
                        boxShadow: _buttonPressed
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.8),
                                  blurRadius: 16.0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: Offset(6.0, 6.0),
                                  blurRadius: 16.0,
                                ),
                              ]
                            : null,
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: otp_visible
                            ? const Text(
                                "Verify OTP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                "Send OTP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    onTap: () {
                      // nnnn.getSaveData();
                      // nnnn.setSaveData(true);
                      // print("${nnnn.status} ye h status");
                      // nnnn.removeData("loggedIn");
                      if(_phoneNumber.text.isNotEmpty){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>OTP_Verification(phoneNumber: _phoneNumber.text)));
                      }
                    },

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  const Text(
                    "Gmail",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
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
