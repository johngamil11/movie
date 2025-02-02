import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/feather/watchlist_screen/data/models/movie_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<MovieModel>> get moviesBox async {
    return await Hive.openBox<MovieModel>('moviesBox');
  }
}