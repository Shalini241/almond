import 'package:flutter/material.dart';

class Subject with ChangeNotifier {
  final int id;
  final String subjectName;

  Subject({
    this.id,
    this.subjectName,
  });
}
