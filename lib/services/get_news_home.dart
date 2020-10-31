import 'dart:convert';
import 'package:evn_crawl/models/news.dart';
import 'package:http/http.dart' as http;

class NewsHomeService {
  http.Client httpClient = http.Client();

  Future<List<NewsModel>> fecthNewsHome() async {
    final domain = "http://localhost:8000/api";
    final String baseUrl = "$domain/news/news?start=10&limit=10";
    print(baseUrl);
    var response;
    response = await httpClient.get(baseUrl);
    print("fetched tutorial");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      print("$data");
      List<NewsModel> listNews = data.map((news) {
        return NewsModel(
          id: news["id"],
          auther: news["auther"],
          content: news["content"],
          excerpt: news["excerpt"],
          post_at: news["post_at"],
          thumbnail: news["thumbnail"],
          title: news["title"],
          topicId: news["topic_id"],
        );
      }).toList();
      return listNews;
    } else {
      print("Error fetching tutorial");
      throw Exception('error fetching profile');
    }
  }
}
