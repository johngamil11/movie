import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/api/api_manager.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/browse_screen/data/data_sources/get_genres_browse_data_sourece.dart';
import 'package:movie/feather/browse_screen/data/models/GetBrowseResponseDto.dart';
import 'package:movie/feather/browse_screen/data/models/getBrowseFilterResponseDto.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseFilterResposeEntity.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';

import '../../../../../core/api/end_ponits.dart';

@Injectable(as: GetGenresBrowseDataSource)
class GetGenresBrowseDataSourceImp implements GetGenresBrowseDataSource {
  ApiManager apiManager ;
  GetGenresBrowseDataSourceImp ({required this.apiManager});
  @override
  Future<Either<Failures, GetBrowseResponseDto>> getGenresBrowse() async{
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            '${EndPoint.genre}'
        );
        print('genre ${response.data}');

        var getGenresBrowse =
        GetBrowseResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getGenresBrowse);
        } else {
          return Left(
              serverError(errorMessage: getGenresBrowse.status_message!));
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
  Future<Either<Failures, GetBrowseFilterResponseDto>> getFilterBrowse(String movieId) async{
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            '${EndPoint.browseFilter}?with_genres=$movieId'
        );
        print('filteeeeeeeer ${response.data}');
        print('----------------------------------------');

        var getFilterBrowse =
        GetBrowseFilterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getFilterBrowse);
        } else {
          return Left(
              serverError(errorMessage: getFilterBrowse.status_message!));
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