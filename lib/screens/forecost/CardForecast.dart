import 'package:evn_crawl/models/forecast.dart';
import 'package:evn_crawl/screens/forecost_details/ForecostDetails.dart';
import 'package:flutter/material.dart';

class CardForecast extends StatelessWidget {
  final ForecastModel forecast;
  CardForecast({this.forecast});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForecostDetails(forecast: forecast)));
      },
      child: Container(
        height: 160,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      forecast.title,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Expanded(child: Text("")),
                    Row(
                      children: [
                        Expanded(child: Text("")),
                        //post_at
                        Text(
                          (new DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(forecast.post_at) * 1000))
                              .toString()
                              .split(" ")[0],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.pink[50],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    //thumbnail
                    image: NetworkImage(forecast.thumbnail),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
      ),
    );
  }
}
