import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Progress {
  final double topicCovered;
  final double subjectCovered;
  final double topicReviewing;
  final double topicLearning;
  final String tag;

  Progress({
    this.topicCovered,
    this.subjectCovered,
    this.topicLearning,
    this.topicReviewing,
    this.tag,
  });
}

class UserProgress extends ChangeNotifier {
  Progress _progress = Progress();

  Progress get progress {
    return Progress(
      subjectCovered: _progress.subjectCovered,
      topicCovered: _progress.topicCovered,
      topicLearning: _progress.topicLearning,
      topicReviewing: _progress.topicReviewing,
      tag: _progress.tag,
    );
  }

  void getUserProgress() async {
    var url = "http://192.168.1.9:3000/user/progress";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final Progress loadedProgress = Progress(
        topicCovered: data['topicCovered'],
        topicLearning: data['topicLearning'],
        topicReviewing: data['topicReviewing'],
        subjectCovered: data['subjectCovered'],
        tag: data['tag'],
      );

      _progress = loadedProgress;
      notifyListeners();
    } catch (error) {}
  }
}
