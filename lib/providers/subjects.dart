import 'dart:convert';
import 'package:almond/providers/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  List<Subject> _subjectList = [];

  List<Subject> get subjectList {
    return [..._subjectList];
  }

  Future<void> getSubjects(int classId) async {
    var url = "http://192.168.1.9:3000/home/subjects?class=$classId";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final List<Subject> loadedSubjects = [];
      data['subjects'].forEach((subject) {
        loadedSubjects.add(Subject(
          id: subject['Subject']['id'],
          subjectName: subject['Subject']['subject'],
          classId: subject['clazz_id'],
        ));
      });
      _subjectList = loadedSubjects;
      notifyListeners();
    } catch (error) {}
  }
}
