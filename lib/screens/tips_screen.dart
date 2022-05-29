//import 'dart:html';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TipsScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  List<String> idiomas = ['Spanish', 'French', 'German', 'Italian'];
  String? idiomaSeleccionado = 'Spanish';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {}, //TODO boton de volver
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Color(0xffF5F9FF),
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    width: 240,
                    alignment: Alignment.bottomLeft,
                    child: Text("Select Language: ",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                        ))),
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  margin: const EdgeInsets.only(bottom: 25),
                  child: _seleccionador(),
                ),
                if (idiomaSeleccionado == 'Spanish') ...[
                  _tablaSpanish(),
                ],
                if (idiomaSeleccionado == 'French') ...[
                  _tablaFrench(),
                ],
                if (idiomaSeleccionado == 'German') ...[
                  _tablaGerman(),
                ],
                if (idiomaSeleccionado == 'Italian') ...[
                  _tablaItalian(),
                ],
                Container(
                    margin: const EdgeInsets.only(top: 25), child: _tipCard()),
              ],
            )),
      ),
    );
  }

  Widget _seleccionador() {
    return Card(
      shadowColor: const Color(0xffBABDFF),
      elevation: 5,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: DropdownButton(
                style: const TextStyle(
                    fontSize: 18.0, color: Color.fromRGBO(0, 12, 48, 71)),
                underline: Container(),
                isExpanded: true,
                value: idiomaSeleccionado,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: idiomas.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    idiomaSeleccionado = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipCard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
          shadowColor: Color(0xffBABDFF),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                Image.network(
                    'https://ichef.bbci.co.uk/news/640/cpsprodpb/1A28/production/_103669660_whatsubject.jpg'),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Tip of the day!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "If you visit Spain, tipping is not included in the final bill. If you liked the food and the service of the waiters or barman, which you will undoubtedly do as they are usually professionals who have been in the trade for many years, the tip is usually 10% or more of the total bill.\n",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 12, 48, 71), fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tablaSpanish() {
    return SizedBox(
      child: Card(
        shadowColor: Color(0xffBABDFF),
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Table(
                defaultColumnWidth: const FixedColumnWidth(180.0),
                //border: TableBorder.all(
                //color: Colors.black,
                //style: BorderStyle.solid,
                //  width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hello',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hola',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('Review', style: TextStyle(fontSize: 5.0))]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('How are you?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('¿Que tal estás?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Are you ok?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('¿Estas bien?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Thank you',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Gracias',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good morning',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Buenos días',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good afternoon',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Buenas tardes',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Good night',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Buenas noches',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                ],
              ),
            ])),
      ),
    );
  }

  Widget _tablaFrench() {
    return SizedBox(
      child: Card(
        shadowColor: Color(0xffBABDFF),
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Table(
                defaultColumnWidth: const FixedColumnWidth(180.0),
                //border: TableBorder.all(
                //color: Colors.black,
                //style: BorderStyle.solid,
                //  width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hello',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Bonjour',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('Review', style: TextStyle(fontSize: 5.0))]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('How are you?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Comment ça va?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Are you ok?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Vous allez bien?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Thank you',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Je vous remercie',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good morning',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Bonjour',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good afternoon',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Bon après-midi',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Good night',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Bonsoir',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                ],
              ),
            ])),
      ),
    );
  }

  Widget _tablaGerman() {
    return SizedBox(
      child: Card(
        shadowColor: Color(0xffBABDFF),
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Table(
                defaultColumnWidth: const FixedColumnWidth(180.0),
                //border: TableBorder.all(
                //color: Colors.black,
                //style: BorderStyle.solid,
                //  width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hello',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hallo',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('Review', style: TextStyle(fontSize: 5.0))]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('How are you?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Wie geht es dir?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Are you ok?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Geht es Ihnen gut?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Thank you',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Danke',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good morning',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Guten Morgen',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good afternoon',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Guten Tag',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Good night',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Gute Nacht',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                ],
              ),
            ])),
      ),
    );
  }

  Widget _tablaItalian() {
    return SizedBox(
      child: Card(
        shadowColor: Color(0xffBABDFF),
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Table(
                defaultColumnWidth: const FixedColumnWidth(180.0),
                //border: TableBorder.all(
                //color: Colors.black,
                //style: BorderStyle.solid,
                //  width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Hello',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Ciao',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('Review', style: TextStyle(fontSize: 5.0))]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('How are you?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Come stai?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Are you ok?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Stai bene?',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    //Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Thank you',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Grazie',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good morning',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Buongiorno',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Good afternoon',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 15, top: 15),
                        child: const Text('Buon pomeriggio',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Good night',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 15),
                        child: const Text('Buona notte',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(0, 12, 48, 71))),
                      )
                    ]),
                    // Column(children:[Text('5*')]),
                  ]),
                ],
              ),
            ])),
      ),
    );
  }
}
