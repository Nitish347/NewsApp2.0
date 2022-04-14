class WeatherModel{
  String name;
  String region;
  String country;
  double temp_c;
  double temp_f;
  String text;
  String icon;
  String wind_dir;
  double wind_mph;
  int humidity;
WeatherModel({this.text, this.name,this.country,this.icon,this.region,this.temp_c,this.temp_f,this.wind_dir,this.humidity,this.wind_mph});
factory WeatherModel.fromMap(Map<String, dynamic> parsedJson){
  return WeatherModel(
    name: parsedJson["location"]["name"],
    region: parsedJson["location"]["region"],
    country: parsedJson["location"]["country"],
    icon: parsedJson["current"]["condition"]["icon"],
    text: parsedJson["current"]["condition"]["text"],
    temp_c: parsedJson["current"]["temp_c"],
    temp_f: parsedJson["current"]["temp_f"],
    wind_dir: parsedJson["current"]["wind_dir"],
    humidity: parsedJson["current"]["humidity"],
    wind_mph: parsedJson["current"]["wind_mph"]
  );
}
}
