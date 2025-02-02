import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetMovieDetailsResponseEntity.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetSimilarMoviesResponseEntity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failures , GetMovieDetailsResponseEntity>> getMoviesDetails(String productId);
  Future<Either<Failures , GetSimilarMoviesResponseEntity>> getSimilarMovies(String productId);
}