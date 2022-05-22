import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'EventCustomCard.dart';
import 'package:image_picker/image_picker.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEvent();
}

class _NewEvent extends State<NewEvent> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _peopleController = TextEditingController();
  TextEditingController _moneyController = TextEditingController();
  File? image;
  String picPath = "";
  String? category;

  _NewEvent() {
    _peopleController.text = "0";
    _moneyController.text = "0";
  }

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F9FF),
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
                        children: [
                          CustomPairIconText(
                              icon: Icons.location_on, text: "Location:"),
                        ],
                      ),
                      //LOCATION
                      Container(
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 25),
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
                  print("title " + _titleController.text);
                  print("img " + picPath);
                  print("des " + _descController.text);
                  print("people " + _peopleController.text);
                  print("money " + _moneyController.text);
                  print("cat $category");
                  print("date " + formatString(date));
                  //TODO LOCATION
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
