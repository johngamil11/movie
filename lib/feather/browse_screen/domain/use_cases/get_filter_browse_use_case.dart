import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseFilterResposeEntity.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';
import 'package:movie/feather/browse_screen/domain/repositories/browse_repository.dart';

@injectable
class GetFilterBrowseUseCase {
  GetGenresRepository browseRepository ;
  GetFilterBrowseUseCase({required this.browseRepository});

  Future<Either<Failures , GetBrowseFilterResposeEntity>> invoke(String movieId){
    return browseRepository.getFilterBrowse(movieId) ;
  }
}