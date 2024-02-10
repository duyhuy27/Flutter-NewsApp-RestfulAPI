import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_category_models.dart';
import 'package:news_app/models/news_chanel_headlines_models.dart';

class NewsRepository {
  Future<NewsChanelHeadlines> fetchNewsChanelHeadinglinesApi(
      String country, lang) async {
    String url =
        "https://newsdata.io/api/1/news?apikey=pub_37931bf3a533b7268df2b7d6fa1813f68b933&q=top&language=$lang&country=$country";

    final reponse = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(reponse.body);
    }
    if (reponse.statusCode == 200) {
      final body = json.decode(utf8.decode(reponse.bodyBytes));
      return NewsChanelHeadlines.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<NewsCategory> fetchNewsCategoryApi(String category) async {
    String url =
        "https://newsdata.io/api/1/news?apikey=pub_37931bf3a533b7268df2b7d6fa1813f68b933&language=en&category=$category";

    final reponse = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(reponse.body);
    }
    if (reponse.statusCode == 200) {
      final body = json.decode(utf8.decode(reponse.bodyBytes));
      return NewsCategory.fromJson(body);
    }
    throw Exception('Error');
  }
}
