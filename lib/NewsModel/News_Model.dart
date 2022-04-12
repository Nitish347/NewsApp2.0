// class PoliticsModel{
//   String name;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   String publishedAt;
//   PoliticsModel({this.name,this.title,this.url,this.urlToImage,this.description,this.publishedAt});
//   factory PoliticsModel.fromMap(Map<String,dynamic> parsedJson){
//     return PoliticsModel(
//       name: parsedJson["name"],
//       title: parsedJson["title"],
//       url: parsedJson["url"],
//       description: parsedJson["description"],
//       publishedAt: parsedJson["publishedAt"],
//       urlToImage: parsedJson["urlToImage"]
//     );
//   }
// }

class PolticsModel{
  String title;
  String descreption;
  String url;
  String imgurl;
  String name;
  PolticsModel({this.url,this.name,this.title,this.descreption,this.imgurl});
  factory PolticsModel.fromMap(Map<String, dynamic> parsedJson) {
    return PolticsModel(
        url: parsedJson["url"],
        descreption: parsedJson["description"],
        imgurl: parsedJson["urlToImage"],
        name:  parsedJson["name"],
        title: parsedJson["title"]
    );
  }
}