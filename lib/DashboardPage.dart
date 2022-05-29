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
      listItem.add(EventCustomCard(event: element));
    }
    setState(() {
      itemsData = listItem;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.messenger_rounded),
              onPressed: () {
                //ScaffoldMessenger.of(context).showSnackBar(
                //const SnackBar(content: Text('This is a snackbar')));
                Navigator.of(context).pushNamed('/messages');
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(49, 26, 29, 29),
                      borderRadius: BorderRadius.all(Radius.circular(22.0)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search: ",
                        hintStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle: TextStyle(color: Colors.black),
                          icon: Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                      width: 120,
                      margin: const EdgeInsets.all(10),
                      color: const Color(0xFFF5F9FF),
                    ),
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: itemsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return itemsData[index];
                      }))
            ],
          ),
        ),
        drawer: NavBar());
  }
}
