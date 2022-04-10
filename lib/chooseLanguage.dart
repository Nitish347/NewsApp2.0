import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phoneauth/save%20data/shared_preferences.dart';

import 'home.dart';


void main() {
  runApp(Choose_Language());
}

class Choose_Language extends StatefulWidget {


  @override
  _Choose_LanguageState createState() => _Choose_LanguageState();
}

class _Choose_LanguageState extends State<Choose_Language> {
  SaveData _saveData = new SaveData();
  String language = "";
  final languageStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.teal.withOpacity(0.7));
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Language",
                    style: GoogleFonts.arsenal(textStyle: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Colors.teal,shadows: <Shadow>[
                      Shadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 16.0,
                      ),
                    ],)),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height/15,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      language = "english";
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Home()));
                    });
                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-6.0, -6.0),
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
                    child:  Center(
                        child:Text("English",style:GoogleFonts.arsenal(textStyle: languageStyle),
                        )
                    ),
                  ),
                ),
              ),SizedBox(
                height: MediaQuery.of(context).size.height/12,
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      language = "hindi";

                      print("hindi");
                      // Home(language: language);
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Home()));
                    });
                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-6.0, -6.0),
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
                        child:Text("हिन्दी",style: GoogleFonts.arsenal(textStyle: languageStyle)
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
