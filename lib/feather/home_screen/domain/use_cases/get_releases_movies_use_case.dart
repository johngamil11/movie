import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/repositories/home_repository.dart';

@injectable
class GetReleasesMoviesUseCase {
  HomeRepository homeRepository;

  GetReleasesMoviesUseCase({required this.homeRepository});

  Future<Either<Failures, GetReleasesResponseEntity>> invoke() {
    return homeRepository.getReleasesMovies();
  }
}
