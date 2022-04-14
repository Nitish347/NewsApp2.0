import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/Constants/constants.dart';
import 'package:phoneauth/Tabs/breaking_news_tab.dart';
import 'package:phoneauth/Tabs/business_tab.dart';
import 'package:phoneauth/Tabs/entertainments_tab.dart';
import 'package:phoneauth/Tabs/health_tab.dart';
import 'package:phoneauth/Tabs/sports_tab.dart';
import 'package:phoneauth/Tabs/technology.dart';
import 'package:phoneauth/country/country.dart';
import 'package:phoneauth/weather/weather.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                    style: GoogleFonts.arsenal(textStyle: Constants.headingStyle, shadows: Constants.boxShadow1
                    ),
                  )),
                    Positioned(
                    bottom: 15,
                    left: 5,
                    child: InkWell(
                      onTap: (){
                        country();
                      },
                      child: const Icon(
                        CupertinoIcons.bars,
                        size: 35,
                        color: Colors.teal,
                      ),
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
                              "assets/images/weather report.png",
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: Constants.boxShadow1,
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
                      Tab(child: Text("Breaking News",style: Constants.tabStyle,)),
                      Tab(child: Text("Entertainment",style: Constants.tabStyle,)),
                      Tab(child: Text("Sports",style: Constants.tabStyle,)),
                      Tab(child: Text("Business",style: Constants.tabStyle,)),
                      Tab(child: Text("Technology",style: Constants.tabStyle,)),
                      Tab(child: Text("Health",style:Constants.tabStyle,)),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.4,
                  // width: double.maxFinite,
                  child:
                  TabBarView(
                    children: [
                      BreakingNewsTab(),
                      EntertainmentTab(),
                      SportsTab(),
                      BusinessTab(),
                      TechnologyTab(),
                      HealthTab()
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
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
              backgroundColor: Colors.teal.withOpacity(0.6),
              content: WeatherPage()
            ),
          );
        });
  }

  void country() {
    TextEditingController country  = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: AlertDialog(
              backgroundColor: Colors.teal.withOpacity(0.6),
              content: Country()
            ),
          );
        }
        );
  }
}
