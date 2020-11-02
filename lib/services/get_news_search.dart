import 'dart:convert';
import 'package:evn_crawl/models/news.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NewsSearchService {
  http.Client httpClient = http.Client();

  Future<List<NewsModel>> fecthNewsSearch(String key) async {
    final domain = DotEnv().env['API'];
    final String baseUrl = "$domain/news/search?searchKey=$key";
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
