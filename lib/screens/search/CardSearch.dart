import 'package:evn_crawl/models/news.dart';
import 'package:evn_crawl/screens/news_details/NewsDetails.dart';
import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  final NewsModel news;
  CardSearch({this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsDetails(news: news)));
      },
      child: Container(
        height: 160,
        padding: EdgeInsets.symmetric(vertical: 15),
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
                      news.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    //excerpt
                    Text(
                      news.excerpt,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    //auther
                    Text(
                      news.auther,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(child: Text("")),
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
                    image: NetworkImage(news.thumbnail),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
      ),
    );
  }
}
