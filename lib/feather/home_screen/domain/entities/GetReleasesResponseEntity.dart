class GetReleasesResponseEntity {
  GetReleasesResponseEntity({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  DatesReleasesEntity? dates;
  num? page;
  List<ReleasesMoviesEntity>? results;
  num? totalPages;
  num? totalResults;
}

class ReleasesMoviesEntity {
  ReleasesMoviesEntity({
    this.adult,
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
  });

  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
}

class DatesReleasesEntity {
  DatesReleasesEntity({
    this.maximum,
    this.minimum,
  });

  String? maximum;
  String? minimum;
}
