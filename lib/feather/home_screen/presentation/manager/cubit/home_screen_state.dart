part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoadingState extends HomeScreenState {}

final class HomeScreenSuccessState extends HomeScreenState {
  // MovieDetailsEntity movieDetails ;
// GetPopularMoviesResponseEntity getPopularMoviesResponseEntity ;
  List<ReleasesMoviesEntity> releaseMovieList;
List<MovieDetailsEntity> movieDetails ;
List<RecommendedMovieEntity> recommendedMovieList;
HomeScreenSuccessState ({ List<ReleasesMoviesEntity>? releaseMovieList
  ,List<MovieDetailsEntity>? movieDetails ,
  List<RecommendedMovieEntity>? recommendedMovieList
}) : releaseMovieList = releaseMovieList ?? [],
  movieDetails = movieDetails ??[],
  recommendedMovieList = recommendedMovieList ??[];
}

final class HomeScreenErrorState extends HomeScreenState {
  Failures failures ;
  HomeScreenErrorState ({required this.failures});
}


final class ReleasesLoadingState extends HomeScreenState {}
final class ReleasesErrorState extends HomeScreenState {
  Failures failures;

  ReleasesErrorState({required this.failures});
}

final class RecommendedLoadingState extends HomeScreenState {}
final class RecommendedErrorState extends HomeScreenState {
  Failures failures;

  RecommendedErrorState({required this.failures});
}
