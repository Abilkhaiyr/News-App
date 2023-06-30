import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thousand_it_test/bloc/news_event.dart';
import 'package:thousand_it_test/bloc/news_state.dart';
import 'package:thousand_it_test/model/news.dart';
import 'package:thousand_it_test/resources/news_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo newsRepo = NewsRepo();

  NewsBloc() : super(InititalNewsState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(LoadingNewsState());
      try {
        News newsModel = await newsRepo.fetchNews(event.page);
        //Res res = await newsRepo.fetchNew();
        // List<Result> res = await newsRepo.fetchQ();
        emit(FetchedNewsState(newsModel));
      } catch (e) {
        emit(FetchNewsFailureState(e.toString()));
      }
    });
  }
}
