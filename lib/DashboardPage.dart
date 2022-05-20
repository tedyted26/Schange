import 'package:flutter/material.dart';
import 'EventCustomCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('images/logo_principal.png',
            height: 50, fit: BoxFit.cover),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message),
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
            Scrollbar(
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
                  ],
                ),
              ),
            ),
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
