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
      title: "Evento de variable",
      picUrl: "",
      creatorId: 0,
      creationDate: "Jun 10",
      maxPeople: 5,
      eventDate: "Jun 30",
      price: 20,
      category: "Dinner",
      description: "No vengo de json",
      likes: 4,
      latitude: 0,
      longitude: 0,
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
        return MaterialPageRoute(
            builder: (_) => EventDetailsPage(
                  event: getEvent(0),
                  userId: 0,
                ));

      //TODO cambiar el evento seleccionado en home
      // En home seria: onPressed(): (){
      // Navigator.of(context).pushNamed('/event-details', arguments: [objetoEvento, idUsuarioLoggeado])}

      case '/new-event':
        return MaterialPageRoute(builder: (_) => const NewEvent());

      //FIXME: your events y subscribed events tiene que recibir el id por parametro recibido de home

      case '/your-events':
        return MaterialPageRoute(builder: (_) => YourEvents(userId: 0));

      case '/your-subscriptions':
        return MaterialPageRoute(builder: (_) => YourSubscriptions(userId: 0));

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
