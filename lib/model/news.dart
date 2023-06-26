import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class News {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

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
  final String? backdrop_path;
  final int? id;
  final String? name;
  final OriginalLanguage? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? poster_path;
  final MediaType? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final DateTime? firstAirDate;
  final double? vote_average;
  final int? voteCount;
  final List<String>? originCountry;
  final String? title;
  final String? originalTitle;
  final DateTime? release_date;
  final bool? video;

  Result({
    this.adult,
    this.backdrop_path,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
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
