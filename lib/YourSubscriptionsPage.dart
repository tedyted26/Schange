import 'package:Schange/Event.dart';
import 'package:Schange/EventCustomCard.dart';
import 'package:flutter/material.dart';

class YourSubscriptions extends StatefulWidget {
  final List<Event> events;
  const YourSubscriptions({Key? key, required this.events}) : super(key: key);

  @override
  State<YourSubscriptions> createState() => _YourSubscriptionsState();
}

class _YourSubscriptionsState extends State<YourSubscriptions> {
  @override
  Widget build(BuildContext context) {
    List<EventCustomCard> listofevents = iterateEvents(widget.events);
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),
      appBar: AppBar(
        title: const Text("Your subscriptions"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {}, //TODO boton de volver
        ),
      ),
      body: ListView(children: [
        for (int i = 0; i < listofevents.length; i++) listofevents[i]
      ]),
    );
  }
}

List<EventCustomCard> iterateEvents(List<Event> events) {
  List<EventCustomCard> listOfEvents = [];
  for (int i = 0; i < events.length; i++) {
    if (i == 0) {
      listOfEvents.add(EventCustomCard(
        event: events[i],
        isSubscribed: true,
        marginbottom: 5,
      ));
    } else if (i == events.length - 1) {
      listOfEvents.add(EventCustomCard(
        event: events[i],
        isSubscribed: true,
        margintop: 5,
      ));
    } else {
      listOfEvents.add(EventCustomCard(
        event: events[i],
        isSubscribed: true,
      ));
    }
  }
  return listOfEvents;
}
