import 'dart:convert';
import 'package:evn_crawl/models/weather.dart';
import 'package:evn_crawl/models/weather_item.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  http.Client httpClient = http.Client();

  Future<WeatherModel> fecthWeather() async {
    final domain = DotEnv().env['API'];
    final String baseUrl = "$domain/weather";
    var response;
    try {
      response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<WeatherItem> listItem =
            (data["weather_items"] as List).map((value) {
          WeatherItem item = WeatherItem(
            id: value["id"].toString(),
            icon: value["icon"],
            area: value["area"],
            inf_1: value["inf_1"],
            inf_2: value["inf_2"],
            inf_3: value["inf_3"],
          );
          return item;
        }).toList();
        return WeatherModel(
          id: data["weather_earth"]["id"].toString(),
          title: data["weather_earth"]["title"],
          items: listItem,
        );
      } else {
        print("Error fetching tutorial");
        throw Exception('error fetching profile');
      }
    } catch (e) {
      print("$e");
      throw Exception('error fetching profile');
    }
  }
}
