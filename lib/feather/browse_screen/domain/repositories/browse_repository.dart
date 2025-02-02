import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseFilterResposeEntity.dart';
import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';

abstract class GetGenresRepository {
  Future<Either<Failures , GetBrowseResponseEntity>> getGenresBrowse();
  Future<Either<Failures , GetBrowseFilterResposeEntity>> getFilterBrowse(String movieId);
}