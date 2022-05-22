import 'dart:io';

import 'package:flutter/material.dart';
import 'User.dart';

User getFromJsonUserData(int idCreator) {
  //pillar de json
  User user_data = User(
      id: idCreator,
      name: 'Teo',
      profilePic: '',
      mail: '',
      contacts: [],
      chats: []);

  return user_data;
}

class EventCustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class EventCustomCardImage extends StatelessWidget {
  final String picUrl;
  final double marginTop;
  final bool isOriginCreateEvent;

  const EventCustomCardImage(
      {Key? key,
      required this.picUrl,
      this.marginTop = 15,
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
      margin: EdgeInsets.only(top: marginTop, bottom: 15),
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

  const EventCustomCardCreatorInfo(
      {Key? key, required this.idCreator, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userdata = getFromJsonUserData(idCreator);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: (userdata.profilePic == "" ||
                        userdata.profilePic.startsWith("images/"))
                    ? Image.asset(
                        userdata.profilePic,
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
                      )
                    : Image.file(
                        File(userdata.profilePic),
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

  const EventCustomCardFiltersInfo(
      {Key? key,
      required this.maxPeople,
      required this.date,
      required this.price,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
  const EventCustomCardSocialIcons({Key? key, required this.likes})
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
      margin: const EdgeInsets.only(top: 10, bottom: 15),
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
