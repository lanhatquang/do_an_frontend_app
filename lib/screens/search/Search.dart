import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:evn_crawl/screens/search/CardSearch.dart';
import 'package:evn_crawl/screens/search/KeywordSearch.dart';
import 'package:evn_crawl/screens/search/SearchTopic.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String search = "";
  bool recommend = false;
  List<String> topic = [
    "Tên truyện",
    "Chủ đề",
    "Đơn phương",
    "Tình tay ba",
    "Tri kỉ",
  ];
  List<bool> chooses = [
    true,
    false,
    false,
    false,
    false,
  ];

  // void chooseTopicSearch(int index, bool choose) {
  //   setState(() {
  //     for (var i = 0; i < topic.length; i++) {
  //       chooses[index] = false;
  //     }
  //     search = "";
  //     if (!choose) {
  //       chooses[index] = true;
  //       search = topic[index];
  //     }
  //   });
  // }

  void pickSearch() {
    setState(() {
      recommend = true;
    });
  }

  void callbackSearch() {
    setState(() {
      recommend = false;
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
            alignment: Alignment(0, 1),
            children: [
              Stack(
                alignment: Alignment(0, -1),
                children: [
                  (recommend)
                      ? KeywordSearch(callback: callbackSearch)
                      : Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(top: 101),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  CardSearch(),
                                  CardSearch(),
                                  CardSearch(),
                                  SizedBox(height: 110),
                                ],
                              ),
                            ),
                          ),
                        ),
                  Container(
                    alignment: Alignment.center,
                    height: 101,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            onTap: pickSearch,
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  style: BorderStyle.solid,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.grey.withOpacity(0.67),
                              ),
                              focusColor: Colors.grey,
                            ),
                            cursorColor: Colors.grey,
                            cursorWidth: 0.5,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                topic.length,
                                (index) => SearchTopic(
                                  name: topic[index],
                                  choose: chooses[index],
                                  // callback: chooseTopicSearch,
                                  index: index,
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
              (!recommend) ? TabBottom(screen: 2) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}