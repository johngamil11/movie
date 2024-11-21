import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/repositories/home_repository.dart';

import '../entities/GetRecommendedResponseEntity.dart';
@injectable
class GetRecommendedMoviesUseCase {
  HomeRepository homeRepository ;
  GetRecommendedMoviesUseCase({required this.homeRepository});

  Future<Either<Failures ,GetRecommendedResponseEntity>> invoke(){
return homeRepository.getRecommendedMovies();
  }

}



