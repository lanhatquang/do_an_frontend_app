import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:evn_crawl/models/news.dart';
import 'package:evn_crawl/screens/home/CardNewStory.dart';
import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:evn_crawl/screens/search/Search.dart';
import 'package:evn_crawl/services/get_news_home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsHomeService futureNews;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureNews = NewsHomeService();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: EnhancedFutureBuilder(
    //     future: futureNews.fecthNewsHome(),
    //     rememberFutureResult: false,
    //     whenDone: (List<NewsModel> snapshot) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment(0, 1),
            children: [
              Stack(
                alignment: Alignment(0, -1),
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 55),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 160),
                          child: Column(
                            children: [
                              CardNewStory(),
                              CardNewStory(),
                              CardNewStory(),
                              CardNewStory(),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        height: 25,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Back",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Text("")),
                                    GestureDetector(
                                      child: Container(
                                        height: 25,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          "EVNCRAWL",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[400],
                          ),
                        ),
                        Expanded(child: Text("")),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TabBottom(screen: 0),
            ],
          ),
        ),
      ),
    );
    //     },
    //     whenError: (error) {
    //       return Container(
    //         color: Colors.grey[300],
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Icon(
    //                 Icons.cloud_off,
    //                 color: Colors.black45,
    //                 size: 80,
    //               ),
    //               Text(
    //                 "Something Went Wrong",
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //                 child: Text(
    //                   "News Is Unavailable. A system error or your intenet connection might be preventing tutorial from loading. Please refresh the page and try again.",
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                     fontSize: 14,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //     whenNotDone: Center(
    //       child: Container(
    //         height: 25,
    //         width: 25,
    //         child: CircularProgressIndicator(
    //           strokeWidth: 1.5,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
