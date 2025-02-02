import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/browse_screen/data/data_sources/get_genres_browse_data_sourece.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseFilterResposeEntity.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';
import 'package:movie/feather/browse_screen/domain/repositories/browse_repository.dart';

@Injectable(as: GetGenresRepository)
class GetGenresRepositoryImp implements GetGenresRepository{
  GetGenresBrowseDataSource genresBrowseDataSource ;
  GetGenresRepositoryImp ({required this.genresBrowseDataSource});
  @override
  Future<Either<Failures, GetBrowseResponseEntity>> getGenresBrowse() async{
    var either = await genresBrowseDataSource.getGenresBrowse();
    return either.fold((error)=> Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetBrowseFilterResposeEntity>> getFilterBrowse(String movieId)async {
    var either = await genresBrowseDataSource.getFilterBrowse(movieId);
    return either.fold((error)=> Left(error), (response) => Right(response));
  }

}