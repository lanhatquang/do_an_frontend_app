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
    "https://img.timviecdientu.com/2019/08/trien-vong-nganh-dien-tu-vien-thong-4.jpg",
    "https://image.sggp.org.vn/w840/Uploaded/2020/evofjasfzyr/2019_12_09/1_7_obgt.gif",
    "https://lh3.googleusercontent.com/proxy/_FJP3uS7HQ8dzYBKrOGuJWJgKekEJpmk2B0GHRTFBWMxdEwxgFzgOTlB4SGzE43DhO77BS1Mmr3VvcgsatUzE_3iVfT_CHlywBfJVk8gcsgZ3fWnmCN5QCF6u_TWZL1YP9K__wBNhPZFdtreMKvcUx8czPo",
    "https://www.pvpower.vn/wp-content/uploads/2017/05/nhontrach2.jpg",
    "https://tuyensinh.hueic.edu.vn/wp-content/uploads/2017/03/dich-vu-bao-tri-bao-duong-he-thong-dien-cong-nghiep.jpg",
    "https://hanoimoi.com.vn/Uploads/images/phananh/2020/07/02/dien.jpg",
    "https://vnn-imgs-f.vgcloud.vn/2019/12/17/14/dien-luc-viet-nam-65-nam-phuc-vu-nhan-dan.jpg",
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
