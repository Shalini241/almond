import 'package:almond/providers/subject.dart';
import 'package:almond/screens/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SubjectCard extends StatelessWidget {
  final Subject _subject;
  SubjectCard(this._subject);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      _subject.subjectName,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Yay! I have done it',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: LinearPercentIndicator(
                      lineHeight: 18.0,
                      percent: 1,
                      progressColor: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5),
                ),
              ),
              child: FlatButton(
                child: Text(
                  'Practice this deck',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicScreen(
                        classId: _subject.classId,
                        subjectId: _subject.id,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
