import 'package:evn_crawl/models/news.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel news;
  NewsDetails({this.news});

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
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
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.news.thumbnail),
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
                        widget.news.title,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            widget.news.auther,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          Text(" - "),
                          Text(
                            (new DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(widget.news.post_at) * 1000))
                                .toString()
                                .split(" ")[0],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      SizedBox(height: 20),
                      Text(widget.news.content == ""
                          ? widget.news.excerpt
                          : widget.news.content),
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
