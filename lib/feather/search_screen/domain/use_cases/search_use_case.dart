import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/search_screen/domain/entities/SearchresponseEntity.dart';
import 'package:movie/feather/search_screen/domain/repositories/search_repository.dart';

@injectable
class SearchUseCase{
  SearchRepository searchRepository ;
  SearchUseCase({required this.searchRepository});
  Future<Either<Failures , SearchResponseEntity>> invoke (String search){
    return searchRepository.search(search);
  }
}