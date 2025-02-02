import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/search_screen/domain/entities/SearchresponseEntity.dart';

abstract class SearchRepository {
  Future<Either<Failures , SearchResponseEntity>> search (String search);
}