import 'dart:convert';
import 'package:hive/hive.dart';

part 'movie_list_response.g.dart';

List<MovieData> movieListFromJson(String str) =>
    List<MovieData>.from(json.decode(str).map((x) => MovieParent.fromJson(x)));

MovieData movieFromJson(String str) {
  final decodedJson = jsonDecode(str);
  return MovieData.fromJson(decodedJson);
}

@HiveType(typeId: 0)
class MovieParent {
  @HiveField(0)
  num? page;
  @HiveField(1)
  List<MovieData>? results;
  @HiveField(2)
  num? totalPages;
  @HiveField(3)
  num? totalResults;

  MovieParent({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieParent.fromJson(Map<dynamic, dynamic> json) {
    return MovieParent(
      page: json['page'] as num?,
      results: json['results'] as List<MovieData>?,
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );
  }

  Map<dynamic, dynamic> toJson() => {
        'page': page,
        'results': results,
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  MovieParent copyWith({
    num? page,
    List<MovieData>? results,
    num? totalPages,
    num? totalResults,
  }) {
    return MovieParent(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults);
  }
}

@HiveType(typeId: 1)
class MovieData {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<dynamic>? genreIds;
  @HiveField(3)
  num? id;
  @HiveField(4)
  String? originalLanguage;
  @HiveField(5)
  String? originalTitle;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  num? popularity;
  @HiveField(8)
  String? posterPath;
  @HiveField(9)
  String? releaseDate;
  @HiveField(10)
  String? title;
  @HiveField(11)
  bool? video;
  @HiveField(12)
  num? voteAverage;
  @HiveField(13)
  num? voteCount;
  @HiveField(14)
  String? tagline;
  @HiveField(15)
  num? runtime;
  @HiveField(16)
  List<dynamic>? genres;
  @HiveField(17)
  List<dynamic>? spokenLanguages;
  @HiveField(18)
  num? revenue;

  MovieData(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.tagline,
      this.runtime,
      this.genres,
      this.spokenLanguages,
      this.revenue});

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: json['genre_ids'] as List<dynamic>?,
      id: json['id'] as num?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as num?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
      tagline: json['tagline'] as String?,
      runtime: json['runtime'] as num?,
      genres: json['genres'] as List<dynamic>?,
      spokenLanguages: json['spoken_languages'] as List<dynamic>?,
      revenue: json['revenue'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdropPath': backdropPath,
        'genreIds': genreIds,
        'id': id,
        'originalLanguage': originalLanguage,
        'originalTitle': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'posterPath': posterPath,
        'releaseDate': releaseDate,
        'title': title,
        'video': video,
        'voteAverage': voteAverage,
        'voteCount': voteCount,
        'tagline': tagline,
        'runtime': runtime,
        'genres': genres,
        'spokenLanguages': spokenLanguages,
        'revenue': revenue,
      };

  MovieData copyWith({
    bool? adult,
    String? backdropPath,
    List<dynamic>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
    String? tagline,
    num? runtime,
    List<dynamic>? genres,
    List<String>? spokenLanguages,
    num? revenue,
  }) {
    return MovieData(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      tagline: tagline ?? this.tagline,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      revenue: revenue ?? this.revenue,
    );
  }
}
