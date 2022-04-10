import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoneauth/Tabs/breaking_news.dart';

import '../NewsModel/BreakingNewsModel.dart';

class BreakingNewsTab extends StatefulWidget {


  @override
  _BreakingNewsTabState createState() => _BreakingNewsTabState();
}

class _BreakingNewsTabState extends State<BreakingNewsTab> {

  List<NewsModel> newsList = new List<NewsModel>();
  bool _loading = false;


  void initState(){
    getNews();
    super.initState();
  }

  getNews() async {
    setState(() {
      _loading = true;
    });
    newsList = new List();
    String api_url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=2b826ea9d85542a898f1ef683de48b71";
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
class NewsTile extends StatelessWidget {
  String title, desc, url, imgurl;
  NewsTile({this.title, this.imgurl, this.url, this.desc});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsPage(
                      newsUrl: url,
                    )));
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    imgurl,
                    fit: BoxFit.cover,
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        color: Colors.teal.withOpacity(0.3),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  desc,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height / 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
