import 'package:evn_crawl/models/weather_item.dart';
import 'package:flutter/material.dart';

class CardWeather extends StatelessWidget {
  final WeatherItem item;
  CardWeather({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            height: 160,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue,
                ),
                Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width - 160,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Container(
            child: Text(
                "asasasa sasasasa sasasasasas asasasasasas asasasaasaas asasasasas aasasasa sssssss ssssssssss ssssssss ssssss ssssss"),
          ),
        ],
      ),
    );
  }
}
