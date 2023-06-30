import 'package:thousand_it_test/model/news.dart';
import 'package:thousand_it_test/resources/news_provider.dart';

class NewsRepo {
  final NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<News> fetchNews(int page) async {
    final object = await _newsApiProvider.fetchNews(page);
    return News.fromJson(object);
  }

  // Future<Res> fetchNew() async {
  //   final object = await _newsApiProvider.fetchNews();
  //   return Res.fromJson(object);
  // }

  // Future<List<Result>> fetchQ() async {
  //   final object = await _newsApiProvider.fetchQ();
  //   return Result.parseList(object);
  // }
}
