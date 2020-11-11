import 'package:evn_crawl/screens/forecost/Forecost.dart';
import 'package:evn_crawl/screens/home/Home.dart';
import 'package:evn_crawl/screens/search/Search.dart';
import 'package:evn_crawl/screens/topics/Topics.dart';
import 'package:evn_crawl/screens/weather/Weather.dart';
import 'package:flutter/material.dart';

class TabBottom extends StatelessWidget {
  final int screen;
  TabBottom({this.screen});

  Widget _buildIcon(
      IconData icon, int choose, BuildContext context, Widget render) {
    return GestureDetector(
      onTap: () {
        if (this.screen != 0) {
          Navigator.pop(context);
        }
        if (choose != this.screen) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => render));
        }
      },
      child: Container(
        height: 25,
        width: 25,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Icon(
          icon,
          color: choose == this.screen ? Colors.red[400] : Colors.black,
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 70,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/proxy/sgisCVRcojXxtZYsqAPPuSj3SzKNQ_qYmGNG71POQANkHoRElzjNqEfR7UXEmmIMnuQxtabBf7sSbzWGk0GKniYYJUjZ0JgDWfEjMA"),
                ),
              ),
            ),
            Text(
              "Home",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (this.screen != 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment(0, 1),
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: (width - 70) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIcon(Icons.dashboard, 1, context, Topics()),
                      _buildIcon(Icons.search, 2, context, Search()),
                    ],
                  ),
                ),
                Expanded(child: Text("")),
                Container(
                  alignment: Alignment.center,
                  width: (width - 70) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIcon(Icons.filter_drama, 3, context, Weather()),
                      _buildIcon(Icons.report_problem, 4, context, Forecost()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildInfo(context),
        ],
      ),
    );
  }
}
