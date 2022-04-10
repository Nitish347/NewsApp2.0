import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../NewsModel/BreakingNewsModel.dart';
class BreakingNews extends StatefulWidget {

  @override
  _BreakingNewsState createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  List<NewsModel> newsList = new List<NewsModel>();
  bool _loading = false;

  @override
  void initSatate(){
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
    // print("nitish");
    print(newsList);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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

class NewsPage extends StatefulWidget {
  final String newsUrl;
  NewsPage({this.newsUrl});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "News",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 30),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.newsUrl,
        ),
      ),
    );
  }
}