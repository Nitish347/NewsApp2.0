import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../NewsModel/BreakingNewsModel.dart';
import '../NewsModel/NewsTile.dart';
class SportsTab extends StatefulWidget {
  static String country="in";


  @override
  _SportsTabState createState() => _SportsTabState();
}

class _SportsTabState extends State<SportsTab> {
  List<NewsModel> newsList = new List<NewsModel>();
  bool _loading = false;
  String ctr = SportsTab.country;



  void initState(){
    getNews(ctr);
    super.initState();
  }

  getNews(String country) async {
    setState(() {
      _loading = true;
    });
    newsList = new List();
    String api_url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=sports&apiKey=2b826ea9d85542a898f1ef683de48b71";
    var response = await http.get(Uri.parse(api_url));

    Map<String, dynamic> jsonData = json.decode(response.body);
    jsonData["articles"].forEach((element) {
      if (element["title"] != null &&
          element["url"] != null &&
          element["description"] != null &&
          element["urlToImage"] != null) {
        NewsModel newsModel = new NewsModel();
        newsModel = NewsModel.fromMap(element);
        newsList.add(newsModel);
      } else {}
    });
    print(newsList);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _loading
                ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ))
                : Container(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                // padding: EdgeInsets.all(15),
                padding: EdgeInsets.only(bottom: 50),
                children: List.generate(newsList.length, (index) {
                  return GridTile(
                      child: NewsTile(
                        title: newsList[index].title,
                        url: newsList[index].url,
                        imgurl: newsList[index].imgurl,
                        desc: newsList[index].descreption,
                      ));
                }),
              ),
            )
          ],
        ),

      ),
    );
  }
}

