import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:evn_crawl/models/weather.dart';
import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:evn_crawl/screens/weather/CardWeather.dart';
import 'package:evn_crawl/services/get_weather.dart';
import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherService futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = WeatherService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnhancedFutureBuilder(
        future: futureWeather.fecthWeather(),
        rememberFutureResult: false,
        whenDone: (WeatherModel snapshot) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment(0, 1),
                children: [
                  Stack(
                    alignment: Alignment(0, -1),
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(top: 101),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Column(
                                  children: snapshot.items
                                      .map((e) => CardWeather(item: e))
                                      .toList(),
                                ),
                                SizedBox(height: 110),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 81,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Weather 24h",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(child: Text("")),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  snapshot.title.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TabBottom(screen: 3),
                ],
              ),
            ),
          );
        },
        whenError: (error) {
          return Container(
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.cloud_off,
                    color: Colors.black45,
                    size: 80,
                  ),
                  Text(
                    "Something Went Wrong",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      "News Is Unavailable. A system error or your intenet connection might be preventing tutorial from loading. Please refresh the page and try again.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        whenNotDone: Center(
          child: Container(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
