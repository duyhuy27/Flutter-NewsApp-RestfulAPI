import 'package:news_app/models/news_category_models.dart';
import 'package:news_app/models/news_chanel_headlines_models.dart';
import 'package:news_app/repository/news_repository.dart';

class NewViewModel {
  final _rep = NewsRepository();

  Future<NewsChanelHeadlines> fetchNewsChanelHeadinglinesApi(
      String country, lang) async {
    final reponse = await _rep.fetchNewsChanelHeadinglinesApi(country, lang);

    return reponse;
  }

  Future<NewsCategory> fetchNewsCategoryApi(String category) async {
    final reponse = await _rep.fetchNewsCategoryApi(category);

    return reponse;
  }
}
