import 'package:almond/screens/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static final routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('About Us'),
        ),
        elevation: 0.0,
        actions: [],
      ),
      drawer: AppDrawer(2),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Shalini',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'This is all you need to know',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Thank you for using the app',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
