
import '../models/movie_model.dart';

abstract class MovieLocalDataSource{
Future<void> saveMovie (MovieModel movie);
Future<List<MovieModel>> getMovies();
Future<void> deleteMovie (int index);
Future<void> clearAllMovie ();

  }
