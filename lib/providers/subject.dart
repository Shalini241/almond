import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  List<String> _subjectList = [];

  List<String> get subjectList {
    return [..._subjectList];
  }

  Future<void> getAllSubject() async {
    const url = "http://192.168.1.141:3000/home/subjects";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      _subjectList = [...data['subjects']];
      notifyListeners();
    } catch (error) {}
  }
}
