import 'package:flutter/material.dart';
import 'package:uts/profil.dart';
import 'package:uts/screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MyApp());
      case '/profil':
        return MaterialPageRoute(builder: (context) => const Profil());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(
            child: Text("Error Page"),
          ),
        );
      },
    );
  }
}
