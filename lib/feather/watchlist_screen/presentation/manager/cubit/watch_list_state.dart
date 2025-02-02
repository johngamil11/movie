import '../../../data/models/movie_model.dart';

abstract class WatchlistState  {
  @override
  List<Object?> get props => [];
}

class WatchlistInitialState extends WatchlistState {}

class WatchlistLoadingState extends WatchlistState {}

class WatchlistLoadedState extends WatchlistState {
  final List<MovieModel> movies;

  WatchlistLoadedState(this.movies);

  @override
  List<Object?> get props => [movies];
}

class WatchlistErrorState extends WatchlistState {
  final String message;

  WatchlistErrorState(this.message);

  @override
  List<Object?> get props => [message];
}