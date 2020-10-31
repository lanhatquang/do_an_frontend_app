import 'package:flutter/material.dart';

class KeywordSearch extends StatelessWidget {
  List<String> recommend = [
    "that tinh",
    "don phuong",
    "tri ki",
    "son c ho",
  ];
  final Function callback;
  KeywordSearch({this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      height: MediaQuery.of(context).size.height,
      child: (recommend.length == 0)
          ? SizedBox()
          : ListView(
              padding: EdgeInsets.all(0),
              children: recommend
                  .map(
                    (search) => Container(
                      height: 45,
                      child: RaisedButton(
                        color: Colors.white,
                        hoverElevation: 0,
                        highlightElevation: 0,
                        hoverColor: Colors.black12,
                        highlightColor: Colors.black12,
                        splashColor: Colors.black12,
                        elevation: 0,
                        onPressed: () {
                          callback();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.history,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 20),
                              Text(search),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
