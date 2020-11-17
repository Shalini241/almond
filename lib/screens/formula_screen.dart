import 'package:almond/providers/formulae.dart';
import 'package:almond/widgets/formula_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class FormulaScreen extends StatefulWidget {
  static final routeName = '/topic_card';

  @override
  _FormulaScreenState createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen> {
  Future _formulaFuture;

  @override
  Widget build(BuildContext context) {
    final topicId = ModalRoute.of(context).settings.arguments as int;
    _formulaFuture = Provider.of<Formulae>(context, listen: false)
        .getFormulaForTopic(topicId);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Chapter 1'),
        ),
        elevation: 0.0,
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            FutureBuilder(
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
                    return Consumer<Formulae>(
                      builder: (ctx, formulas, child) => FormulaCard(
                        formula: formulas.formulaeList[0],
                      ),
                    );
                  }
                }
              },
              future: _formulaFuture,
            ),
            //FormulaCard(),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Yay! I have done it',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 2),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                percent: 0.6,
                progressColor: Colors.green[800],
                backgroundColor: Colors.grey[200],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Reviewing it',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 2),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                percent: 0.3,
                progressColor: Colors.orange[400],
                backgroundColor: Colors.grey[200],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Learning it',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 2),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                percent: 0.4,
                progressColor: Colors.red,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
