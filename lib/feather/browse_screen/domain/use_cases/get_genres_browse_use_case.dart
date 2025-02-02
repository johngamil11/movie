import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';
import 'package:movie/feather/browse_screen/domain/repositories/browse_repository.dart';

@injectable
class GetGenresBrowseUseCase {
  GetGenresRepository browseRepository ;
  GetGenresBrowseUseCase({required this.browseRepository});

  Future<Either<Failures , GetBrowseResponseEntity>> invoke(){
    return browseRepository.getGenresBrowse() ;
  }
}