import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetPopularMoviesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetRecommendedResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/entities/GetReleasesResponseEntity.dart';
import 'package:movie/feather/home_screen/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie/feather/home_screen/domain/use_cases/get_recommended_movies_use_case.dart';
import 'package:movie/feather/home_screen/domain/use_cases/get_releases_movies_use_case.dart';

import '../../../../../core/errors/failurs.dart';
import '../../../domain/entities/GetPopularMoviesResponseEntity.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  GetPopularMoviesUseCase getPopularMoviesUseCase ;

  GetReleasesMoviesUseCase getReleasesMoviesUseCase;

GetRecommendedMoviesUseCase getRecommendedMoviesUseCase ;

  HomeScreenViewModel(
      {required this.getPopularMoviesUseCase,
      required this.getReleasesMoviesUseCase ,
      required this.getRecommendedMoviesUseCase})
      : super(HomeScreenInitial());
  List<MovieDetailsEntity> movieList =[];
  List<ReleasesMoviesEntity> releaseMovieList = [];
  List<RecommendedMovieEntity> recommendedMovieList = [];
  static HomeScreenViewModel get(context) => BlocProvider.of(context);

  void getPopularMovies()async{
emit(HomeScreenLoadingState());
var either = await getPopularMoviesUseCase.invoke();
either.fold((error){
  print(error.errorMessage);
  emit(HomeScreenErrorState(failures: error));
}, (response){
  movieList = response.results!;
  if(movieList.isNotEmpty ) {
    emit(HomeScreenSuccessState(movieDetails: response.results!));
  }});
  }

  void getReleasesMovies() async {
    emit(ReleasesLoadingState());
    var either = await getReleasesMoviesUseCase.invoke();
    either.fold((error) {
      print(error.errorMessage);
      emit(ReleasesErrorState(failures: error));
    }, (response) {
      releaseMovieList = response.results!;
      if (movieList.isNotEmpty) {
        emit(HomeScreenSuccessState(releaseMovieList: response.results!));
      }
    });
  }

  void getRecommendedMovies() async {
    emit(RecommendedLoadingState());
    var either = await getRecommendedMoviesUseCase.invoke();
    either.fold((error) {
      print(error.errorMessage);
      emit(RecommendedErrorState(failures: error));
    }, (response) {
      recommendedMovieList = response.results!;
      if (movieList.isNotEmpty) {
        emit(HomeScreenSuccessState(recommendedMovieList: response.results!));
      }
    });
  }
}
