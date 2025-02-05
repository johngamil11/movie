import 'package:flutter/material.dart';
import 'package:movie/config/routes/routes.dart';
import 'package:movie/feather/Movie_details/presentation/manager/movie_details_screen.dart';
import 'package:movie/feather/main_layout/main_layout.dart';

class RouteGenerator {
  String? id ;
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => MainLayout());

        // case Routes.detailsMovieScreen:
        // return MaterialPageRoute(builder: (_) => MovieDetailsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
