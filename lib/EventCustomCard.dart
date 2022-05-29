import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'User.dart';
import 'Event.dart';

//finiquitado
class EventCustomCard extends StatelessWidget {
  final Event event;
  final int idUser;
  final bool isEditable;
  final bool isSubscribed;
  final double margintop;
  final double marginbottom;
  const EventCustomCard(
      {Key? key,
      required this.event,
      required this.idUser,
      this.isEditable = false,
      this.isSubscribed = false,
      this.margintop = 20,
      this.marginbottom = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/event-details', arguments: [event, idUser]);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 20, right: 20, top: margintop, bottom: marginbottom),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
        height: 455,
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
            isEditable
                ? Container(
                    margin: const EdgeInsets.only(
                        top: 13, bottom: 10, left: 5, right: 5),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "Created on ${event.creationDate}",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )))
                : EventCustomCardCreatorInfo(
                    event: event,
                    idUser: event.creatorId,
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
              maxPeople: '5',
              price: event.price,
              marginbottom: 0,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 70,
              margin: const EdgeInsets.only(bottom: 5),
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
                    maxLines: 3,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            Align(
              child: EventCustomCardSocialIcons(
                event: event,
                isEditable: isEditable,
                isSubscribed: isSubscribed,
                marginTop: 0,
                marginBottom: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//finiquitado
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
  final int idUser;
  final bool showButton;
  final Event event;
  final double marginbottom;

  const EventCustomCardCreatorInfo(
      {Key? key,
      required this.idUser,
      required this.event,
      this.showButton = true,
      this.marginbottom = 15})
      : super(key: key);

  Future fetchCreatorInfo() async {
    final jsonData = await rootBundle.loadString('json/users.json');
    final list = json.decode(jsonData) as List<dynamic>;
    User creatorInfo;
    if (list.isNotEmpty) {
      final List<User> listAllUsers =
          list.map((e) => User.fromJson(e)).toList();

      for (int i = 0; i < listAllUsers.length; i++) {
        if (listAllUsers[i].id == idUser) {
          creatorInfo = listAllUsers[i];
          return creatorInfo;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCreatorInfo(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text(
                "Oh no! Something went wrong!",
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
            );
          } else if (data.hasData) {
            User item = data.data as User;
            String profilepic = item.profilePic;
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
                                height: 45,
                                width: 45,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(profilepic),
                                height: 45,
                                width: 45,
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
                              item.name,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Created on ${event.creationDate}',
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
                  showButton
                      ? IconButton(
                          icon: const Icon(
                            Icons.message,
                            size: 30,
                          ),
                          onPressed:
                              () {}, //TODO navegar a mensajes con el id del usuariolog y el id del creador
                        )
                      : Container(),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator(
              color: Theme.of(context).focusColor,
            );
          }
        });
  }
}

//finiquitado
class EventCustomCardFiltersInfo extends StatelessWidget {
  final String maxPeople;
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

//finiquitado
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

//finiquitado
class EventCustomCardSocialIcons extends StatefulWidget {
  final Event event;
  final bool isEditable;
  final bool isSubscribed;
  final double marginTop;
  final double marginBottom;
  const EventCustomCardSocialIcons(
      {Key? key,
      required this.event,
      this.isEditable = false,
      this.isSubscribed = false,
      this.marginTop = 10,
      this.marginBottom = 15})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventCustomCardSocialIcons();
}

//finiquitado
class _EventCustomCardSocialIcons extends State<EventCustomCardSocialIcons> {
  int likes = 0;
  bool _pressed = false;

  @override
  void initState() {
    likes = widget.event.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.marginTop, bottom: widget.marginBottom, left: 4),
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
              Icons.share,
              size: 28,
              color: Theme.of(context).focusColor,
            ),
            onPressed: () {},
          ),
          widget.isEditable
              ? IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).focusColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/edit-event',
                        arguments: [widget.event, widget.event.creatorId]);
                  },
                )
              : Container(),
          widget.isEditable
              ? IconButton(
                  onPressed: () {
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
                                      Navigator.pop(context, 'Yes');
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Theme.of(context).errorColor),
                                    ))
                              ],
                            ));
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ))
              : Container(),
          widget.isSubscribed
              ? Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 2.15,
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).errorColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertDialog(
                                      title: const Text(
                                          "Unsubscribe from this event?"),
                                      elevation: 1,
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .focusColor),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Yes');
                                            },
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .errorColor),
                                            ))
                                      ],
                                    ));
                          },
                          child: const Text(
                            "Unsubscribe",
                            style: TextStyle(color: Colors.white),
                          ))))
              : Container(),
        ],
      ),
    );
  }
}
