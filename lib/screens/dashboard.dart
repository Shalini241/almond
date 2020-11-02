import 'package:almond/screens/app_drawer.dart';
import 'package:almond/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Topics'),
        ),
        elevation: 0.0,
        actions: [],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => TopicCard(i),
        itemCount: 5,
      ),
      drawer: AppDrawer(),
    );
  }
}
