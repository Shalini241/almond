import 'package:almond/screens/about_us.dart';
import 'package:almond/screens/dashboard.dart';
import 'package:almond/screens/help.dart';
import 'package:almond/screens/my_profile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final int _currentScreen;
  AppDrawer(this._currentScreen);
  @override
  _AppDrawerState createState() => _AppDrawerState(_currentScreen);
}

class _AppDrawerState extends State<AppDrawer> {
  int _currentSelected;
  _AppDrawerState(this._currentSelected);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            color: _currentSelected == 0 ? Colors.blue[700] : Colors.blue,
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                if (_currentSelected != 0) {
                  setState(() {
                    _currentSelected = 0;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Dashboard.routeName, (Route<dynamic> route) => false);
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              selected: true,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            //in upcoming version tileColor, selectedTileColor Properties can be added
            color: _currentSelected == 1 ? Colors.blue[700] : Colors.blue,
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                if (_currentSelected != 1) {
                  setState(() {
                    _currentSelected = 1;
                  });
                  Navigator.of(context)
                      .pushReplacementNamed(MyProfile.routeName);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            color: _currentSelected == 2 ? Colors.blue[700] : Colors.blue,
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                if (_currentSelected != 2) {
                  setState(() {
                    _currentSelected = 2;
                  });
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     AboutUs.routeName,
                  //     ModalRoute.withName(Dashboard.routeName));

                  Navigator.of(context).pushReplacementNamed(AboutUs.routeName);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            color: _currentSelected == 3 ? Colors.blue[700] : Colors.blue,
            child: ListTile(
              leading: Icon(
                Icons.help,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                if (_currentSelected != 3) {
                  setState(() {
                    _currentSelected = 3;
                  });
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     Help.routeName, ModalRoute.withName(Dashboard.routeName));

                  Navigator.of(context).pushReplacementNamed(Help.routeName);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
