import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:phoneauth/json_parsing/json_parsing.dart';

// import '../NewsModel/BreakingNewsModel.dart';
import '../NewsModel/NewsTile.dart';
import '../NewsModel/News_Model.dart';


class PoliticsTab extends StatefulWidget {

  @override
  _PoliticsTabState createState() => _PoliticsTabState();
}

class _PoliticsTabState extends State<PoliticsTab> {

  static List<PolticsModel> newsList = new List<PolticsModel>();
  bool loading = true;


  void initState(){
    // setState(() {
    //   loading = true;
    // });
    JsonParsing.getNewsTabs('entertainment', newsList);
    setState(() {
      loading = false;
    });
    // super.initState();
  }

  // getNews() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   newsList = new List();
  //   String url = "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=2b826ea9d85542a898f1ef683de48b71";
  //   var response = await http.get(Uri.parse(url));
  //
  //   Map<String, dynamic> jsonData = json.decode(response.body);
  //   jsonData["articles"].forEach((element) {
  //     if (element["title"] != null &&
  //         element["url"] != null &&
  //         element["description"] != null &&
  //         element["urlToImage"] != null) {
  //       PolticsModel newsModel = new PolticsModel();
  //       newsModel = PolticsModel.fromMap(element);
  //       newsList.add(newsModel);
  //     } else {}
  //   });
  //   print(newsList);
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            loading
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

