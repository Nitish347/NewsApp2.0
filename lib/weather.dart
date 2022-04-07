import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:phoneauth/weatherModel.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController city = TextEditingController();
  bool _loading = false;
  bool _searched = false;
  bool _show = false;

  WeatherModel weatherModel = new WeatherModel();
  getWeather(String city) async {
    setState(() {
      _loading = true;
    });

    String url =
        "https://api.weatherapi.com/v1/current.json?key=1edf7f300aff4f9d8fd155438220704&q=$city&aqi=no";

    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> weatherData = json.decode(response.body);
    WeatherModel weather = new WeatherModel();
    weather = WeatherModel.fromMap(weatherData);
    weatherModel = weather;
    print(weatherModel);
    setState(() {
      _loading = false;
      _searched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MediaQuery.of(context).size.height / 1.5,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 16.0,
                    ),
                  ],
                  color: Colors.teal),
              child: Container(
                height: MediaQuery.of(context).size.height / 50,
                width: MediaQuery.of(context).size.width / 50,
                child: Image.asset(
                  "assets/images/weather.png",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5, right: 15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: city,
                          decoration: const InputDecoration(
                            hintText: "Search Country/City Name",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                            ),
                            border: InputBorder.none,
                          ),
                        )),
                        InkWell(
                            onTap: () {
                              if(city.text.isNotEmpty){
                                setState(() {
                                  _show = false;
                                });
                                getWeather(city.text);
                                setState(() {

                                });
                              }
                              else{
                                setState(() {
                                  _searched=false;
                                  _show = true;
                                });
                              }

                            },
                            child: Icon(CupertinoIcons.search)),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 5,),
             _show ? Container(
               height: 50,
               child: Center(
                 child: Text("You didn't search anything!",style: TextStyle(color: Colors.grey,fontSize:20),),
               ),
             ) :
             Container(),
             _loading ? Center(child: CircularProgressIndicator(color: Colors.amber,)) :  _searched ?Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${weatherModel.name}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                  Text(
                    "${weatherModel.region}, ${weatherModel.country}",
                    style: GoogleFonts.arsenal(
                        textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    )),
                  ),
                  Text(
                    "${weatherModel.temp_c}°C",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),

                  Text("Wind Direction: ${weatherModel.wind_dir}",style: TextStyle(color: Colors.grey),),
                  SizedBox(
                    height:8,
                  ),
                  Stack(children: [
                    Container(
                      height: 120,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Wind",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Icon(CupertinoIcons.wind),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${weatherModel.wind_mph}",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text("Humidity",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Icon(CupertinoIcons.cloud_sun_rain_fill),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${weatherModel.humidity}",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Temperature",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                CupertinoIcons.thermometer,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${weatherModel.temp_f}°F",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ])
                ],
              ),
            ) : Container(
            )
          ],
        ),
      ),
    );
  }
}