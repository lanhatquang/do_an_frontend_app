import 'package:flutter/material.dart';

class CardTopic extends StatelessWidget {
  final String url;
  final String topic;
  CardTopic({
    this.url,
    this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 210,
        width: (MediaQuery.of(context).size.width - 50) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.pink[50],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(url),
                ),
              ),
              width: (MediaQuery.of(context).size.width - 50) / 2,
              height: 160,
            ),
            Text(
              topic,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
