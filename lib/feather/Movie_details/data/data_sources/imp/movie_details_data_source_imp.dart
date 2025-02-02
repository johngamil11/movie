import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/api/api_manager.dart';
import 'package:movie/core/api/end_ponits.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/Movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:movie/feather/Movie_details/data/models/GetMoviesDetailsResponseDto.dart';
import 'package:movie/feather/Movie_details/data/models/GetSimilarMoviesResponseDto.dart';
import 'package:movie/feather/Movie_details/domain/entities/GetSimilarMoviesResponseEntity.dart';

@Injectable(as:MovieDetailsDataSource )
class MovieDetailsDataSourceImp implements MovieDetailsDataSource {
  ApiManager apiManager ;
  MovieDetailsDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failures, GetMoviesDetailsResponseDto>> getMoviesDetails(String productId) async {
    //'${EndPoint.getCart}/$productId'
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          '${EndPoint.movieDetails}/$productId'
        );
        print(response.data);

        var getMoviesDetails =
        GetMoviesDetailsResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getMoviesDetails);
        } else {
          return Left(
              serverError(errorMessage: getMoviesDetails.status_message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetSimilarMoviesResponseDto>> getSimilarMovies(String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            '${EndPoint.movieSimilar1}$productId${EndPoint.movieSimilar2}'
        );
        print(' your similar movie data : ${response.data}');
        print('*********************************');

        var getSimilarMovies =
        GetSimilarMoviesResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getSimilarMovies);
        } else {
          return Left(
              serverError(errorMessage: getSimilarMovies.status_message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

}