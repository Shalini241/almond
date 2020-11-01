import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Help',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
