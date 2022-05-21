// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'EventCustomCard.dart';
import 'Event.dart';
import 'User.dart';

//temporal
List<User> getUserList(subscribedPeopleList) {
  List<User> userList = [];
  //TODO buscarlo en JSON y devolver una lista de usuarios
  userList.add(User(
      chats: [],
      contacts: [],
      id: 1,
      mail: '',
      name: 'Nombre de prueba',
      profilePic: 'images/no_user.png'));

  return userList;
}

class EventDetailsPage extends StatefulWidget {
  final Event event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventDetailsPage();
}

class _EventDetailsPage extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<User> userList = getUserList(widget.event.subscribedPeople);
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {}, //TODO volver a menu
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: const [
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
                    EventCustomCardImage(
                      picUrl: widget.event.picUrl,
                    ),
                    EventCustomCardCreatorInfo(
                      date: widget.event.creationDate,
                      idCreator: widget.event.creatorId,
                    ),
                    EventCustomCardFiltersInfo(
                      category: widget.event.category,
                      date: widget.event.eventDate,
                      maxPeople: widget.event.maxPeople,
                      price: widget.event.price,
                    ),
                    Text(
                      widget.event.description,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    EventCustomCardSocialIcons(likes: widget.event.likes),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text('Espacio para Ubicación'),
                    ),
                    EventDetailsSubscribedPeople(
                      maxPeople: widget.event.maxPeople,
                      userList: userList,
                    ),
                  ],
                ),
              ),
            ),
          ),
          EventDetailsSubscribedButton(),
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
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    i.profilePic,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Text(i.name,
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  margin: EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class EventDetailsSubscribedButton extends StatelessWidget {
  const EventDetailsSubscribedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Subscribe to event",
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).focusColor.withOpacity(0.9);
            }
            return Theme.of(context).focusColor;
          }),
        ),
      ),
    );
  }
}
