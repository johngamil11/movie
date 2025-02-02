import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:movie/config/routes/routes.dart';
import 'package:movie/feather/Movie_details/presentation/manager/cubit/movie_details_cubit.dart';
import 'package:movie/feather/browse_screen/presentation/manager/cubit/browse_screen_view_model.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';
import 'package:movie/feather/search_screen/presentation/manager/cubit/search_cubit.dart';
import 'package:movie/feather/watchlist_screen/data/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

import 'config/routes/route_generator.dart';
import 'core/di/di.dart';
import 'feather/watchlist_screen/presentation/manager/cubit/watch_list_cubit.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>('moviesBox');

  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MultiBlocProvider(providers: [
      BlocProvider<HomeScreenViewModel>(
        create: (context) => getIt<HomeScreenViewModel>(),
      ),
      BlocProvider<MovieDetailsViewModel>(
        create: (context) => getIt<MovieDetailsViewModel>(),
      ),
      BlocProvider<BrowseScreenViewModel>(
        create: (context) => getIt<BrowseScreenViewModel>(),
      ),
      BlocProvider<SearchViewModel>(
        create: (context) => getIt<SearchViewModel>(),
      ),
      BlocProvider<WatchlistCubit>(
        create: (context) => getIt<WatchlistCubit>(),
      ),
    ], child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          locale: Locale('en'),
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme

          home: child,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeScreen,
        );
      },
    );
  }
}
