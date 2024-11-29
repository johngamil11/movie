import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/api/api_manager.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/search_screen/data/data_sources/search_data_source.dart';
import 'package:movie/feather/search_screen/domain/entities/SearchresponseEntity.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../models/SearchResponseDto.dart';

@Injectable(as: SearchDatasource)
class SearchDataSourceImp implements SearchDatasource {
  ApiManager apiManager ;
  SearchDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failures, SearchResponseDto>> search(String search) async{
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        String encodedSearch = Uri.encodeComponent(search);
        var response = await apiManager.getData(
            '${EndPoint.search}', query:encodedSearch ,
          language: 'en-US'
        );

        print(' the link is : $response') ;
        print(response.data);

        var searchResult =
        SearchResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(searchResult);
        } else {
          return Left(
              serverError(errorMessage: searchResult.status_message!));
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