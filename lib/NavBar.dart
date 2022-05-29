import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Laura Levy'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                      'https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          ListTile(
            leading: Icon(
              Icons.border_color_outlined,
            ),
            title: Text('CREATE EVENT'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.border_color_outlined,
            ),
            title: Text('MY SUBSCRIPTIONS'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month_sharp,
            ),
            title: Text('MY EVENTS'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.settings_accessibility_outlined,
            ),
            title: Text('FRIENDS'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.abc_outlined,
            ),
            title: Text('TIPS'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text('PREFERENCES'),
            onTap: () => null,
          ),
          Divider(),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
            ),
            title: Text('LOGOUT'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
