part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchSuccessState extends SearchState {
  List<SearchResultsDetailsEntity> searchList;
  SearchSuccessState({required this.searchList});
}
final class SearchErrorState extends SearchState {
  Failures failures ;
  SearchErrorState ({required this.failures});
}
