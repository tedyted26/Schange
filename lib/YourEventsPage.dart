import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Event.dart';
import 'EventCustomCard.dart';

//HAY QUE PASARLE EL ID DEL USUARIO, ÉL YA SE BUSCA LA VIDA PARA CARGAR LAS COSAS
class YourEvents extends StatefulWidget {
  final int userId = 0;
  const YourEvents({
    Key? key,
  }) : super(key: key);

  @override
  State<YourEvents> createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  Future fetchEvents() async {
    final jsonData = await rootBundle.loadString('json/events.json');
    final list = json.decode(jsonData) as List<dynamic>;
    List<Event> listYourEvents = [];
    if (list.isNotEmpty) {
      final List<Event> listAllEvents =
          list.map((e) => Event.fromJson(e)).toList();

      for (int i = 0; i < listAllEvents.length; i++) {
        if (listAllEvents[i].creatorId == widget.userId) {
          listYourEvents.add(listAllEvents[i]);
        }
      }
    }
    return listYourEvents;
  }

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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
          future: fetchEvents(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text(
                  "Oh no! Something went wrong!",
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              );
            } else if (data.hasData) {
              var items = data.data as List<Event>;
              if (items.isNotEmpty) {
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return EventCustomCard(
                          event: items[index],
                          isEditable: true,
                          marginbottom: 5,
                        );
                      } else if (index == items.length - 1) {
                        return EventCustomCard(
                          event: items[index],
                          isEditable: true,
                          margintop: 5,
                        );
                      } else if (index < items.length) {
                        return EventCustomCard(
                          event: items[index],
                          isEditable: true,
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Center(
                  child: Text(
                    "Unbelievable, you haven't created any events yet!",
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 16),
                  ),
                );
              }
            } else {
              return CircularProgressIndicator(
                color: Theme.of(context).focusColor,
              );
            }
          }),
    );
  }
}
