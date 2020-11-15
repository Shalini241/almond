import 'package:almond/screens/app_drawer.dart';
import 'package:almond/widgets/temp.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  static final routeName = '/my-profile';
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
      body: TeXViewDocumentExamples(),
    );
  }
}
