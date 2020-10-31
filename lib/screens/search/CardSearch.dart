import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "Yêu anh trai của bạn thân",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  //excerpt
                  Text(
                    "Tình cờ gặp trong buổi sinh nhật bạn thân",
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
                    "Jose Robinhood",
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
                        "12/08",
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
                  image: NetworkImage(
                      "https://i.pinimg.com/236x/30/05/73/3005736019ad76e58a88d1799867c221.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ],
      ),
    );
  }
}
