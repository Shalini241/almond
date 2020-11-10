import 'package:flutter/material.dart';

class Subject with ChangeNotifier {
  final int id;
  final String subjectName;
  final int classId;

  Subject({
    this.id,
    this.subjectName,
    this.classId,
  });
}
