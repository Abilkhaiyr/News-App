import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thousand_it_test/bloc/news_bloc.dart';
import 'package:thousand_it_test/bloc/news_event.dart';
import 'package:thousand_it_test/bloc/news_state.dart';
import 'package:thousand_it_test/features/details_page.dart';
import 'package:thousand_it_test/widgets/vote_widget.dart';

import '../widgets/favourite_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc newsBloc;
  ScrollController scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(FetchNewsEvent(page));
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      newsBloc.add(FetchNewsEvent(page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is FetchedNewsState) {
          return RefreshIndicator(
            backgroundColor: Colors.amber,
            color: Colors.red,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              // while ( < 10) {
              newsBloc.add(FetchNewsEvent(page));
              //   page++;
              // }
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: ListView.separated(
                controller: scrollController,
                itemBuilder: (BuildContext context, index) {
                  state.news.results!.removeWhere((item) {
                    return state.news.results![index].poster_path == null;
                    // return state.news[0];
                  });
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    title: state.news.results![index].title,
                                    voteAverage:
                                        state.news.results![index].vote_average,
                                    posterPath:
                                        state.news.results![index].poster_path,
                                    releaseDate:
                                        state.news.results![index].release_date,
                                    overview:
                                        state.news.results![index].overview,
                                  )),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  opacity: 0.5,
                                  image: state.news.results![index].poster_path!
                                          .isNotEmpty
                                      ? NetworkImage(
                                          'https://image.tmdb.org/t/p/w200'
                                          '${state.news.results![index].poster_path}')
                                      : const NetworkImage(''),
                                  fit: BoxFit.fill),
                            ),
                            height: 450,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: null,
                                      child: VoteWidget(
                                        voteAverage: state
                                            .news.results![index].vote_average,
                                      ),
                                    ),
                                    const FavouriteWidget(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Column(
                                  children: [
                                    Text(
                                      (state.news.results![index].title != null)
                                          ? state.news.results![index].title
                                              .toString()
                                          : state.news.results![index]
                                              .original_name
                                              .toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      (state.news.results![index]
                                                  .release_date !=
                                              null)
                                          ? state
                                              .news.results![index].release_date
                                              .toString()
                                              .substring(0, 10)
                                          : '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(),
                itemCount: state.news.results!.length),
          );
        } else if (state is LoadingNewsState) {
          return const Center(
              child: CupertinoActivityIndicator(
            color: Colors.amber,
            radius: 20,
          ));
        } else if (state is FetchNewsFailureState) {
          return Center(child: Text(state.error));
        } else {
          return Container();
        }
      },
    );
  }
}
