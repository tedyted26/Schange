import 'package:flutter/material.dart';
import 'Event.dart';
import 'EventCustomCard.dart';

class YourEvents extends StatefulWidget {
  final List<Event> events;
  const YourEvents({Key? key, required this.events}) : super(key: key);

  @override
  State<YourEvents> createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  @override
  Widget build(BuildContext context) {
    List<EventCustomCard> listofevents = iterateEvents(widget.events);
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),
      appBar: AppBar(
        title: const Text("Your events"),
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
        isEditable: true,
        marginbottom: 5,
      ));
    } else if (i == events.length - 1) {
      listOfEvents.add(EventCustomCard(
        event: events[i],
        isEditable: true,
        margintop: 5,
      ));
    } else {
      listOfEvents.add(EventCustomCard(
        event: events[i],
        isEditable: true,
      ));
    }
  }
  return listOfEvents;
}
