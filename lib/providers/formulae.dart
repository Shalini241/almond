import 'dart:convert';
import 'package:almond/providers/formula.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Formulae with ChangeNotifier {
  List<Formula> _formualeList = [];

  List<Formula> get formulaeList {
    return [..._formualeList];
  }

  Formula _nextFormula;

  Formula get nextFormula {
    return _nextFormula;
  }

  Future<void> getFormulaForTopic(int topicId) async {
    var url = "http://192.168.1.141:3000/formulae/topic?topicId=$topicId";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final List<Formula> loadedFormulae = [];
      loadedFormulae.add(Formula(
        id: data['formulae']['id'],
        name: data['formulae']['name'],
        description: data['formulae']['description'],
        lhs: data['formulae']['lhs'],
        fullFormula: data['formulae']['fullFormula'],
        topicId: topicId,
      ));
      _formualeList = loadedFormulae;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> getNextFormula() async {
    var url = "http://192.168.1.141:3000/formulae/next";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data == null) return;
      final Formula formula = Formula(
        id: data['formulae']['id'],
        name: data['formulae']['name'],
        description: data['formulae']['description'],
        lhs: data['formulae']['lhs'],
        fullFormula: data['formulae']['fullFormula'],
        topicId: data['formulae']['TopicId'],
      );
      _nextFormula = formula;
      notifyListeners();
    } catch (error) {}
  }
}
