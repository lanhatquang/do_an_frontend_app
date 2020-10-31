import 'package:evn_crawl/screens/home/CardNewStory.dart';
import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                          child: Column(
                            children: [
                              CardNewStory(),
                              CardNewStory(),
                              CardNewStory(),
                              CardNewStory(),
                              SizedBox(height: 150),
                            ],
                          ),
                        ),
                      ),
                      // child: GridView.count(
                      //   padding: EdgeInsets.only(
                      //     top: 10,
                      //     bottom: 150,
                      //   ),
                      //   crossAxisCount: 2,
                      //   childAspectRatio:
                      //       ((MediaQuery.of(context).size.width - 40) /
                      //           2 /
                      //           210),
                      //   children: List.generate(
                      //       7,
                      //       (index) => GestureDetector(
                      //             onTap: () {
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           ListNewStories()));
                      //             },
                      //             child: CardTopic(
                      //               url: urls[index],
                      //               topic: topics[index],
                      //             ),
                      //           )),
                      // ),
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
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => Search()));
                          // },
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
  }
}
