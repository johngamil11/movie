import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';

class GetReleasesResponseDto extends GetReleasesResponseEntity {
  GetReleasesResponseDto({
    super.dates,
    super.page,
    this.success,
    this.status_message,
    this.status_code,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  GetReleasesResponseDto.fromJson(dynamic json) {
    dates =
        json['dates'] != null ? DatesReleasesDto.fromJson(json['dates']) : null;
    page = json['page'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ReleaseMoviesDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? status_code;

  String? status_message;

  bool? success;
}

class ReleaseMoviesDto extends ReleasesMoviesEntity {
  ReleaseMoviesDto({
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
    super.voteCount,
  });

  ReleaseMoviesDto.fromJson(dynamic json) {
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

class DatesReleasesDto extends DatesReleasesEntity {
  DatesReleasesDto({
    super.maximum,
    super.minimum,
  });

  DatesReleasesDto.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}
