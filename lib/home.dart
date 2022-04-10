import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/Tabs/breaking_news.dart';
import 'package:phoneauth/Tabs/breaking_news_tab.dart';
import 'package:phoneauth/weather.dart';

class Home extends StatefulWidget {
  // String language;
  // Home({required this.language});

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(children: [
                const Positioned(
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
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        child: CircleAvatar(
                          child: Image.asset(
                            "assets/images/weather.png",
                          ),
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
          ),
          DefaultTabController(length: 6, child: Column(
            children: [
              Container(
                color: Colors.grey.withOpacity(0.5),

                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.teal,
                  indicatorWeight: 5,

                  tabs: [
                    Tab(child: Text("Breaking News",style: TextStyle(color: Colors.black),)),
                    Tab(child: Text("Politics",style: TextStyle(color: Colors.black),)),
                    Tab(child: Text("Entertainment",style: TextStyle(color: Colors.black),)),
                    Tab(child: Text("Sports",style: TextStyle(color: Colors.black),)),
                    Tab(child: Text("Business",style: TextStyle(color: Colors.black),)),
                    Tab(child: Text("Technology",style: TextStyle(color: Colors.black),)),

                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/1.4,
                // width: double.maxFinite,
                child:
                TabBarView(
                  children: [
                    Container(
                      height : MediaQuery.of(context).size.height,
                        color: Colors.greenAccent,
                        child: BreakingNewsTab()
                    ),
                    Container(
                      color: Colors.yellowAccent,
                      // height: 20,
                    ),
                    Text("l1dfghjhgfd"),
                    Text("l1dfghjhgfd"),
                    Text("l1dfghjhgfd"),
                    Text("l1dfghjhgfd"),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  void weather() {
    TextEditingController city  = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: AlertDialog(
              backgroundColor: Colors.teal.withOpacity(0.4),
              content: WeatherPage()
            ),
          );
        });
  }
}
