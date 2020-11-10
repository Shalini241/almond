import 'dart:convert';
import 'package:almond/providers/topic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Topics with ChangeNotifier {
  List<Topic> _topicList = [];

  List<Topic> get topicList {
    return [..._topicList];
  }

  Future<void> getTopic(int classId, int subjectId) async {
    var url =
        "http://192.168.1.141:3000/home/topics?class=$classId&subject=$subjectId";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final List<Topic> loadedTopics = [];
      data['topics'].forEach((topic) {
        loadedTopics.add(Topic(
          id: topic['id'],
          topicName: topic['topic'],
        ));
      });
      _topicList = loadedTopics;
      notifyListeners();
    } catch (error) {}
  }
}
