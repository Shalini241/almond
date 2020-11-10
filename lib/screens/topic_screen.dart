import 'package:almond/providers/topics.dart';
import 'package:almond/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicScreen extends StatefulWidget {
  static final routeName = '/topics';
  final int classId;
  final int subjectId;

  TopicScreen({this.classId, this.subjectId});

  @override
  _TopicScreenState createState() =>
      _TopicScreenState(subjectId: subjectId, classId: classId);
}

class _TopicScreenState extends State<TopicScreen> {
  Future _topicFuture;
  final int classId;
  final int subjectId;
  bool _isInit = true;

  _TopicScreenState({@required this.classId, @required this.subjectId});

  Future _getTopicFuture() {
    return Provider.of<Topics>(context, listen: false)
        .getTopic(classId, subjectId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _topicFuture = _getTopicFuture();
    }
    _isInit = false;

    super.didChangeDependencies();
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
                  itemBuilder: (ctx, i) =>
                      TopicCard(topics.topicList[i].topicName),
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
