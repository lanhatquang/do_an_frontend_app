import 'package:evn_crawl/models/news.dart';
import 'package:flutter/material.dart';

class CardNewStory extends StatelessWidget {
  final NewsModel news;
  CardNewStory({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Color(0xffA22447).withOpacity(.05),
              offset: Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 3)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                //thumbnail
                image: DecorationImage(
                  image: NetworkImage(news.thumbnail),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            //title
            child: Text(
              news.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            //excerpt
            child: Text(
              news.excerpt,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          Expanded(child: Text("")),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width - 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                //auther
                Text(
                  news.auther,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 1,
                  height: 15,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                //post_at
                Text(
                  (new DateTime.fromMillisecondsSinceEpoch(
                          int.parse(news.post_at) * 1000))
                      .toString()
                      .split(" ")[0],
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(right: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Center(
                      child: Text(
                        "Read now",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
