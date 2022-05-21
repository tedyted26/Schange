import 'package:flutter/material.dart';
import 'EventCustomCard.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEvent();
}

class _NewEvent extends State<NewEvent> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  String picUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      appBar: AppBar(
        title: const Text("New event"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
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
                    //TITLE
                    TextField(
                      controller: _titleController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        hintText: "Add your title here...",
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    //IMAGE
                    if (picUrl == "") //mostrar contenedor y boton
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        height: 220,
                        width: 320,
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
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {}, //TODO Pillar foto de galeria
                        ),
                      ),
                    if (picUrl != "")
                      EventCustomCardImage(picUrl: picUrl, marginTop: 10),
                    //DESCRIPTION
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F9FF),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                          controller: _descController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Describe your plans...",
                            hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          )),
                    ),
                    //OTHER DATA
                    //Maximum numer of people
                    Row(
                      children: [
                        CustomPairIconText(
                            icon: Icons.people,
                            text: "Maximum number of people:"),
                      ],
                    ),
                    //Average price per person
                    Row(
                      children: [
                        CustomPairIconText(
                            icon: Icons.euro,
                            text: "Average price per person:"),
                      ],
                    ),
                    //Type of event
                    Row(
                      children: [
                        CustomPairIconText(
                            icon: Icons.chair, text: "Type of event:"),
                      ],
                    ),
                    //Date
                    Row(
                      children: [
                        CustomPairIconText(
                            icon: Icons.calendar_month, text: "Date:"),
                      ],
                    ),
                    //Location
                    Row(
                      children: [
                        CustomPairIconText(
                            icon: Icons.location_on, text: "Location:"),
                      ],
                    ),
                    //LOCATION
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text('Espacio para Ubicación'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                print(_titleController.text);
              },
              child: const Text(
                "Publish event",
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
          ),
        ],
      ),
    );
  }
}
