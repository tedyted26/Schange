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
  const EventCustomCardImage(
      {Key? key, this.picUrl = 'images/no-image.png'}) //TODO mirar rutas
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Image.asset(
          picUrl,
          height: 220,
          width: 320,
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
<<<<<<< HEAD
                child: Image.network(
                  'https://i.pravatar.cc/300',
=======
                child: Image.asset(
                  userdata.profilePic,
>>>>>>> 4b532fe1d4efaabfb207babbadc08469c31fc9b0
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
<<<<<<< HEAD
                      'Vivien Heaslip',
=======
                      userdata.name,
>>>>>>> 4b532fe1d4efaabfb207babbadc08469c31fc9b0
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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '$maxPeople ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Icons.people,
                size: 22,
              ),
            ],
          ),
          //DATE
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '$date ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Icons.calendar_month,
                size: 22,
              ),
            ],
          ),
          //PRICE
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '$price ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Icons.euro,
                size: 22,
              ),
            ],
          ),
          //CATEGORY
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '$category ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Icons.chair,
                size: 22,
              ),
            ],
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
  State<StatefulWidget> createState() =>
      _EventCustomCardSocialIcons(likes: this.likes);
}

class _EventCustomCardSocialIcons extends State<EventCustomCardSocialIcons> {
  int likes;
  bool _pressed = false;

  _EventCustomCardSocialIcons({required this.likes});

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
