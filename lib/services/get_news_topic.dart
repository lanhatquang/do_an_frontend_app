import 'dart:convert';
import 'package:evn_crawl/models/news.dart';
import 'package:http/http.dart' as http;

class NewsTopicService {
  http.Client httpClient = http.Client();

  Future<List<NewsModel>> fecthNewsTopic(int count, int id) async {
    final domain = "http://192.168.1.28:8000/api";
    final String baseUrl = "$domain/news/topic/$id?start=$count&limit=10";
    var response;
    try {
      response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<NewsModel> listNews = (data as List).map((news) {
          NewsModel item = NewsModel(
            id: news["id"].toString(),
            auther: news["auther"],
            content: news["content"],
            excerpt: news["excerpt"],
            post_at: news["post_at"],
            thumbnail: news["thumbnail"],
            title: news["title"],
            topicId: news["topic_id"].toString(),
          );
          return item;
        }).toList();
        return listNews;
      } else {
        print("Error fetching tutorial");
        throw Exception('error fetching profile');
      }
    } catch (e) {
      print("$e");
      throw Exception('error fetching profile');
    }
  }
}
