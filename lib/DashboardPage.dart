import 'package:Schange/NavBar.dart';
import 'package:Schange/constants.dart';
import 'package:flutter/material.dart';
import 'EventCustomCard.dart';
import 'package:Schange/EventCustomCard.dart';
import 'EventCustomCard.dart';
import 'Event.dart';
import 'User.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  List<Widget> itemsData = [];
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    getPostData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  void getPostData() {
    List<dynamic> responseList = EVENTS_DATA;
    List<Event> eventList = responseList.map((e) => Event.fromJson(e)).toList();
    List<Widget> listItem = [];
    for (Event element in eventList) {
      listItem.add(EventCustomCard(
        event: element,
      ));
    }
    setState(() {
      itemsData = listItem;
    });
  }

  Widget build(BuildContext context) {
    final filterIcons = [
      Icons.people,
      Icons.calendar_month,
      Icons.euro,
      Icons.chair,
      Icons.location_on
    ];
    final filterHints = [
      "Nº of people",
      "Date of event",
      "Price",
      "Type of event",
      "Location"
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Home"),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.chat_bubble),
              onPressed: () {
                //ScaffoldMessenger.of(context).showSnackBar(
                //const SnackBar(content: Text('This is a snackbar')));
                Navigator.of(context).pushNamed('/messages');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 40,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(155, 207, 221, 241),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search: ",
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      icon: Icon(Icons.search,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          width: 140,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(155, 207, 221, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: filterHints[index],
                              hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              icon: Icon(
                                filterIcons[index],
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF5F9FF),
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    }),
              ),
            ),
          ],
        ),
        drawer: NavBar());
  }
}
