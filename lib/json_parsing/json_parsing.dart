import 'dart:convert';
import 'package:http/http.dart' as http;
import '../NewsModel/BreakingNewsModel.dart';
import '../NewsModel/News_Model.dart';


class JsonParsing{

  // static List<NewsModel> newsList = new List<NewsModel>();
  // static bool loading = false;

  static Future<List<PolticsModel>> getNewsTabs(String query, List<PolticsModel> newsList)async{


    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$query&apiKey=2b826ea9d85542a898f1ef683de48b71";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = json.decode(response.body);
    jsonData["articles"].forEach((element) {
      if (element["title"] != null &&
          element["url"] != null &&
          element["description"] != null &&
          element["urlToImage"] != null) {
        PolticsModel newsModel = new PolticsModel();
        newsModel = PolticsModel.fromMap(element);
        newsList.add(newsModel);
      } else {}
    });
    // print(newsList);
    return newsList;
  }
}

// void main(){
//   JsonParsing.getNewsTabs('politics');
// }

