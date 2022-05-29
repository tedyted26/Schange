// ignore: file_names
import 'dart:convert';

import 'package:Schange/Event.dart';
import 'package:Schange/EventCustomCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//HAY QUE PASARLE EL ID DEL USUARIO, ÉL YA SE BUSCA LA VIDA PARA CARGAR LAS COSAS
class YourSubscriptions extends StatefulWidget {
  final int userId = 0;
  const YourSubscriptions({Key? key}) : super(key: key);

  @override
  State<YourSubscriptions> createState() => _YourSubscriptionsState();
}

class _YourSubscriptionsState extends State<YourSubscriptions> {
  Future fetchEvents() async {
    final jsonData = await rootBundle.loadString('json/events.json');
    final list = json.decode(jsonData) as List<dynamic>;
    List<Event> listSubscribedEvents = [];
    if (list.isNotEmpty) {
      final List<Event> listAllEvents =
          list.map((e) => Event.fromJson(e)).toList();

      for (int i = 0; i < listAllEvents.length; i++) {
        if (listAllEvents[i].subscribedPeople.contains(widget.userId)) {
          listSubscribedEvents.add(listAllEvents[i]);
        }
      }
    }
    return listSubscribedEvents;
  }

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
                          isSubscribed: true,
                          marginbottom: 5,
                        );
                      } else if (index == items.length - 1) {
                        return EventCustomCard(
                          event: items[index],
                          isSubscribed: true,
                          margintop: 5,
                        );
                      } else if (index < items.length) {
                        return EventCustomCard(
                          event: items[index],
                          isSubscribed: true,
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Center(
                  child: Text(
                    "You haven't subscribed to any events yet!",
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
