import 'package:flutter/material.dart';
class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal,
      content: Container(
        height:MediaQuery.of(context).size.height/1.5,
        width: double.maxFinite,
      ),

    );
  }
}
