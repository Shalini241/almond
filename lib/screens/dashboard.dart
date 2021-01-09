import 'package:almond/providers/auth.dart';
import 'package:almond/providers/subjects.dart';
import 'package:almond/screens/app_drawer.dart';
import 'package:almond/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static final routeName = '/home';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future _subjectFuture;
  bool toggleClass = false;
  bool _isInit = true;
  bool _isLoading = false;

  Future _getSubjectFuture(int classId) {
    return Provider.of<Subjects>(context, listen: false).getSubjects(classId);
  }

  void toggleStandard(String standard) {
    if (standard == 'XI') {
      toggleClass = false;
      _isLoading = true;
      _subjectFuture = _getSubjectFuture(1).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      toggleClass = true;
      _isLoading = true;
      _subjectFuture = _getSubjectFuture(2).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _subjectFuture = _getSubjectFuture(1);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> _onWillPop() async {
    //   return (await showDialog(
    //         context: context,
    //         builder: (context) => new AlertDialog(
    //           title: new Text('Are you sure?'),
    //           content: new Text('Do you want to exit an App'),
    //           actions: <Widget>[
    //             new FlatButton(
    //               onPressed: () => Navigator.of(context).pop(false),
    //               child: new Text('No'),
    //             ),
    //             new FlatButton(
    //               onPressed: () => Navigator.of(context).pop(true),
    //               child: new Text('Yes'),
    //             ),
    //           ],
    //         ),
    //       )) ??
    //       false;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Expanded(
            child: Center(
              child: Text('Subjects'),
            ),
          ),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Provider.of<Auth>(context, listen: false).logout();
              })
        ]),
        elevation: 0.0,
        actions: [],
      ),
      drawer: AppDrawer(0),
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
                      onPressed: () => toggleStandard('XI'),
                      color: toggleClass ? Colors.transparent : Colors.blue,
                      textColor: toggleClass ? Colors.black : Colors.white,
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
                      onPressed: () => toggleStandard('XII'),
                      color: toggleClass ? Colors.blue : Colors.transparent,
                      textColor: toggleClass ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue[100],
                      ),
                    )
                  : GestureDetector(
                      onPanUpdate: (details) {
                        if (details.delta.dx > 0) {
                          //right swipe
                          if (toggleClass == true) toggleStandard('XI');
                        } else if (details.delta.dx < 0) {
                          //Left Swipe
                          if (toggleClass == false) toggleStandard('XII');
                        }
                      },
                      child: FutureBuilder(
                        builder: (ctx, dataSnapshot) {
                          if (dataSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            if (dataSnapshot.error != null) {
                              //...error handling
                              return Center(
                                child: Text('Error Occurred!'),
                              );
                            } else {
                              return Consumer<Subjects>(
                                builder: (ctx, subjects, child) =>
                                    ListView.builder(
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
            ),
          ],
        );
      }),
    );
  }
}
