import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/weather.dart';

class Home extends StatefulWidget {
  String language;
  Home({required this.language});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final headingStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.teal);

  final decoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.teal.withOpacity(0.4),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Color(0xFFEFEEEE),
    // borderRadius: BorderRadius.circular(120.0),
  );

  @override
  void initState() {
    print(widget.language);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.teal.withOpacity(0.6)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(children: [
                Positioned(
                    bottom: 70,
                    left: 5,
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.teal,
                      size: 30,
                    )),
                Center(
                    child: Text(
                  "NEWS",
                  style: GoogleFonts.arsenal(textStyle: headingStyle, shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ]),
                )),
                const Positioned(
                  bottom: 15,
                  left: 5,
                  child: Icon(
                    CupertinoIcons.bars,
                    size: 35,
                    color: Colors.teal,
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        weather();
                        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Weather() ));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        child: Image.asset(
                          "assets/images/weather.png",
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(6.0, 6.0),
                                blurRadius: 16.0,
                              ),
                            ],
                            color: Colors.teal),
                      ),
                    )),
              ]),
            ),
          )
        ],
      ),
    );
  }

  void weather() {
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AlertDialog(
              backgroundColor: Colors.teal.withOpacity(0.4),
              content: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/images/weather.png",
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
