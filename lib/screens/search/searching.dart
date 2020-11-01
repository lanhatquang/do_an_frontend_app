import 'dart:convert' as convert;

import 'package:evn_crawl/services/remember_search.dart';
import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  final Function callback;
  final Function callbackick;
  Searching({
    this.callback,
    this.callbackick,
  });
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  TextEditingController controllerSearch;
  Future<List<String>> futureRemember;
  bool recommend = false;
  List<String> remember = [];
  @override
  void initState() {
    super.initState();
    controllerSearch = TextEditingController();
    futureRemember = readRememberSearch();
  }

  void checkExit(String value) {
    bool isCheck = true;
    for (var item in remember) {
      if (item == value.trim()) {
        isCheck = false;
        break;
      }
    }
    if (isCheck) {
      remember.insert(0, value.trim());
    }
  }

  void saveRemember(List<String> rem) async {
    String remember = convert.jsonEncode(Remember(remember: rem).toJson());
    await saveRememberSearch(remember);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Search",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<String>>(
              future: futureRemember,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("data:${snapshot.data}");
                  return Stack(
                    children: <Widget>[
                      (recommend)
                          ? Container(
                              padding: EdgeInsets.only(top: 50),
                              height: MediaQuery.of(context).size.height - 200,
                              child: (snapshot.data == null)
                                  ? SizedBox()
                                  : ListView(
                                      padding: EdgeInsets.all(0),
                                      children: snapshot.data
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
                                                  recommend = false;
                                                  widget.callback(search);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
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
                            )
                          : SizedBox(),
                      Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controllerSearch,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            if (value.trim() != "") {
                              recommend = false;
                              remember = snapshot.data;
                              checkExit(value);
                              widget.callback(value);
                              saveRemember(remember);
                            }
                          },
                          onTap: () {
                            setState(() {
                              recommend = true;
                              widget.callbackick();
                            });
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  if (controllerSearch.text.trim() != "") {
                                    recommend = false;
                                    remember = snapshot.data;
                                    checkExit(controllerSearch.text);
                                    widget.callback(controllerSearch.text);
                                    saveRemember(remember);
                                  }
                                }),
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: "Search",
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: controllerSearch,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.trim() != "") {
                          recommend = false;
                          checkExit(value);
                          widget.callback(value);
                          saveRemember(remember);
                        }
                      },
                      onTap: () {
                        recommend = true;
                        widget.callbackick();
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              if (controllerSearch.text.trim() != "") {
                                recommend = false;
                                checkExit(controllerSearch.text);
                                widget.callback(controllerSearch.text);
                                saveRemember(remember);
                              }
                            }),
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: "Search",
                      ),
                    ),
                  );
                }
                return Center(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
