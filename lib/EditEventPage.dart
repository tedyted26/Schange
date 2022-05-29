import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'EventCustomCard.dart';
import 'package:image_picker/image_picker.dart';
import 'Event.dart';
import "package:latlong2/latlong.dart";

class EditEvent extends StatefulWidget {
  final Event event;

  const EditEvent({Key? key, required this.event}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditEvent(picPath: event.picUrl);
}

class _EditEvent extends State<EditEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  final MapController _mapController = MapController();

  File? image;
  String picPath;
  String? category;

  _EditEvent({required this.picPath});

  final dropdownItems = [
    "Party",
    "Restaurant",
    "Trip",
    "Tourism",
    "Cinema",
    "Other"
  ];

  DateTime date = DateTime.now();

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      picPath = this.image!.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.event.title;
    _descController.text = widget.event.description;
    _peopleController.text = widget.event.maxPeople.toString();
    _moneyController.text = widget.event.price.toString();
    double _lat = widget.event.latitude;
    double _long = widget.event.longitude;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F9FF),
        appBar: AppBar(
          title: const Text("Edit event"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => AlertDialog(
                        title: const Text("Exit without saving?"),
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
                                Navigator.of(context).pushNamed(
                                    '/event-details',
                                    arguments: widget.event);
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ))
                        ],
                      ));
            },
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          EventCustomCardImage(
                            picUrl: picPath,
                            marginTop: 10,
                            isOriginCreateEvent: true,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_a_photo),
                            onPressed: () => setState(() {
                              pickImage();
                            }),
                          ),
                        ],
                      ),

                      //DESCRIPTION
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.only(left: 15, right: 15),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomPairIconText(
                              icon: Icons.people,
                              text: "Maximum number of people:"),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              iconSize: 11,
                              onPressed: () {
                                setState(() {
                                  int val =
                                      int.tryParse(_peopleController.text) ?? 0;
                                  if (val <= 0) {
                                    _peopleController.text = "0";
                                  } else {
                                    _peopleController.text = "${val - 1}";
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xffF5F9FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: TextField(
                              controller: _peopleController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                              decoration: const InputDecoration(
                                counterText: "",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 11,
                              onPressed: () {
                                int val =
                                    int.tryParse(_peopleController.text) ?? 0;
                                if (val >= 999) {
                                  _peopleController.text = "999";
                                } else {
                                  _peopleController.text = "${val + 1}";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      //Average price per person
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomPairIconText(
                              icon: Icons.euro,
                              text: "Average price per person:"),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                margin: const EdgeInsets.only(right: 7),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xffF5F9FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: TextField(
                                  controller: _moneyController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.euro,
                                  size: 24,
                                  color: Theme.of(context).focusColor),
                            ],
                          ),
                        ],
                      ),
                      //Type of event
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomPairIconText(
                              icon: Icons.chair, text: "Type of event:"),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      blurStyle: BlurStyle.inner,
                                      blurRadius: 2,
                                      offset: Offset(0, -0.5),
                                      spreadRadius: 1.5,
                                      color: Color(0xffD6EAFF))
                                ]),
                            child: DropdownButton(
                              value: category,
                              hint: const Text("Select category "),
                              elevation: 1,
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).focusColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  )),
                              isDense: true,
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: Colors.white,
                              underline: Container(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              items: dropdownItems.map(buildMenuItem).toList(),
                              onChanged: (value) {
                                if (value is String) {
                                  setState(() {
                                    category = value;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      //Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomPairIconText(
                              icon: Icons.calendar_month, text: "Date:"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatString(date),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextButton(
                                  child: const Text(
                                    "Pick a date",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2122),
                                        builder: (context, child) {
                                          return Theme(
                                              data: ThemeData().copyWith(
                                                colorScheme: ColorScheme
                                                    .highContrastLight(
                                                  primary: Theme.of(context)
                                                      .focusColor,
                                                ),
                                              ),
                                              child: child!);
                                        }).then((newDate) {
                                      setState(() {
                                        date = newDate!;
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //Location
                      Row(
                        children: const [
                          CustomPairIconText(
                              icon: Icons.location_on, text: "Location:"),
                        ],
                      ),
                      //LOCATION
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 320,
                            width: 320,
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
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
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              child: FlutterMap(
                                  mapController: _mapController,
                                  options: MapOptions(
                                      center: LatLng(_lat, _long), zoom: 12),
                                  layers: [
                                    TileLayerOptions(
                                      urlTemplate:
                                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      subdomains: ['a', 'b', 'c'],
                                    ),
                                    MarkerLayerOptions(
                                      markers: [
                                        Marker(
                                          point: LatLng(_lat, _long),
                                          builder: (ctx) => Icon(
                                            Icons.location_on,
                                            color: Theme.of(context).focusColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ],
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
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => AlertDialog(
                            title: const Text("Save changes?"),
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
                                    Navigator.of(context).pushNamed(
                                        '/your-events',
                                        arguments: widget.event.creatorId);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor),
                                  ))
                            ],
                          ));
                },
                child: const Text(
                  "Save event",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
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
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }

  String formatString(DateTime date) {
    String stringDate = "";
    int month = date.month.toInt();
    List<String> monthStrings = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    stringDate += monthStrings[month - 1];
    stringDate += " " + date.day.toString() + " " + date.year.toString();
    return stringDate;
  }
}
