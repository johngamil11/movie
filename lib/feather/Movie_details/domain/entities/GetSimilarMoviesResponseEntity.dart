class GetSimilarMoviesResponseEntity {
  GetSimilarMoviesResponseEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  num? page;
  List<SimilarMoviesEntity>? results;
  num? totalPages;
  num? totalResults;


}

class SimilarMoviesEntity {
  SimilarMoviesEntity({
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
      this.voteCount,});

  bool? adult;
  dynamic backdropPath;
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