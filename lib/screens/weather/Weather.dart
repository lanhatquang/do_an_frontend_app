import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:evn_crawl/screens/weather/CardWeather.dart';
import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            CardWeather(),
                            CardWeather(),
                            CardWeather(),
                            CardWeather(),
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
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                onPressed: null,
                              ),
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
                              "DỰ BÁO THỜI TIẾT - ĐÊM 24 VÀ NGÀY 25/10/2020",
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
      ),
    );
  }
}
