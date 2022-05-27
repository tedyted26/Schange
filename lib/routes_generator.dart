import 'package:flutter/material.dart';
import 'package:Schange/NewEventPage.dart';
import 'EventDetailsPage.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'Event.dart';
import 'YourEventsPage.dart';
import 'YourSubscriptionsPage.dart';
import 'EditEventPage.dart';

//temporal
Event getEvent(int id) {
  return Event(
      id: 0,
      title: "Dinner with Teo",
      picUrl: "",
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
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/event-details':
        //comprobar si el argumento pasado es de tipo evento
        if (args is Event) {
          return MaterialPageRoute(
              builder: (_) => EventDetailsPage(
                  event: getEvent(
                      0))); //TODO cambiar el evento seleccionado en home
          // En home seria: onPressed(): (){
          // Navigator.of(context).pushNamed('/event-details', data: objetoEvento)}
        }
        //si no lo es aparece una pagina de error
        else {
          return _errorRoute();
        }
      case '/new-event':
        return MaterialPageRoute(builder: (_) => NewEvent());
      case '/your-events':
        return MaterialPageRoute(
            builder: (_) =>
                YourEvents(events: [getEvent(0), getEvent(0), getEvent(0)]));
      case '/your-subscriptions':
        return MaterialPageRoute(
            builder: (_) => YourSubscriptions(
                events: [getEvent(0), getEvent(0), getEvent(0)]));
      case '/edit-event':
        return MaterialPageRoute(builder: (_) => EditEvent(event: getEvent(0)));
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
