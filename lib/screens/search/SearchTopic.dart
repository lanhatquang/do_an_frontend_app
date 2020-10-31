import 'package:flutter/material.dart';

class SearchTopic extends StatelessWidget {
  final bool choose;
  final String name;
  final int index;
  // final Function callback;
  SearchTopic({
    this.choose,
    this.name,
    // this.callback,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    if (choose) {
      color = Colors.red[400];
    }
    return GestureDetector(
      // onTap: callback(index, choose),
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
