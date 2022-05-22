import 'package:flutter/material.dart';
import 'Event.dart';

class YourEvents extends StatefulWidget {
  final Event event;
  const YourEvents({Key? key, required this.event}) : super(key: key);

  @override
  State<YourEvents> createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
