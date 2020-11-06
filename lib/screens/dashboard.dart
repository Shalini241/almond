import 'package:almond/providers/subject.dart';
import 'package:almond/screens/app_drawer.dart';
import 'package:almond/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future _subjectFuture;

  Future _getSubjectFuture() {
    return Provider.of<Subjects>(context, listen: false).getAllSubject();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _subjectFuture = _getSubjectFuture();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Subjects'),
        ),
        elevation: 0.0,
        actions: [],
      ),
      body: new Builder(builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: FlatButton(
                      child: Text(
                        "Class XI",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: FlatButton(
                      child: Text(
                        "Class XII",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
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
                      return Consumer<Subjects>(
                        builder: (ctx, subjects, child) => ListView.builder(
                          itemCount: subjects.subjectList.length,
                          itemBuilder: (ctx, i) =>
                              SubjectCard(subjects.subjectList[i]),
                        ),
                      );
                    }
                  }
                },
                future: _subjectFuture,
              ),
            ),
          ],
        );
      }),
      drawer: AppDrawer(),
    );
  }
}
