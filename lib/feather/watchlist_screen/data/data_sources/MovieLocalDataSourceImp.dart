import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/feather/watchlist_screen/data/data_sources/MovieLocalDataSource.dart';
import 'package:movie/feather/watchlist_screen/data/models/movie_model.dart';
@Injectable(as:MovieLocalDataSource )
class MovieLocalDataSourceImp implements MovieLocalDataSource{
  final Box<MovieModel> box;
  MovieLocalDataSourceImp(this.box);
  @override
  Future<void> deleteMovie(int index) async {
    await box.delete(index);
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    return box.values.toList() ;
  }

  @override
  Future<void> saveMovie(MovieModel movie) async {
    await box.add(movie);
    return;
  }

  @override
  Future<void> clearAllMovie() async{
    await box.clear();
  }
}