part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class HomeScreenLoadingState extends HomeScreenState {}
final class HomeScreenSuccessState extends HomeScreenState {
  // MovieDetailsEntity movieDetails ;
// GetPopularMoviesResponseEntity getPopularMoviesResponseEntity ;
List<MovieDetailsEntity> movieDetails ;
HomeScreenSuccessState ({required this.movieDetails});
}

final class HomeScreenErrorState extends HomeScreenState {
  Failures failures ;
  HomeScreenErrorState ({required this.failures});
}