// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'EventCustomCard.dart';
import 'package:schange/DashboardPage.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        title: Text("Details"),
        /*actions: [
          IconButton(
            icon: Icon(
              Icons.messenger_rounded,
            ),
            onPressed: () {},
          ),
        ],*/
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus(); // Que no abra el teclado al volver al login
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
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
                'Titulo',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400),
              ),
              EventCustomCardImage(),
              EventCustomCardCreatorInfo(),
              EventCustomCardFiltersInfo(),
              Text(
                'DescripcionDescripcionDescripcionDescripcionDescripcionDescripcionDescripcionDescripcionDescripcionDescripcion',
                textAlign: TextAlign.left,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              EventCustomCardSocialIcons(),
              Container(
                height: 100,
                margin: EdgeInsets.only(bottom: 25),
                child: Text('Espacio para Ubicación'),
              ),
              EventDetailsSubscribedPeople(),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetailsSubscribedPeople extends StatelessWidget {
  const EventDetailsSubscribedPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
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
              'nº/max nº',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/1537635/pexels-photo-1537635.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text('Nombre Apellidos',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              margin: EdgeInsets.only(left: 10),
            ),
            IconButton(
              icon: Icon(Icons.person_add_sharp, size: 24),
              onPressed: () {},
            )
          ],
        )
      ],
    ));
  }
}
