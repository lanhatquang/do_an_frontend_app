import 'package:evn_crawl/models/news.dart';
import 'package:evn_crawl/screens/news_details/NewsDetails.dart';
import 'package:flutter/material.dart';

class CardNewStory extends StatelessWidget {
  final NewsModel news;
  CardNewStory({this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsDetails(news: news)));
      },
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
                color: Color(0xffA22447).withOpacity(.05),
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 3)
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 105,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(news.thumbnail),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(2)),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 150,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title.trim(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Expanded(child: Text("")),
                  Text(
                    news.auther,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      (new DateTime.fromMillisecondsSinceEpoch(
                              int.parse(news.post_at) * 1000))
                          .toString()
                          .split(" ")[0],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
