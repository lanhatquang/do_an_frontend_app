import 'dart:convert';
import 'package:evn_crawl/models/forecast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ForecastsService {
  http.Client httpClient = http.Client();

  Future<List<ForecastModel>> fecthForecasts(int count) async {
    final domain = DotEnv().env['API'];
    final String baseUrl = "$domain/weather/forecast?start=$count&limit=10";
    var response;
    try {
      response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<ForecastModel> listItem = (data as List).map((item) {
          ForecastModel forecast = ForecastModel(
            id: item["id"].toString(),
            content: item["content"],
            post_at: item["post_at"],
            thumbnail: item["thumbnail"],
            title: item["title"],
          );
          return forecast;
        }).toList();
        return listItem;
      } else {
        print("Error fetching forecast");
        throw Exception('error fetching forecast');
      }
    } catch (e) {
      print("$e");
      throw Exception('error fetching forecast');
    }
  }
}
