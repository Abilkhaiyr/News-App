import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thousand_it_test/bloc/news_bloc.dart';
import 'package:thousand_it_test/bloc/news_state.dart';
import 'package:thousand_it_test/widgets/favourite_widget.dart';
import 'package:thousand_it_test/widgets/vote_widget.dart';

class DetailsPage extends StatefulWidget {
  final String? title;
  final String? posterPath;
  final DateTime? releaseDate;
  final double? voteAverage;
  final String? overview;
  const DetailsPage({
    super.key,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.overview,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late NewsBloc newsBloc;

  // @override
  // void initState() {
  //   super.initState();
  //   newsBloc = BlocProvider.of<NewsBloc>(context);
  //   newsBloc.add(FetchNewsEvent());
  // }

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
              // newsBloc.add(FetchNewsEvent());
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: Scaffold(
              backgroundColor: Colors.blueAccent.withOpacity(0.5),
              appBar: AppBar(
                title: Text(widget.title!),
                centerTitle: true,
                backgroundColor: const Color(0xff253B49),
              ),
              body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w200${widget.posterPath}'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            height: 450,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        VoteWidget(
                                          voteAverage: widget.voteAverage,
                                        ),
                                        const FavouriteWidget(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 200,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        widget.title!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        widget.releaseDate
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.overview!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoadingNewsState) {
          return Scaffold(
            backgroundColor: Colors.blueAccent.withOpacity(0.5),
            body: const Center(
                child: CupertinoActivityIndicator(
              color: Colors.amber,
              radius: 20,
            )),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
