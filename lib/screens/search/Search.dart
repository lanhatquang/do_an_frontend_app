import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:evn_crawl/models/news.dart';
import 'package:evn_crawl/screens/search/CardSearch.dart';
import 'package:evn_crawl/screens/search/searching.dart';
import 'package:evn_crawl/services/get_news_search.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<NewsModel>> futureSearch;
  int _counter = 0;
  bool isSearch = false;
  String searching;
  String rememberSearch;
  Future<String> remember;

  @override
  void initState() {
    super.initState();
  }

  void callbackSearch(String search) {
    print("searching...");
    setState(() {
      isSearch = true;
      searching = search;
      futureSearch = NewsSearchService().fecthNewsSearch(search);
      print("vao day 1");
    });
  }

  void callbackPickSearch() {
    setState(() {
      isSearch = false;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      futureSearch = NewsSearchService().fecthNewsSearch(searching);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment(0, -1),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 120),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 10),
                    child: (isSearch)
                        ? EnhancedFutureBuilder<List<NewsModel>>(
                            future: futureSearch,
                            rememberFutureResult: false,
                            whenDone: (snapshot) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: snapshot
                                      .map((e) => CardSearch(news: e))
                                      .toList(),
                                ),
                              );
                            },
                            whenError: (error) {
                              print("$error");
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.cloud_off,
                                        color: Colors.black45,
                                        size: 80,
                                      ),
                                      Text(
                                        "Something Went Wrong",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Text(
                                          "Searching Is Unavailable. A system error or your intenet connection might be preventing tutorial from loading. Please refresh the page and try again.",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            whenNotDone: Center(
                              child: Container(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
              ),
              Searching(
                callback: callbackSearch,
                callbackick: callbackPickSearch,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
