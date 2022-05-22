import 'dart:io';

import 'package:flutter/material.dart';
import 'User.dart';
import 'Event.dart';

User getFromJsonUserData(int idCreator) {
  //pillar de json
  User userdata = User(
      id: idCreator,
      name: 'Teo',
      profilePic: '',
      mail: '',
      contacts: [],
      chats: []);

  return userdata;
}

class EventCustomCard extends StatelessWidget {
  final Event event;
  final bool isEditable;
  const EventCustomCard(
      {Key? key, required this.event, this.isEditable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userInfo;
    if (isEditable) userInfo = getFromJsonUserData(event.creatorId);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
      height: 450,
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
          EventCustomCardCreatorInfo(
            date: event.creationDate,
            idCreator: event.creatorId,
            marginbottom: 0,
          ),
          EventCustomCardImage(
            picUrl: event.picUrl,
            marginTop: 5,
            marginBottom: 5,
          ),
          EventCustomCardFiltersInfo(
            category: event.category,
            date: event.eventDate,
            maxPeople: event.maxPeople,
            price: event.price,
            marginbottom: 0,
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  event.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          Align(
            child: EventCustomCardSocialIcons(
              likes: event.likes,
              marginTop: 0,
              marginBottom: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class EventCustomCardImage extends StatelessWidget {
  final String picUrl;
  final double marginTop;
  final double marginBottom;
  final bool isOriginCreateEvent;

  const EventCustomCardImage(
      {Key? key,
      required this.picUrl,
      this.marginTop = 15,
      this.marginBottom = 15,
      this.isOriginCreateEvent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pic = "";
    if (picUrl == "" && !isOriginCreateEvent) {
      pic = "images/no-image.png";
    } else {
      pic = picUrl;
    }
    return Container(
      height: 220,
      width: 320,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.inner,
                blurRadius: 2,
                offset: Offset(0, -0.5),
                spreadRadius: 1.5,
                color: Color(0xffD6EAFF)),
          ]),
      child: pic != ""
          ? ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: (!pic.startsWith("images/"))
                  // si es un archivo del emulador
                  ? Image.file(
                      File(pic),
                      fit: BoxFit.cover,
                    )
                  // si no es un archivo del emulador
                  : Image.asset(
                      pic,
                      fit: BoxFit.cover,
                    ),
            )
          : Container(),
    );
  }
}

class EventCustomCardCreatorInfo extends StatelessWidget {
  final int idCreator;
  final String date;
  final double marginbottom;

  const EventCustomCardCreatorInfo(
      {Key? key,
      required this.idCreator,
      required this.date,
      this.marginbottom = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userdata = getFromJsonUserData(idCreator);
    String profilepic = userdata.profilePic;
    if (profilepic == "") profilepic = "images/no_user.png";

    return Container(
      margin: EdgeInsets.only(top: 5, bottom: marginbottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: profilepic.startsWith("images/")
                    ? Image.asset(
                        profilepic,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(profilepic),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, object, stacktrace) {
                          return Image.asset(
                            "images/no_user.png",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userdata.name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Created on $date',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.person_add_sharp,
              size: 30,
            ),
            onPressed:
                () {}, //TODO añadir el id del usuario creador a la lista del
            //usuario loggeado y hacer que el boton desaparezca
          ),
        ],
      ),
    );
  }
}

//finiquitado
class EventCustomCardFiltersInfo extends StatelessWidget {
  final int maxPeople;
  final String date;
  final int price;
  final String category;
  final double marginbottom;

  const EventCustomCardFiltersInfo(
      {Key? key,
      required this.maxPeople,
      required this.date,
      required this.price,
      required this.category,
      this.marginbottom = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginbottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //NUMBER OF PEOPLE
          CustomPairIconText(
            icon: Icons.people,
            text: '$maxPeople ',
            reversed: true,
            size: 22,
          ),

          //DATE
          CustomPairIconText(
            icon: Icons.calendar_month,
            text: date,
            reversed: true,
            size: 22,
          ),

          //PRICE
          CustomPairIconText(
            icon: Icons.euro,
            text: '$price',
            reversed: true,
            size: 22,
          ),

          //CATEGORY
          CustomPairIconText(
            icon: Icons.chair,
            text: category,
            reversed: true,
            size: 22,
          ),
        ],
      ),
    );
  }
}

class CustomPairIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool reversed;
  final double size;

  const CustomPairIconText({
    Key? key,
    required this.icon,
    required this.text,
    this.reversed = false,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          if (reversed)
            Text(
              ' ' + text + ' ',
              style: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(0.9),
              ),
            ),
          Icon(icon, size: size),
          if (!reversed)
            Text(
              ' ' + text,
              style: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(0.9),
              ),
            ),
        ],
      ),
    );
  }
}

class EventCustomCardSocialIcons extends StatefulWidget {
  final int likes;
  final double marginTop;
  final double marginBottom;
  const EventCustomCardSocialIcons(
      {Key? key,
      required this.likes,
      this.marginTop = 10,
      this.marginBottom = 15})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventCustomCardSocialIcons();
}

class _EventCustomCardSocialIcons extends State<EventCustomCardSocialIcons> {
  int likes = 0;
  bool _pressed = false;

  @override
  void initState() {
    likes = widget.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: widget.marginTop, bottom: widget.marginBottom),
      child: Row(
        children: [
          Text('$likes',
              style: TextStyle(
                color: Theme.of(context).focusColor,
              )),
          IconButton(
            icon: Icon(_pressed ? Icons.favorite : Icons.favorite_outline,
                size: 28, color: Theme.of(context).focusColor),
            onPressed: () {
              setState(() {
                if (_pressed) {
                  likes = likes - 1;
                  _pressed = false;
                } else {
                  likes = likes + 1;
                  _pressed = true;
                }
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.messenger_outline,
              size: 28,
              color: Theme.of(context).focusColor,
            ),
            onPressed: () {}, //TODO enviar mensaje
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 28,
              color: Theme.of(context).focusColor,
            ),
            onPressed: () {}, //TODO COMPARTIR
          ),
        ],
      ),
    );
  }
}
