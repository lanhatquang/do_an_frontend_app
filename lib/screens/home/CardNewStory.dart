import 'package:flutter/material.dart';

class CardNewStory extends StatelessWidget {
  const CardNewStory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
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
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/236x/99/ec/40/99ec40218395c6d7528dd2481f27fa45.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Tình cờ gặp trong buổi sinh nhật bạn thân rồi say ánh mắt của anh.",
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
            width: MediaQuery.of(context).size.width - 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Jose Robinhood",
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
                Text(
                  "#ddd",
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
                    margin: EdgeInsets.only(right: 5),
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
          ),
        ],
      ),
    );
  }
}
