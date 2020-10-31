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
                  Text(
                    "Yêu anh trai của bạn thân",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
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
                  Text(
                    "Jose Robinhood",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "12/08",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(child: Text("")),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "128",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "18",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment(1, -1),
            height: 120,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.pink[50],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i.pinimg.com/236x/30/05/73/3005736019ad76e58a88d1799867c221.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Container(
              height: 30,
              width: 30,
              child: IconButton(
                onPressed: () {
                  print("like");
                },
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                padding: EdgeInsets.all(0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
