import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:phoneauth/home.dart';

import '../LoginPage.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IntroState();
  }
}

class IntroState extends State<Intro> {
  List<Slide> listSlides = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IntroSlider(
        slides: listSlides,
        onDonePress: onPressedDone,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listSlides.add(Slide(
      title: "Hello, ${LoginPage.Name}",
      description: "You can read the news with different categories like: Breaking News, Sports, Technology, Health etc.",
      pathImage: "assets/images/home.png",
      heightImage: 350,
      // backgroundImage: "assets/images/home.png",
      backgroundColor: Colors.teal.withOpacity(0.9),
    ));
    listSlides.add(Slide(
      title: "Weather Report",
      heightImage: 350,
      description: "Here, You can search weather report of any country/city of the world.",
      pathImage: "assets/images/weather.png",
      backgroundColor: Colors.teal.withOpacity(0.9),
    ));
    listSlides.add(Slide(
      title: "20+ Countries",
      description: "You can search news of diffent diffrent categories of the world.",
      pathImage: "assets/images/country.png",
      heightImage: 350,
      backgroundColor: Colors.teal.withOpacity(0.9),
    ));
  }

  onPressedDone() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Home()));
  }

}