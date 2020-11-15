import 'package:flutter/material.dart';

class FormulaCardBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Submit your answer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
      ],
    );
  }
}
