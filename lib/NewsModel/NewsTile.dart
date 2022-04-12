import 'package:flutter/material.dart';
import 'NewsPage.dart';

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
                ),
              ),
            );
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
