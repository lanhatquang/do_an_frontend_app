import 'package:evn_crawl/models/weather_item.dart';

class WeatherModel {
  final String id;
  final String title;
  List<WeatherItem> items;

  WeatherModel({
    this.id,
    this.title,
    this.items,
  });
}
