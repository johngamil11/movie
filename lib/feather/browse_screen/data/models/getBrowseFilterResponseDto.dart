
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseFilterResposeEntity.dart';

class GetBrowseFilterResponseDto extends GetBrowseFilterResposeEntity {
  GetBrowseFilterResponseDto({
      super.page,
    super.results,
    this.status_code,
    this.success,
    this.status_message,
    super.totalPages,
    super.totalResults,});

  GetBrowseFilterResponseDto.fromJson(dynamic json) {
    page = json['page'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(BrowseFilterDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? status_code ;
  String? status_message ;
  bool? success ;

}

class BrowseFilterDto extends BrowseFilterEntity{
  BrowseFilterDto({
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

  BrowseFilterDto.fromJson(dynamic json) {
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