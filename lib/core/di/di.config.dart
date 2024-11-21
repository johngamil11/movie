// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i726.HomeDataSource>(
        () => _i812.HomeDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i6.HomeRepository>(() =>
        _i1004.HomeRepositoryimp(homeDataSource: gh<_i726.HomeDataSource>()));
    gh.factory<_i145.GetPopularMoviesUseCase>(() =>
        _i145.GetPopularMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i955.GetReleasesMoviesUseCase>(() =>
        _i955.GetReleasesMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i342.GetRecommendedMoviesUseCase>(() =>
        _i342.GetRecommendedMoviesUseCase(
            homeRepository: gh<_i6.HomeRepository>()));
    gh.factory<_i602.HomeScreenViewModel>(() => _i602.HomeScreenViewModel(
          getPopularMoviesUseCase: gh<_i145.GetPopularMoviesUseCase>(),
          getReleasesMoviesUseCase: gh<_i955.GetReleasesMoviesUseCase>(),
          getRecommendedMoviesUseCase: gh<_i342.GetRecommendedMoviesUseCase>(),
        ));
    return this;
  }
}
