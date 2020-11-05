import 'package:almond/providers/topic.dart';
import 'package:almond/screens/dashboard.dart';
import 'package:almond/screens/formula_screen.dart';
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
        },
      ),
    );
  }
}
