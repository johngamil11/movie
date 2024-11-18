import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/repositories/home_repository.dart';
@injectable
class GetPopularMoviesUseCase {
  HomeRepository homeRepository ;
  GetPopularMoviesUseCase({required this.homeRepository});

  Future<Either<Failures ,GetPopularMoviesResponseEntity>> invoke(){
return homeRepository.getPopularMovies();
  }

}



