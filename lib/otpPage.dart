import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phoneauth/Constants/constants.dart';
import 'package:phoneauth/Intro/intro.dart';


import 'chooseLanguage.dart';
class OTP_Verification extends StatefulWidget {
  final String phoneNumber;

  OTP_Verification({this.phoneNumber});


  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  @override
  void initState(){
    verify();
  }


  TextEditingController _otp = new TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verficationID_received = "";

  bool next = false;

  bool otp_visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(height:250,child: Image.asset('assets/images/otp_Image.png')),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children:[
                Text("Verify ${widget.phoneNumber}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                Container(
                decoration: Constants.decorationNeumorphic3,
                child:
                     Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLength: 6,

                          keyboardType: TextInputType.number,
                          controller: _otp,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter OTP",
                              hintStyle:
                              TextStyle(color: Colors.deepPurple)),
                        ),
                      ),
              ),]
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/50,),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){
                if (otp_visible == true) {
                  verifycode();
                }
              },
              child: Container(
                height: 50,
                decoration: Constants.decorationNeumorphic,
                child:  const Center(
                  child: Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                )

              ),
            ),
          ),

        ],
      ),
    );
  }

  void verify() {
    auth.verifyPhoneNumber(
        phoneNumber: "+91${widget.phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("login successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verficationID, int resendtoken) {
          verficationID_received = verficationID;
          setState(() {
            otp_visible = true;

          });
        },
        codeAutoRetrievalTimeout: (String verficationID) {});
  }

  void verifycode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verficationID_received, smsCode: _otp.text);
    await auth.signInWithCredential(credential).then((value) {
      print("logged in successfully");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              Intro()));

    });
  }
}
