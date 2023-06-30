// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class NewsApiProvider {
  Dio dioClient = Dio();

  Future fetchNews(int page) async {
    try {
      final response = await dioClient.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=ad8e4e1dc87bd782b086a1751a68be25&page=$page');
      if (response.statusCode == 200) {
        return response.data;
      }
      // print(posts[10]);
    } on DioException catch (e) {
      throw e.error!;
    }
  }

  Future fetchQ() async {
    try {
      final response = await dioClient.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=ad8e4e1dc87bd782b086a1751a68be25');
      if (response.statusCode == 200) return response.data;
      print(response.statusCode);
    } on DioException catch (e) {
      throw e.error!;
    }
  }
}
