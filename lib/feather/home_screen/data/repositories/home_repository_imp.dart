import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/data/data_sources/home_data_source.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/repositories/home_repository.dart';

@Injectable(as:HomeRepository )
class HomeRepositoryimp implements HomeRepository {
  HomeDataSource homeDataSource ;
  HomeRepositoryimp({required this.homeDataSource});

  @override
  Future<Either<Failures, GetPopularMoviesResponseEntity>> getPopularMovies()async {
    var either = await homeDataSource.getPopularMovies();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetReleasesResponseEntity>>
      getReleasesMovies() async {
    var either = await homeDataSource.getReleasesMovies();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetRecommendedResponseEntity>> getRecommendedMovies() async{
      var either = await homeDataSource.getRecommendedMovies();
      return either.fold((error) => Left(error), (response) => Right(response));
  }
}