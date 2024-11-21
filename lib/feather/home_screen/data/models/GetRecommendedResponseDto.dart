import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';

class GetRecommendedResponseDto extends GetRecommendedResponseEntity{
  GetRecommendedResponseDto({
      super.page,
    super.results,
    super.totalPages,
    this.status_message,
    this.success,
    this.status_code,
    super.totalResults,});

  GetRecommendedResponseDto.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(RecommendedMoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    totalResults = json['total_results'];
  }
  int? status_code ;
  String? status_message ;
  bool? success ;}

class RecommendedMoviesDto extends RecommendedMovieEntity {
  RecommendedMoviesDto({
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

  RecommendedMoviesDto.fromJson(dynamic json) {
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