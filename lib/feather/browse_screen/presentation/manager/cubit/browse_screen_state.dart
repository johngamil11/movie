part of 'browse_screen_view_model.dart';

@immutable
sealed class BrowseScreenState {}

final class BrowseScreenInitialState extends BrowseScreenState {}
final class BrowseScreenLoadingState extends BrowseScreenState {}
final class BrowseScreenErrorState extends BrowseScreenState {
  Failures failures ;
  BrowseScreenErrorState ({required this.failures});
}
final class BrowseScreenSuccessState extends BrowseScreenState {
  List<GenresBrowseEntity> genresList ;
  BrowseScreenSuccessState ({required this.genresList});
}

final class BrowseFilterLoadingState extends BrowseScreenState {}
final class BrowseFilterErrorState extends BrowseScreenState {
  Failures failures ;
  BrowseFilterErrorState ({required this.failures});
}
final class BrowseFilterSuccessState extends BrowseScreenState {
  List<BrowseFilterEntity> filterList ;
  BrowseFilterSuccessState ({required this.filterList});
}
