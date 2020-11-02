import 'package:evn_crawl/models/weather_item.dart';
import 'package:flutter/material.dart';

class CardWeather extends StatelessWidget {
  final WeatherItem item;
  CardWeather({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 160,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(item.icon.trim()),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  height: 160,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: MediaQuery.of(context).size.width - 160,
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Text(
                        item.area.trim().toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(item.inf_2.trim()),
                      SizedBox(height: 5),
                      Text(item.inf_3.trim()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(item.inf_1.trim()),
          ),
        ],
      ),
    );
  }
}
