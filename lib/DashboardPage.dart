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
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://i.pravatar.cc/300',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vivien Heaslip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Created on ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Image.network(
                  element['picUrl'],
                  height: 220,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              element['title'],
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //NUMBER OF PEOPLE
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Max persona',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(
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
                      'Fecha',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(
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
                      'Precio',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(
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
                      'Categoria',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Icon(
                      Icons.chair,
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 35),
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
                })
          ],
        ),
      ),
    );
  }
}
