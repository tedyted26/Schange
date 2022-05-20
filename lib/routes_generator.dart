import 'package:flutter/material.dart';
import 'package:Schange/NewEvent.dart';
import 'EventDetailsPage.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
<<<<<<< HEAD
import 'DashboardPage.dart';
=======
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
>>>>>>> 4b532fe1d4efaabfb207babbadc08469c31fc9b0

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings data) {
    final args = data.arguments;
    switch (data.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/event-details':
<<<<<<< HEAD
        return MaterialPageRoute(builder: (_) => EventDetailsPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardPage());
=======
        return MaterialPageRoute(
            builder: (_) => EventDetailsPage(event: getEvent(0)));
      case '/new-event':
        return MaterialPageRoute(builder: (_) => NewEvent());
>>>>>>> 4b532fe1d4efaabfb207babbadc08469c31fc9b0
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
