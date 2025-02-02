import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/Movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetMovieDetailsResponseEntity.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetSimilarMoviesResponseEntity.dart';
import 'package:movie/feather/Movie_details/domain/repositories/movie_details_repository.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImp implements MovieDetailsRepository {
  MovieDetailsDataSource movieDetailsDataSource ;
  MovieDetailsRepositoryImp ({required this.movieDetailsDataSource});
  @override
  Future<Either<Failures, GetMovieDetailsResponseEntity>> getMoviesDetails(String productId) async {
 var either = await movieDetailsDataSource.getMoviesDetails(productId);
 return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetSimilarMoviesResponseEntity>> getSimilarMovies(String productId)async {
    var either = await movieDetailsDataSource.getSimilarMovies(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

}