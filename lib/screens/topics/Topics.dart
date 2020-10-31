import 'package:evn_crawl/screens/public/tab_bottom.dart';
import 'package:evn_crawl/screens/search/Search.dart';
import 'package:evn_crawl/screens/topics/CardTopic.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  Topics({Key key}) : super(key: key);

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List urls = [
    "https://i.pinimg.com/236x/01/a0/c4/01a0c4dc7f279545b3f38849377bde30.jpg",
    "https://i.pinimg.com/236x/0c/68/60/0c686026694bd527ae2b88c267baa66d.jpg",
    "https://i.pinimg.com/236x/29/e4/49/29e449ce5351348621d555b79c348508.jpg",
    "https://i.pinimg.com/236x/44/b6/cd/44b6cd4fced97694cc665a527b9bbb49.jpg",
    "https://i.pinimg.com/236x/ae/89/e7/ae89e7c6d1c8c8e4dbf1f7e8e48d3db8.jpg",
    "https://i.pinimg.com/236x/d0/db/1e/d0db1ec71231ca1601076acb5c1367cc.jpg",
    "https://i.pinimg.com/236x/b7/f8/99/b7f899423fde11b1ddc91ad1d94bae46.jpg",
  ];
  final List topics = [
    "Tin tức",
    "Thị trường điện",
    "Sản xuất kinh doanh",
    "Đầu tư xây dựng",
    "Đổi mới doanh nghiệp",
    "Chuyển động năng lượng",
    "Khoa học công nghệ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment(0, 1),
            children: [
              Stack(
                alignment: Alignment(0, -1),
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.count(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 150,
                        ),
                        crossAxisCount: 2,
                        childAspectRatio:
                            ((MediaQuery.of(context).size.width - 40) /
                                2 /
                                210),
                        children: List.generate(
                            7,
                            (index) => GestureDetector(
                                  child: CardTopic(
                                    url: urls[index],
                                    topic: topics[index],
                                  ),
                                )),
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
                          "Topics",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
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
              TabBottom(screen: 1),
            ],
          ),
        ),
      ),
    );
  }
}
