import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/search_screen/domain/use_cases/search_use_case.dart';

import '../../../domain/entities/SearchresponseEntity.dart';

part 'search_state.dart';
@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase searchUseCase ;
  SearchViewModel({required this.searchUseCase}) : super(SearchInitialState());
  List<SearchResultsDetailsEntity> searchList =[];

  static SearchViewModel get(context) => BlocProvider.of(context);

  void search(String search)async{
    emit(SearchLoadingState());
    var either = await searchUseCase.invoke(search);
    either.fold((error){
      print(error.errorMessage);
      emit(SearchErrorState(failures: error));
    }, (response){
       searchList = response.results! ;
       if(searchList.isNotEmpty ) {
      emit(SearchSuccessState(searchList: response.results! ));}
    });
  }
}
