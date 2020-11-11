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
    "https://lh3.googleusercontent.com/proxy/bx0LgCEZU_i84KUVEEJEpGPxj6myNNjTfXd3ChALN46h1opw0Kpzhk0mFwoKP65AjjMnRLdHdQtwYOR1r05aYQbH3xvPnnZk5NiGgS0FQj_GPOnglKq8M7ACoh9Y",
    "https://lh3.googleusercontent.com/proxy/fT8LGPUQpRdVFe55HafktDaGu2DX6_gDoN_Z35_oCcF1X8b2pUvttvYa76LEbsmDTVeJeE0SDh0zFzP34yLgjw5PVaGBt-VMIcClISZ8CdH0yeMRWCrII1TWaFpd5R5NOnuEmg-Obkf-s_bz_nknycEmyOiFcdXVxNwueKY_ySedB2cOB9IbqgwJ33h5INw9s1QBlFCCVAZrUbfnNYd4sizmoVVYorfA10jeYt9RGrhpP8-ZPpnLAuo3w-OYJ5Drq3ABdT_01LD1StmXytnM_uCDXEBya1Pxzb5p9N-mLIxLwLjdSkP6Z4Y",
    "https://tuyensinh.hueic.edu.vn/wp-content/uploads/2017/03/dich-vu-bao-tri-bao-duong-he-thong-dien-cong-nghiep.jpg",
    "https://lh3.googleusercontent.com/proxy/JxRvO_6wLa1m22S3rRDEUSRjrXHXc9LoI_tRxz7mJNjb6u6clLcMu13OaVaVLSSBkPIsVHhdmJwVx_zR8qz-B-cJNdBoeWt4IatakORCcUw2mRm32n43yhejJ_e_JfZ11vLhLffIOffcO5BZAIg8VrywJLg",
    "https://lh3.googleusercontent.com/proxy/u9V_UR5Dh6tkUhVdFB840mKNwKv6lZiACB8SZL07a7vRijtUVJuZVk-JWr0WSPcxwocsaArNwEgjBEvPT0ho-5Idb1vnxPbvjUyqVcK50o7LROC4VQ5su4q8wp40awyxbnvA9hWACKsOJcaiP6Srn2Jp7M-eoBdCow",
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
