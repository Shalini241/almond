import 'package:almond/providers/subjects.dart';
import 'package:almond/providers/topics.dart';
import 'package:almond/screens/about_us.dart';
import 'package:almond/screens/dashboard.dart';
import 'package:almond/screens/formula_screen.dart';
import 'package:almond/screens/help.dart';
import 'package:almond/screens/my_profile.dart';
import 'package:almond/screens/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Topics(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Subjects(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: Dashboard(),
        routes: {
          FormulaScreen.routeName: (ctx) => FormulaScreen(1),
          TopicScreen.routeName: (ctx) => TopicScreen(),
          AboutUs.routeName: (ctx) => AboutUs(),
          Help.routeName: (ctx) => Help(),
          Dashboard.routeName: (ctx) => Dashboard(),
          MyProfile.routeName: (ctx) => MyProfile(),
        },
      ),
    );
  }
}
