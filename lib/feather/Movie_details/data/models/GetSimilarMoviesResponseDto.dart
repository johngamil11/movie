import 'package:movie/feather/Movie_details/domain/entities/GetSimilarMoviesResponseEntity.dart';

class GetSimilarMoviesResponseDto extends GetSimilarMoviesResponseEntity {
  GetSimilarMoviesResponseDto({
      super.page,
    super.results,
    super.totalPages,
    this.status_code,
    this.success,
    this.status_message,
    super.totalResults,});

  GetSimilarMoviesResponseDto.fromJson(dynamic json) {
    page = json['page'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(SimilarMoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? status_code ;
  String? status_message ;
  bool? success ;


}

class SimilarMoviesDto extends SimilarMoviesEntity {
  SimilarMoviesDto({
      super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,});

  SimilarMoviesDto.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}