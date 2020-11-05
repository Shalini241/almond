import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Topics with ChangeNotifier {
  List<String> _topicList = [];

  List<String> get topicList {
    return [..._topicList];
  }

  Future<void> getAllTopic() async {
    const url = "http://192.168.1.141:3000/home/topics";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      _topicList = [...data['topic']];
      notifyListeners();
    } catch (error) {}
  }
}
