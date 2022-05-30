import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF2F5F8),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Laura Levy',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16),
            ),
            accountEmail: Text('lauralevy@mail.com',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 14)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
                'images/user_0.jpg',
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              )),
            ),
            decoration: const BoxDecoration(color: Colors.white),
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 73, 85, 103),
            leading: const Icon(Icons.add_circle),
            title: const Text('CREATE EVENT'),
            onTap: () => Navigator.of(context).pushNamed('/new-event'),
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 73, 85, 103),
            leading: const Icon(
              Icons.edit_calendar,
            ),
            title: const Text('MY EVENTS'),
            onTap: () => Navigator.of(context).pushNamed('/your-events'),
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 73, 85, 103),
            leading: const Icon(
              Icons.event_available,
            ),
            title: const Text('MY SUBSCRIPTIONS'),
            onTap: () => Navigator.of(context).pushNamed('/your-subscriptions'),
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 73, 85, 103),
            leading: const Icon(
              Icons.lightbulb,
            ),
            title: const Text('TIPS'),
            onTap: () => Navigator.of(context).pushNamed('/tips'),
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 73, 85, 103),
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text('SETTINGS'),
            onTap: () => Navigator.of(context).pushNamed('/settings'),
          ),
          Container(
            padding: const EdgeInsets.only(top: 205),
            child: ListTile(
              iconColor: const Color.fromARGB(255, 73, 85, 103),
              leading: const Icon(
                Icons.power_settings_new,
              ),
              title: const Text('LOGOUT'),
              onTap: () => Navigator.of(context).pushNamed('/login'),
            ),
          ),
        ],
      ),
    );
  }
}
