import 'package:almond/providers/topic.dart';
import 'package:almond/screens/app_drawer.dart';
import 'package:almond/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicScreen extends StatefulWidget {
  static final routeName = '/topics';
  final String standard;
  final String subject;
  TopicScreen({this.standard, this.subject});

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  Future _topicFuture;

  Future _getTopicFuture() {
    return Provider.of<Topics>(context, listen: false).getAllTopic();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _topicFuture = _getTopicFuture();
    });
  }

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
      body: FutureBuilder(
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              //...error handling
              return Center(
                child: Text('Error Occurred!'),
              );
            } else {
              return Consumer<Topics>(
                builder: (ctx, topics, child) => ListView.builder(
                  itemCount: topics.topicList.length,
                  itemBuilder: (ctx, i) => TopicCard(topics.topicList[i]),
                ),
              );
            }
          }
        },
        future: _topicFuture,
      ),
    );
  }
}
