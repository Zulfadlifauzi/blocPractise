import 'package:appbloc/presentation/screens/home_screen.dart';
import 'package:appbloc/presentation/screens/second_screen.dart';
import 'package:appbloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (newContext) =>
                HomeScreen(title: 'title', colors: Colors.blueAccent));
      case '/second':
        return MaterialPageRoute(
            builder: (newContext) =>
                SecondScreen(title: 'title', colors: Colors.blueAccent));
      case '/third':
        return MaterialPageRoute(
            builder: (newContext) =>
                ThirdScreen(title: 'title', colors: Colors.blueAccent));
      default:
        return null;
    }
  }
}
