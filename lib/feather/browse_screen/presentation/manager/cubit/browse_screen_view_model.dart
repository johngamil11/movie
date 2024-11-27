import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/core/utils/assets_image.dart';
import 'package:movie/feather/browse_screen/domain/use_cases/get_filter_browse_use_case.dart';
import 'package:movie/feather/browse_screen/domain/use_cases/get_genres_browse_use_case.dart';

import '../../../domain/entities/GetBrowseFilterResposeEntity.dart';
import '../../../domain/entities/GetBrowseResponseEntity.dart';

part 'browse_screen_state.dart';

@injectable
class BrowseScreenViewModel extends Cubit<BrowseScreenState> {
  GetGenresBrowseUseCase genresBrowseUseCase ;
  GetFilterBrowseUseCase filterUseCase ;
  BrowseScreenViewModel({required this.genresBrowseUseCase , required this.filterUseCase})
      : super(BrowseScreenInitialState());

  List<GenresBrowseEntity> genresList = [];
  List<BrowseFilterEntity> filterList = [];

  List<String> imageList =[
AssetsImage.action,
AssetsImage.adventure,
AssetsImage.animation,
AssetsImage.comedy,
AssetsImage.crime,
AssetsImage.docomuntry,
AssetsImage.drama,
AssetsImage.family,
AssetsImage.fantasy,
AssetsImage.history,
AssetsImage.horror,
AssetsImage.music,
AssetsImage.mystery,
AssetsImage.romance,
AssetsImage.scienceFiction,
AssetsImage.thriller,
AssetsImage.tvMovies,
AssetsImage.war,
AssetsImage.western,
  ];
  static BrowseScreenViewModel get(context) => BlocProvider.of(context);

  void getGenresBrowse()async{
    emit(BrowseScreenLoadingState());
    var either = await genresBrowseUseCase.invoke();
    either.fold((error){
      print(error.errorMessage);
      emit(BrowseScreenErrorState(failures: error));
    }, (response){
      genresList = response.genres!;
      if(genresList.isNotEmpty ) {
        emit(BrowseScreenSuccessState(genresList: response.genres!));
      }});
  }

  void getFilterBrowse(String movieId)async{
    emit(BrowseFilterLoadingState());
    var either = await filterUseCase.invoke(movieId);
    either.fold((error){
      print(error.errorMessage);
      emit(BrowseFilterErrorState(failures: error));
    }, (response){
      filterList = response.results!;
      if(filterList.isNotEmpty ) {
        emit(BrowseFilterSuccessState(filterList: response.results!));
      }});
  }

}
