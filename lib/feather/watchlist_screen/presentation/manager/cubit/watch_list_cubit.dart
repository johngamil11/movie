import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/feather/watchlist_screen/presentation/manager/cubit/watch_list_state.dart';

import '../../../data/data_sources/MovieLocalDataSource.dart';
import '../../../data/models/movie_model.dart';

@injectable
class WatchlistCubit extends Cubit<WatchlistState> {
  late Box movieBox;
  final MovieLocalDataSource movieLocalDataSource;

  WatchlistCubit(this.movieLocalDataSource) : super(WatchlistInitialState());

  static WatchlistCubit get(context) => BlocProvider.of(context);

  // تحميل الأفلام من Hive
  Future<void> loadMovies() async {
    emit(WatchlistLoadingState());
    try {
      final List<MovieModel> movies = await movieLocalDataSource.getMovies();
      emit(WatchlistLoadedState(movies));
    } catch (e) {
      emit(WatchlistErrorState('Failed to load watchlist: $e'));
    }
  }

  // إضافة فيلم إلى Hive
  Future<void> addMovie(MovieModel movie) async {
    try {
      final currentMovies = await movieLocalDataSource.getMovies();
      final isAlreadyAdded = currentMovies.any((m) => m.title == movie.title);

      if (isAlreadyAdded) {
        emit(WatchlistErrorState('The movie is already in your watchlist.'));
        return;
      }
      await movieLocalDataSource.saveMovie(movie);
      await loadMovies(); // إعادة تحميل القائمة بعد الإضافة
    } catch (e) {
      emit(WatchlistErrorState('Failed to add movie: $e'));
    }
  }

  // حذف فيلم من Hive
  Future<void> removeMovie(int index) async {
    try {
      await movieLocalDataSource.deleteMovie(index);
      await loadMovies(); // إعادة تحميل القائمة بعد الحذف
    } catch (e) {
      emit(WatchlistErrorState('Failed to remove movie: $e'));
    }
  }
  Future<void> clearAllMovies() async {
    try {
      await movieLocalDataSource.clearAllMovie();
      await loadMovies(); // إعادة تحميل القائمة بعد الحذف
    } catch (e) {
      emit(WatchlistErrorState('Failed to clear movie: $e'));
    }
  }
}