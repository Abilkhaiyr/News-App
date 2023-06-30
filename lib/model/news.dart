import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class News {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  News({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Result {
  bool? adult;
  String? backdrop_path;
  int? id;
  String? name;
  OriginalLanguage? originalLanguage;
  String? original_name;
  String? overview;
  String? poster_path;
  MediaType? mediaType;
  List<int>? genreIds;
  double? popularity;
  DateTime? firstAirDate;
  double? vote_average;
  int? voteCount;
  List<String>? originCountry;
  String? title;
  String? originalTitle;
  DateTime? release_date;
  bool? video;

  Result({
    this.adult,
    this.backdrop_path,
    this.id,
    this.name,
    this.originalLanguage,
    this.original_name,
    this.overview,
    this.poster_path,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.vote_average,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
    this.release_date,
    this.video,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

enum MediaType { TV, MOVIE }

enum OriginalLanguage { EN, JA, ES }
