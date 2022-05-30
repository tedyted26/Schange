import 'package:Schange/Settings.dart';
import 'package:Schange/screens/messages_screen.dart';
import 'package:Schange/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:Schange/NewEventPage.dart';
import 'EventDetailsPage.dart';
import 'LoginPage.dart';
import 'DashboardPage.dart';
import 'Event.dart';
import 'YourEventsPage.dart';
import 'YourSubscriptionsPage.dart';
import 'EditEventPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings data) {
    final args = data.arguments;
    switch (data.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      case '/settings':
        return MaterialPageRoute(builder: (_) => const Settings());

      case '/event-details':
        return MaterialPageRoute(
            builder: (_) => EventDetailsPage(
                  event: args as Event,
                ));

      case '/new-event':
        return MaterialPageRoute(builder: (_) => const NewEvent());

      case '/your-events':
        return MaterialPageRoute(builder: (_) => const YourEvents());

      case '/your-subscriptions':
        return MaterialPageRoute(builder: (_) => const YourSubscriptions());

      case '/edit-event':
        return MaterialPageRoute(
            builder: (_) => EditEvent(event: args as Event));

      case '/messages':
        return MaterialPageRoute(builder: (_) => const MessagesScreen());

      case '/tips':
        return MaterialPageRoute(builder: (_) => TipsScreen());

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
