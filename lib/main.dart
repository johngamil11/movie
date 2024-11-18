import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/config/routes/routes.dart';
import 'package:movie/feather/home_screen/presentation/manager/cubit/home_screen_cubit.dart';

import 'config/routes/route_generator.dart';
import 'core/di/di.dart';
import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeScreenViewModel>(
      create: (context) => getIt<HomeScreenViewModel>(),
    ),
  ], child: MyApp()));
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
