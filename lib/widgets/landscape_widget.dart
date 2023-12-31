import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thousand_it_test/bloc/news_bloc.dart';
import 'package:thousand_it_test/bloc/news_state.dart';
import 'package:thousand_it_test/features/details_page.dart';
import 'package:thousand_it_test/model/news.dart';
import 'package:thousand_it_test/widgets/favourite_widget.dart';
import 'package:thousand_it_test/widgets/vote_widget.dart';

class LandscapeWidget extends StatefulWidget {
  final News news;

  const LandscapeWidget({super.key, required this.news});

  @override
  State<LandscapeWidget> createState() => _LandscapeWidgetState();
}

class _LandscapeWidgetState extends State<LandscapeWidget> {
  late NewsBloc newsBloc;
  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<NewsBloc>(context);
    // newsBloc.add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is FetchedNewsState) {
          return RefreshIndicator(
            // displacement: 250,
            backgroundColor: Colors.amber,
            color: Colors.red,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              // newsBloc.add(FetchNewsEvent());
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  widget.news.results!.removeWhere((item) =>
                      widget.news.results![index].poster_path == null);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    title: widget.news.results![index].title,
                                    voteAverage: widget
                                        .news.results![index].vote_average,
                                    posterPath:
                                        widget.news.results![index].poster_path,
                                    releaseDate: widget
                                        .news.results![index].release_date,
                                    overview:
                                        widget.news.results![index].overview,
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
                                  image: widget.news.results![index]
                                          .poster_path!.isNotEmpty
                                      ? NetworkImage(
                                          'https://image.tmdb.org/t/p/w200'
                                          '${widget.news.results![index].poster_path}')
                                      : const NetworkImage(''),
                                  fit: BoxFit.cover),
                            ),
                            height: 550,
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
                                        voteAverage: widget
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
                                      '${widget.news.results![index].title}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      widget.news.results![index].release_date
                                          .toString()
                                          .substring(0, 10),
                                      style: const TextStyle(
                                        fontSize: 30,
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
                itemCount: widget.news.results!.length),
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
