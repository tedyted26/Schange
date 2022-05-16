import 'package:flutter/material.dart';
import 'main.dart';
import 'LoginPage.dart';
import 'HomePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings data) {
    final args = data.arguments;
    switch (data.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
        appBar: AppBar(title: const Text("ERROR")),
        body: Center(child: Text("ERROR")));
  });
}
