import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/search_screen/data/data_sources/search_data_source.dart';
import 'package:movie/feather/search_screen/domain/entities/SearchresponseEntity.dart';
import 'package:movie/feather/search_screen/domain/repositories/search_repository.dart';

@Injectable(as:SearchRepository )
class SearchRepositoryImp implements SearchRepository {
  SearchDatasource searchDatasource ;
  SearchRepositoryImp({required this.searchDatasource});
  @override
  Future<Either<Failures, SearchResponseEntity>> search(String search)async {
   var either = await  searchDatasource.search(search);
  return either.fold((error) => Left(error), (response)=>Right(response));
  }
  
}