import 'package:flutter/material.dart';

class Topic with ChangeNotifier {
  final int id;
  final String topicName;

  Topic({
    this.id,
    this.topicName,
  });
}
