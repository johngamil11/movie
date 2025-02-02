// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../feather/browse_screen/data/data_sources/get_genres_browse_data_sourece.dart'
    as _i151;
import '../../feather/browse_screen/data/data_sources/imp/get_genres_browse_data_sourece_imp.dart'
    as _i346;
import '../../feather/browse_screen/data/repositories/getGenresImp.dart'
    as _i731;
import '../../feather/browse_screen/domain/repositories/browse_repository.dart'
    as _i722;
import '../../feather/browse_screen/domain/use_cases/get_filter_browse_use_case.dart'
    as _i129;
import '../../feather/browse_screen/domain/use_cases/get_genres_browse_use_case.dart'
    as _i158;
import '../../feather/browse_screen/presentation/manager/cubit/browse_screen_view_model.dart'
    as _i36;
import '../../feather/home_screen/data/data_sources/home_data_source.dart'
    as _i726;
import '../../feather/home_screen/data/data_sources/imp/home_data_source_imp.dart'
    as _i812;
import '../../feather/home_screen/data/repositories/home_repository_imp.dart'
    as _i1004;
import '../../feather/home_screen/domain/repositories/home_repository.dart'
    as _i6;
import '../../feather/home_screen/domain/use_cases/get_popular_movies_use_case.dart'
    as _i145;
import '../../feather/home_screen/domain/use_cases/get_recommended_movies_use_case.dart'
    as _i342;
import '../../feather/home_screen/domain/use_cases/get_releases_movies_use_case.dart'
    as _i955;
import '../../feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart'
    as _i602;
import '../../feather/Movie_details/data/data_sources/imp/movie_details_data_source_imp.dart'
    as _i735;
import '../../feather/Movie_details/data/data_sources/movie_details_data_source.dart'
    as _i25;
import '../../feather/Movie_details/data/repositories/movie_details_imp.dart'
    as _i446;
import '../../feather/Movie_details/domain/repositories/movie_details_repository.dart'
    as _i574;
import '../../feather/Movie_details/domain/use_cases/get_movies_details_use_case.dart'
    as _i690;
import '../../feather/Movie_details/domain/use_cases/get_similar_movies_use_case.dart'
    as _i697;
import '../../feather/Movie_details/presentation/manager/cubit/movie_details_cubit.dart'
    as _i329;
import '../../feather/search_screen/data/data_sources/imp/search_data_source_imp.dart'
    as _i720;
import '../../feather/search_screen/data/data_sources/search_data_source.dart'
    as _i399;
import '../../feather/search_screen/data/repositories/searchRepositoryimp.dart'
    as _i447;
import '../../feather/search_screen/domain/repositories/search_repository.dart'
    as _i789;
import '../../feather/search_screen/domain/use_cases/search_use_case.dart'
    as _i447;
import '../../feather/search_screen/presentation/manager/cubit/search_cubit.dart'
    as _i677;
import '../../feather/watchlist_screen/data/data_sources/MovieLocalDataSource.dart'
    as _i925;
import '../../feather/watchlist_screen/data/data_sources/MovieLocalDataSourceImp.dart'
    as _i6;
import '../../feather/watchlist_screen/data/models/hive_module.dart' as _i201;
import '../../feather/watchlist_screen/data/models/movie_model.dart' as _i346;
import '../../feather/watchlist_screen/presentation/manager/cubit/watch_list_cubit.dart'
    as _i700;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i979.Box<_i346.MovieModel>>(
      () => hiveModule.moviesBox,
      preResolve: true,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i346.MovieModel>(() => _i346.MovieModel(
          imageUrl: gh<String>(),
          title: gh<String>(),
          description: gh<String>(),
          year: gh<String>(),
          isFavorite: gh<bool>(),
        ));
    gh.factory<_i925.MovieLocalDataSource>(
        () => _i6.MovieLocalDataSourceImp(gh<_i979.Box<_i346.MovieModel>>()));
    gh.factory<_i399.SearchDatasource>(
        () => _i720.SearchDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i726.HomeDataSource>(
        () => _i812.HomeDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i789.SearchRepository>(() => _i447.SearchRepositoryImp(
        searchDatasource: gh<_i399.SearchDatasource>()));
    gh.factory<_i25.MovieDetailsDataSource>(() =>
        _i735.MovieDetailsDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i151.GetGenresBrowseDataSource>(() =>
        _i346.GetGenresBrowseDataSourceImp(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i447.SearchUseCase>(() =>
        _i447.SearchUseCase(searchRepository: gh<_i789.SearchRepository>()));
    gh.factory<_i6.HomeRepository>(() =>
        _i1004.HomeRepositoryimp(homeDataSource: gh<_i726.HomeDataSource>()));
    gh.factory<_i722.GetGenresRepository>(() => _i731.GetGenresRepositoryImp(
        genresBrowseDataSource: gh<_i151.GetGenresBrowseDataSource>()));
    gh.factory<_i700.WatchlistCubit>(
        () => _i700.WatchlistCubit(gh<_i925.MovieLocalDataSource>()));
    gh.factory<_i677.SearchViewModel>(
        () => _i677.SearchViewModel(searchUseCase: gh<_i447.SearchUseCase>()));
    gh.factory<_i574.MovieDetailsRepository>(() =>
        _i446.MovieDetailsRepositoryImp(
            movieDetailsDataSource: gh<_i25.MovieDetailsDataSource>()));
    gh.factory<_i145.GetPopularMoviesUseCase>(() =>
        _i145.GetPopularMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i342.GetRecommendedMoviesUseCase>(() =>
        _i342.GetRecommendedMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i955.GetReleasesMoviesUseCase>(() =>
        _i955.GetReleasesMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i690.GetMoviesDetailsUseCase>(() =>
        _i690.GetMoviesDetailsUseCase(
            movieDetailsRepository: gh<_i574.MovieDetailsRepository>()));
    gh.factory<_i697.GetSimilarMoviesUseCase>(() =>
        _i697.GetSimilarMoviesUseCase(
            movieDetailsRepository: gh<_i574.MovieDetailsRepository>()));
    gh.factory<_i129.GetFilterBrowseUseCase>(() => _i129.GetFilterBrowseUseCase(
        browseRepository: gh<_i722.GetGenresRepository>()));
    gh.factory<_i158.GetGenresBrowseUseCase>(() => _i158.GetGenresBrowseUseCase(
        browseRepository: gh<_i722.GetGenresRepository>()));
    gh.factory<_i602.HomeScreenViewModel>(() => _i602.HomeScreenViewModel(
          getPopularMoviesUseCase: gh<_i145.GetPopularMoviesUseCase>(),
          getReleasesMoviesUseCase: gh<_i955.GetReleasesMoviesUseCase>(),
          getRecommendedMoviesUseCase: gh<_i342.GetRecommendedMoviesUseCase>(),
        ));
    gh.factory<_i329.MovieDetailsViewModel>(() => _i329.MovieDetailsViewModel(
          getMoviesDetailsUseCase: gh<_i690.GetMoviesDetailsUseCase>(),
          getSimilarMoviesUseCase: gh<_i697.GetSimilarMoviesUseCase>(),
        ));
    gh.factory<_i36.BrowseScreenViewModel>(() => _i36.BrowseScreenViewModel(
          genresBrowseUseCase: gh<_i158.GetGenresBrowseUseCase>(),
          filterUseCase: gh<_i129.GetFilterBrowseUseCase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i201.HiveModule {}
