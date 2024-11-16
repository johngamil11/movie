import 'package:flutter/material.dart';
import 'package:movie/config/routes/routes.dart';
import 'package:movie/feather/home_screen/homeScreen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => Homescreen());

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
