import 'package:almond/providers/formula.dart';
import 'package:almond/widgets/formula_card_back.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FormulaCard extends StatefulWidget {
  final TeXViewRenderingEngine renderingEngine;
  final Formula formula;

  // final Formula formula = Formula(
  //     id: 123,
  //     name: 'Union',
  //     lhs: r"""
  //    When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
  //    $$x = ?$$<br>""",
  //     fullFormula: r"""
  //    When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
  //    $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br>""",
  //     topicId: 1);

  FormulaCard(
      {this.renderingEngine = const TeXViewRenderingEngine.katex(),
      this.formula});

  static TeXViewWidget _teXViewWidget(String body) {
    return TeXViewColumn(
        style: TeXViewStyle(
          margin: TeXViewMargin.all(10),
          padding: TeXViewPadding.all(10),
          // borderRadius: TeXViewBorderRadius.all(10),
          // border: TeXViewBorder.all(
          //   TeXViewBorderDecoration(
          //       borderWidth: 2,
          //       borderStyle: TeXViewBorderStyle.Groove,
          //       borderColor: Colors.green),
          // ),
        ),
        children: [
          TeXViewDocument(body,
              style: TeXViewStyle(margin: TeXViewMargin.only(top: 10)))
        ]);
  }

  @override
  _FormulaCardState createState() => _FormulaCardState(formula);
}

class _FormulaCardState extends State<FormulaCard> {
  Formula formula;
  _FormulaCardState(this.formula);
  bool showAns = false;
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(5),
              ),
            ),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 100.0,
                      height: 40.0,
                      child: const Card(
                        //green[200]
                        color: const Color(0xffA5D6A7),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          // 2E7D32 green[800], 388E3C green[700]
                          child: Text(
                            'PERFECT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xff388E3C),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        elevation: 0.0,
                      ),
                    )),
                Text(
                  'Formula 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                TeXView(
                  renderingEngine: widget.renderingEngine,
                  child: TeXViewColumn(children: [
                    showAns
                        ? FormulaCard._teXViewWidget(formula.fullFormula)
                        : FormulaCard._teXViewWidget(formula.lhs)
                  ]),
                  // style: TeXViewStyle(
                  //   margin: TeXViewMargin.all(10),
                  //   elevation: 10,
                  //   borderRadius: TeXViewBorderRadius.all(25),
                  //   border: TeXViewBorder.all(
                  //     TeXViewBorderDecoration(
                  //         borderColor: Colors.blue,
                  //         borderStyle: TeXViewBorderStyle.Solid,
                  //         borderWidth: 5),
                  //   ),
                  //   backgroundColor: Colors.white,
                  // ),
                ),
              ],
            ),
          ),
          showAns
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green[100],
                  child: FlatButton(
                    child: Text(
                      'I know the answer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              : Container(),
          showAns
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red[100],
                  child: FlatButton(
                    child: Text(
                      'I didn\'t know the answer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              : Container(),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5),
              ),
            ),
            child: showAns
                ? Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Tap to see further explaination",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : FlatButton(
                    child: Text(
                      'Tap to see the answer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        showAns = true;
                      });
                    },
                  ),
          ),
        ],
      ),
      back: FormulaCardBack(),
    );
  }
}
