import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/errors/failurs.dart';
import 'package:movie/feather/Movie_details/domain/use_cases/get_movies_details_use_case.dart';

import '../../../domain/entities/GetMovieDetailsResponseEntity.dart';
import '../../../domain/entities/GetSimilarMoviesResponseEntity.dart';
import '../../../domain/use_cases/get_similar_movies_use_case.dart';

part 'movie_details_state.dart';
@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  GetMoviesDetailsUseCase getMoviesDetailsUseCase ;
  GetSimilarMoviesUseCase getSimilarMoviesUseCase ;
  MovieDetailsViewModel({required this.getMoviesDetailsUseCase , required this.getSimilarMoviesUseCase }) : super(MovieDetailsInitial());

 List<SimilarMoviesEntity> similarList = [];
  static MovieDetailsViewModel get(context) => BlocProvider.of(context);

  void getMoviesDetails(String movieId)async{
    emit(MovieDetailsLoadingState());
    var either = await getMoviesDetailsUseCase.invoke(movieId);
    either.fold((error){
      print(error.errorMessage);
      emit(MovieDetailsErrorState(failures: error));
    }, (response){
      // movieDetailsList = response as List<GetMovieDetailsResponseEntity>;
      // if(movieDetailsList.isNotEmpty ) {
        emit(MovieDetailsSuccessState(getMovieDetailsResponseEntity: response ));
      });
  }

  void getSimilarMovies(String movieId) async {
    emit(MovieDetailsLoadingState());
    var either = await getSimilarMoviesUseCase.invoke(movieId);
    either.fold((error) {
      print(error.errorMessage);
      emit(MovieDetailsErrorState(failures: error));
    }, (response) {
      similarList = response.results!;
      if (similarList.isNotEmpty) {
        emit(MovieSimilarSuccessState(similarList: response.results));
      }
    });
  }


}



