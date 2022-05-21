import 'dart:io';

import 'package:flutter/material.dart';
import 'User.dart';

//temporal
User getUserData(int idCreator) {
  //pillar de json
  User user_data = User(
      id: idCreator,
      name: 'Teo',
      profilePic: '',
      mail: '',
      contacts: [],
      chats: []);
  if (user_data.profilePic == "") {
    user_data.profilePic = "images/no_user.png";
  }
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
  const EventCustomCardImage(
      {Key? key,
      this.picUrl = 'images/no-image.png',
      this.marginTop = 15}) //TODO mirar rutas
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 320,
      margin: EdgeInsets.only(top: marginTop, bottom: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Image.asset(
          picUrl,
          fit: BoxFit.cover,
        ),
      ),
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
    User userdata = getUserData(idCreator);

    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  userdata.profilePic,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
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

  _EventCustomCardSocialIcons() {
    likes = widget.likes;
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
