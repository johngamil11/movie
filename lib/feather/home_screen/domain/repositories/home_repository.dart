import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures , GetPopularMoviesResponseEntity>> getPopularMovies();

  Future<Either<Failures, GetReleasesResponseEntity>> getReleasesMovies();

  Future<Either<Failures, GetRecommendedResponseEntity>> getRecommendedMovies();
}