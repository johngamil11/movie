import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetMovieDetailsResponseEntity.dart';
import 'package:movie/feather/Movie_details/domain/repositories/movie_details_repository.dart';

@injectable
class GetMoviesDetailsUseCase {
  MovieDetailsRepository movieDetailsRepository ;
  GetMoviesDetailsUseCase ({required this.movieDetailsRepository});

  Future<Either<Failures ,GetMovieDetailsResponseEntity>> invoke(String productId){
    return movieDetailsRepository.getMoviesDetails(productId);
  }
  }