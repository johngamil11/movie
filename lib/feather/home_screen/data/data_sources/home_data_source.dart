import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';

abstract class HomeDataSource{
  Future<Either<Failures,GetPopularMoviesResponseEntity>> getPopularMovies();
}