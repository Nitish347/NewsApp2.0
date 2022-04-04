import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp2/chooseLanguage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _buttonPressed = true;
  final loginStyle =  TextStyle(fontSize: 50, color: Colors.teal,shadows: <Shadow>[
    Shadow(
      color: Colors.black.withOpacity(0.4),
      offset: Offset(5.0, 5.0),
      blurRadius: 16.0,
    ),
  ],);
  bool _otpsent = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
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
              height: MediaQuery.of(context).size.height / 50,
            ),
            Text(
              "Log In",
              style: GoogleFonts.poppins(textStyle: loginStyle)
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
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
                          // offset: Offset(-6.0, -6.0),
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
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.teal[200])),
                          ),
                        ),
                        Visibility(
                          visible: _otpsent,
                          child: Container(
                            padding: EdgeInsets.all(8.0),

                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "OTP",
                                  hintStyle: TextStyle(color: Colors.teal[200])),
                            ),
                          ),
                        ),
                      ],
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
                         boxShadow: _buttonPressed ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),

                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ] : null,
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: _otpsent
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
                    onTap: (){
                      setState(() {
                        _buttonPressed = false;
                      });

                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Choose_Language()));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Text(
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
