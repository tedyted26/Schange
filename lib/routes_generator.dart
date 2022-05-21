import 'package:Schange/DashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:Schange/NewEvent.dart';
import 'EventDetailsPage.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'Event.dart';

//temporal
Event getEvent(int id) {
  return Event(
      id: 0,
      title: "Dinner with Teo",
      picUrl: "images/imagen-prueba.jpg",
      creatorName: "Teo",
      creatorId: 0,
      creationDate: "Jun 10",
      maxPeople: 5,
      eventDate: "Jun 30",
      price: 20,
      category: "Dinner",
      description: "Me gusta comer",
      likes: 4,
      ubication: "Mi casa",
      subscribedPeople: [4, 2, 5]);
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings data) {
    final args = data.arguments;
    switch (data.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home2':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case '/event-details':
        return MaterialPageRoute(
            builder: (_) => EventDetailsPage(event: getEvent(0)));
      case '/new-event':
        return MaterialPageRoute(builder: (_) => NewEvent());
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
