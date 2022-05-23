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
    List<Widget> listItem = [];
    responseList.forEach((element) {
      listItem.add(Container(
        height: 550,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
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
                  EventCustomCardCreatorInfo(
                    date: 'Monday',
                    idCreator: element['id'],
                  ),
                  EventCustomCardImage(
                    picUrl: element['picUrl'],
                  ),
                  EventCustomCardFiltersInfo(
                    category: element['category'],
                    date: 'Monday',
                    maxPeople: element['max_people'].toString(),
                    price: element['price'],
                  ),
                  Text(
                    element['title'],
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Bring your tacos hunger!',
                    style: TextStyle(color: Colors.black),
                  ),
                  EventCustomCardSocialIcons(likes: 10),
                ],
              ),
            )
          ],
        ),
      ));
    });
    setState(() {
      itemsData = listItem;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('images/logo_principal.png',
            height: 50, fit: BoxFit.cover),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.messenger_rounded),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(49, 26, 29, 29),
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search 4 Party",
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type",
                        hintStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    width: 120,
                    margin: EdgeInsets.all(10),
                    color: Color(0xFFF5F9FF),
                  ),
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    }))
          ],
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Laura Levy'),
              accountEmail: new Text('laural@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
                title: new Text('CREATE EVENT'),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("MY EVENTS"),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("FRIENDS"),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("TIPS"),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("PREFERNCES"),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            new ListTile(
                title: new Text("LOGOUT"),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
