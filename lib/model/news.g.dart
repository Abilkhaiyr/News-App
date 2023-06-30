// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalLanguage: $enumDecodeNullable(
          _$OriginalLanguageEnumMap, json['originalLanguage']),
      original_name: json['original_name'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['mediaType']),
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['firstAirDate'] == null
          ? null
          : DateTime.parse(json['firstAirDate'] as String),
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      originalTitle: json['originalTitle'] as String?,
      release_date: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'name': instance.name,
      'originalLanguage': _$OriginalLanguageEnumMap[instance.originalLanguage],
      'original_name': instance.original_name,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType],
      'genreIds': instance.genreIds,
      'popularity': instance.popularity,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'vote_average': instance.vote_average,
      'voteCount': instance.voteCount,
      'originCountry': instance.originCountry,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'release_date': instance.release_date?.toIso8601String(),
      'video': instance.video,
    };

const _$OriginalLanguageEnumMap = {
  OriginalLanguage.EN: 'EN',
  OriginalLanguage.JA: 'JA',
  OriginalLanguage.ES: 'ES',
};

const _$MediaTypeEnumMap = {
  MediaType.TV: 'TV',
  MediaType.MOVIE: 'MOVIE',
};
