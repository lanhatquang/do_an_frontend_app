import 'package:evn_crawl/models/forecast.dart';
import 'package:flutter/material.dart';

class ForecostDetails extends StatefulWidget {
  final ForecastModel forecast;
  ForecostDetails({this.forecast});

  @override
  _ForecostDetailsState createState() => _ForecostDetailsState();
}

class _ForecostDetailsState extends State<ForecostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.forecast.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.forecast.title,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        (new DateTime.fromMillisecondsSinceEpoch(
                                int.parse(widget.forecast.post_at) * 1000))
                            .toString()
                            .split(" ")[0],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      SizedBox(height: 20),
                      Text(widget.forecast.content),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
