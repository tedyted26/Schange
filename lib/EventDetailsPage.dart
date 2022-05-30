import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'EventCustomCard.dart';
import 'Event.dart';
import 'User.dart';

class EventDetailsPage extends StatefulWidget {
  final Event event;
  final int userId = 0;
  bool isEditable = false;
  bool isSubscribed = false;

  EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key) {
    if (event.creatorId == userId) {
      isEditable = true;
    } else if (event.subscribedPeople.contains(userId)) {
      isSubscribed = true;
    }
  }

  @override
  State<StatefulWidget> createState() => _EventDetailsPage();
}

class _EventDetailsPage extends State<EventDetailsPage> {
  Future fetchSubscribedPeople() async {
    final jsonData = await rootBundle.loadString('json/users.json');
    final list = json.decode(jsonData) as List<dynamic>;
    List<User> listSubscribedUsers = [];
    if (list.isNotEmpty) {
      final List<User> listAllUsers =
          list.map((e) => User.fromJson(e)).toList();

      for (int i = 0; i < listAllUsers.length; i++) {
        if (widget.event.subscribedPeople.contains(listAllUsers[i].id)) {
          listSubscribedUsers.add(listAllUsers[i]);
        }
      }
    }
    return listSubscribedUsers;
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FF),
      appBar: AppBar(
        title: const Text("Details"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/dashboard');
          },
        ),
        actions: [
          widget.isEditable
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/edit-event', arguments: widget.event);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).errorColor,
                  ),
                )
              : Container(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 1,
                        color: Color(0xffBEC1FF)),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      widget.event.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    EventCustomCardImage(picUrl: widget.event.picUrl),
                    EventCustomCardCreatorInfo(
                      event: widget.event,
                      idUser: widget.event.creatorId,
                      showButton: !widget.isEditable,
                    ),
                    EventCustomCardFiltersInfo(
                      category: widget.event.category,
                      date: widget.event.eventDate,
                      maxPeople: widget.event.maxPeople,
                      price: widget.event.price,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.event.description,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    EventCustomCardSocialIcons(event: widget.event),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 320,
                          width: 320,
                          margin: const EdgeInsets.only(top: 0, bottom: 30),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    blurStyle: BlurStyle.inner,
                                    blurRadius: 2,
                                    offset: Offset(0, -0.5),
                                    spreadRadius: 1.5,
                                    color: Color(0xffD6EAFF)),
                              ]),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            child: FlutterMap(
                                options: MapOptions(
                                    center: LatLng(widget.event.latitude,
                                        widget.event.longitude),
                                    zoom: 12),
                                layers: [
                                  TileLayerOptions(
                                    urlTemplate:
                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    subdomains: ['a', 'b', 'c'],
                                  ),
                                  MarkerLayerOptions(
                                    markers: [
                                      Marker(
                                        point: LatLng(widget.event.latitude,
                                            widget.event.longitude),
                                        builder: (ctx) => Icon(
                                          Icons.location_on,
                                          color: Theme.of(context).focusColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: fetchSubscribedPeople(),
                        builder: (context, data) {
                          if (data.hasError) {
                            return Center(
                              child: Text(
                                "Oh no! Something went wrong!",
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            );
                          } else if (data.hasData) {
                            var items = data.data as List<User>;
                            if (items.isNotEmpty) {
                              return EventDetailsSubscribedPeople(
                                maxPeople: widget.event.maxPeople,
                                userList: items,
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return CircularProgressIndicator(
                              color: Theme.of(context).focusColor,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          EventDetailsSubscribedButton(
            isEditable: widget.isEditable,
            isSubscribed: widget.isSubscribed,
            userId: widget.userId,
          ),
        ],
      ),
    );
  }
}

//finiquitao
class EventDetailsSubscribedPeople extends StatelessWidget {
  final List<User> userList;
  final int maxPeople;

  const EventDetailsSubscribedPeople(
      {Key? key, required this.maxPeople, required this.userList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numPeople = userList.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'People subscribed to the event: ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              '$numPeople / $maxPeople',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        for (var i in userList)
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                ClipOval(
                  child: i.profilePic != ""
                      ? Image.asset(
                          i.profilePic,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "images/no_user.png",
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                ),
                Container(
                  child: Text(i.name,
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  margin: const EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

//finiquitao
class EventDetailsSubscribedButton extends StatefulWidget {
  bool isEditable;
  bool isSubscribed;
  int userId;

  EventDetailsSubscribedButton({
    Key? key,
    this.isEditable = false,
    this.isSubscribed = false,
    required this.userId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventDetailsSubscribedButton();
}

//finiquitao
class _EventDetailsSubscribedButton
    extends State<EventDetailsSubscribedButton> {
  @override
  Widget build(BuildContext context) {
    String customText = "Subscribe to event";
    if (widget.isEditable) {
      customText = "Delete event";
    } else if (widget.isSubscribed) {
      customText = "Unsubscribe";
    }
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (widget.isSubscribed) {
              widget.isSubscribed = false;
            } else if (widget.isEditable) {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => AlertDialog(
                        title: const Text("Delete event?"),
                        elevation: 1,
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Theme.of(context).focusColor),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/your-events',
                                    arguments: widget.userId);
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ))
                        ],
                      ));
            } else {
              widget.isSubscribed = true;
            }
          });
        },
        child: Text(
          customText,
          style: const TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              if (widget.isEditable) {
                return Theme.of(context).errorColor.withOpacity(0.9);
              } else if (widget.isSubscribed) {
                return Theme.of(context).errorColor.withOpacity(0.9);
              } else {
                return Theme.of(context).focusColor.withOpacity(0.9);
              }
            }
            if (widget.isEditable) {
              return Theme.of(context).errorColor;
            } else if (widget.isSubscribed) {
              return Theme.of(context).errorColor;
            } else {
              return Theme.of(context).focusColor;
            }
          }),
        ),
      ),
    );
  }
}
