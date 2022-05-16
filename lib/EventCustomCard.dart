import 'package:flutter/material.dart';

class EventCustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class EventCustomCardImage extends StatelessWidget {
  const EventCustomCardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Image.network(
              'https://images.pexels.com/photos/1537635/pexels-photo-1537635.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              height: 220,
              width: 320,
              fit: BoxFit.cover,
            )));
  }
}

class EventCustomCardCreatorInfo extends StatelessWidget {
  const EventCustomCardCreatorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/1537635/pexels-photo-1537635.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre apellidos',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Created on Mes Dia',
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
            icon: Icon(
              Icons.person_add_sharp,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class EventCustomCardFiltersInfo extends StatelessWidget {
  const EventCustomCardFiltersInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //NUMBER OF PEOPLE
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Nº ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
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
                'Mes Dia ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
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
                'Nº ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
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
                'Categoria ',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
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

class EventCustomCardSocialIcons extends StatelessWidget {
  const EventCustomCardSocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 28,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.messenger_outline,
              size: 28,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 28,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
