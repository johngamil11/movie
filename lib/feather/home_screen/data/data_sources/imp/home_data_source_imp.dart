import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/api/api_manager.dart';
import 'package:movie/core/api/end_ponits.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/home_screen/data/data_sources/home_data_source.dart';
import 'package:movie/feather/home_screen/data/models/GetPopularMoviesResponseDto.dart';
import 'package:movie/feather/home_screen/data/models/GetRecommendedResponseDto.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';

import '../../models/GetReleasesResponseDto.dart';

@Injectable(as:HomeDataSource )
class HomeDataSourceImp implements HomeDataSource {
  ApiManager apiManager ;
  HomeDataSourceImp ({required this.apiManager});

  @override
  Future<Either<Failures, GetPopularMoviesResponseDto>> getPopularMovies() async {
    apiManager.getData(EndPoint.popular);
    // try {
    //
    //   List<ConnectivityResult> connectivityResult =
    //       await Connectivity().checkConnectivity();
    //   if (connectivityResult.contains(ConnectivityResult.mobile) ||
    //       connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          EndPoint.popular,
        );
        print(response.data);

        var getPopularMovies =
        GetPopularMoviesResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 401) {
          return Right(getPopularMovies);
        } else {
          return Left(serverError(errorMessage: getPopularMovies.status_message!));
        }
      }

  @override
  Future<Either<Failures, GetReleasesResponseDto>> getReleasesMovies() async {
    apiManager.getData(EndPoint.releases);
    // try {
    //
    //   List<ConnectivityResult> connectivityResult =
    //       await Connectivity().checkConnectivity();
    //   if (connectivityResult.contains(ConnectivityResult.mobile) ||
    //       connectivityResult.contains(ConnectivityResult.wifi)) {
    var response = await apiManager.getData(
      EndPoint.releases,
    );

    var getReleasesMovies = GetReleasesResponseDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 401) {
      return Right(getReleasesMovies);
    } else {
      return Left(serverError(errorMessage: getReleasesMovies.status_message!));
    }
  }

  @override
  Future<Either<Failures, GetRecommendedResponseDto>> getRecommendedMovies() async{
    apiManager.getData(EndPoint.recommend);
    // try {
    //
    //   List<ConnectivityResult> connectivityResult =
    //       await Connectivity().checkConnectivity();
    //   if (connectivityResult.contains(ConnectivityResult.mobile) ||
    //       connectivityResult.contains(ConnectivityResult.wifi)) {
    var response = await apiManager.getData(
      EndPoint.recommend,
    );

    var getRecommendedMovies = GetRecommendedResponseDto.fromJson(response.data);
    if (response.statusCode! >= 200 && response.statusCode! < 401) {
      return Right(getRecommendedMovies);
    } else {
      return Left(serverError(errorMessage: getRecommendedMovies.status_message!));
    }
  }
}
// else {
      //   return Left(NetworkError(
      //       errorMessage: 'no internet connection , please try again'));
      // }
    // } catch (e) {
    //   return Left(Failures(errorMessage: e.toString()));

// }

// }