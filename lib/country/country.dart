import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/Tabs/breaking_news_tab.dart';
import 'package:phoneauth/Tabs/business_tab.dart';
import 'package:phoneauth/Tabs/entertainments_tab.dart';
import 'package:phoneauth/Tabs/health_tab.dart';
import 'package:phoneauth/Tabs/sports_tab.dart';
import 'package:phoneauth/Tabs/technology.dart';
import 'package:phoneauth/home.dart';
class Country extends StatefulWidget {

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {

  List<String> countryList = [
    'Australia',
    'Belgium',
    'Brazil',
    'Canada',
    'China',
    'France',
    'Germany',
    'India',
    'Indonesia',
    'Ireland',
    'Israel',
    'Japan',
    'New Zealand',
    'Russia',
    'Saudi Arabia',
    'Singapore',
    'South Africa',
    'South korea',
    'Switzerland',
    'UAE',
    'United Kingdom',
    'Ukrain',
    'United State'
  ];
  List<String> countryCode = [
    'au',
    'be',
    'br',
    'ca',
    'cn',
    'fr',
    'de',
    'in',
    'id',
    'ie',
    'il',
    'jp',
    'nz',
    'ru',
    'sa',
    'sg',
    'za',
    'kr',
    'ch',
    'ae',
    'ua',
    'gb',
    'us'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Country",style: TextStyle(color: Colors.amber,fontSize: 40,fontWeight: FontWeight.bold),),
            Divider(height: 20,color: Colors.white,),
            ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: List.generate(countryList.length, (index) {
                  return Container(
                    height: 40,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        BreakingNewsTab.country = countryCode[index];
                        BusinessTab.country = countryCode[index];
                        EntertainmentTab.country = countryCode[index];
                        HealthTab.country = countryCode[index];
                        SportsTab.country = countryCode[index];
                        TechnologyTab.country = countryCode[index];
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Home()));
                      },
                      child: ListTile(
                        leading: Text(
                          countryList[index],
                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.amber, fontSize: 22),)
                        ),
                        trailing: Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                }),
              ),
          ],
        ),
      ),);
  }
}
