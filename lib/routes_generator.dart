import 'package:flutter/material.dart';
import 'EventDetailsPage.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'DashboardPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings data) {
    final args = data.arguments;
    switch (data.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/event-details':
        return MaterialPageRoute(builder: (_) => EventDetailsPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardPage());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
        appBar: AppBar(title: const Text("ERROR")),
        body: const Center(child: Text("Error: Route not defined")));
  });
}
