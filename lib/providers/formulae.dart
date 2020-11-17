import 'dart:convert';
import 'package:almond/providers/formula.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Formulae with ChangeNotifier {
  List<Formula> _formualeList = [];

  List<Formula> get formulaeList {
    return [..._formualeList];
  }

  Future<void> getFormulaForTopic(int topicId) async {
    var url = "http://192.168.1.141:3000/formulae/topic?topicId=$topicId";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final List<Formula> loadedFormulae = [];
      data['formulae'].forEach((formula) {
        loadedFormulae.add(Formula(
          id: formula['id'],
          name: formula['name'],
          description: formula['description'],
          lhs: formula['lhs'],
          fullFormula: formula['fullFormula'],
          topicId: topicId,
        ));
      });
      _formualeList = loadedFormulae;
      print(json.encode(_formualeList));
      notifyListeners();
    } catch (error) {}
  }
}
