part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}
final class MovieDetailsLoadingState extends MovieDetailsState {}
final class MovieDetailsErrorState extends MovieDetailsState {
  Failures failures ;
  MovieDetailsErrorState({required this.failures});
}


final class MovieDetailsSuccessState extends MovieDetailsState {
  GetMovieDetailsResponseEntity? getMovieDetailsResponseEntity ;
  List<SimilarMoviesEntity>? similarList ;
  MovieDetailsSuccessState({
    // required this.getMovieDetailsResponseEntity ,
    List<SimilarMoviesEntity>? similarList ,
    GetMovieDetailsResponseEntity? getMovieDetailsResponseEntity,

    }) : getMovieDetailsResponseEntity = getMovieDetailsResponseEntity ,
  similarList = similarList  ;

}

final class MovieSimilarSuccessState extends MovieDetailsState {
  List<SimilarMoviesEntity>? similarList ;
  MovieSimilarSuccessState({
required this.similarList
    }) ;

}
