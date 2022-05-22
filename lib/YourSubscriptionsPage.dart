import 'package:Schange/Event.dart';
import 'package:Schange/EventCustomCard.dart';
import 'package:flutter/material.dart';

class YourSubscriptions extends StatefulWidget {
  final Event event;
  const YourSubscriptions({Key? key, required this.event}) : super(key: key);

  @override
  State<YourSubscriptions> createState() => _YourSubscriptionsState();
}

class _YourSubscriptionsState extends State<YourSubscriptions> {
  @override
  Widget build(BuildContext context) {
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
      //FIXME ESTO VA DENTRO DE UN SCROLLABLE
      body: EventCustomCard(
        event: widget.event,
      ),
    );
  }
}
