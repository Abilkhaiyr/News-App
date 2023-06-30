import 'package:thousand_it_test/model/news.dart';

abstract class NewsState {}

class InititalNewsState extends NewsState {}

class LoadingNewsState extends NewsState {}

class FetchedNewsState extends NewsState {
  final News news;
  FetchedNewsState(this.news);
}

class FetchNewsFailureState extends NewsState {
  final String error;
  FetchNewsFailureState(this.error);
}
