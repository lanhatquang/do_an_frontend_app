import 'package:evn_crawl/screens/news_topic/NewsTopic.dart';
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
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/vanht/files/QI_2017/sc3.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/vanht/images/VANHT/T8/T10/tp.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/anhptl/files/0_012_7130.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/anhptl/files/0_012_7064.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/anhptl/files/0_017_28_12_18.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/vanht/files/2019/4129_IMG_0148.jpg&IW=130",
    "http://icon.com.vn/DesktopModules/ePowerPortal_CMS/FrontEnd/Thumbnail.aspx?IP=//Portals/0/userfiles/anhptl/files/0_012_8019.jpg&IW=130",
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewsTopic(
                                                  id: index + 1,
                                                  topic: topics[index],
                                                )));
                                  },
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
                          "TOPICS",
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
              TabBottom(screen: 1),
            ],
          ),
        ),
      ),
    );
  }
}
