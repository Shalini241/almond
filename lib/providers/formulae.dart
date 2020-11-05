import 'dart:convert';
import 'package:almond/providers/formula.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Formulae with ChangeNotifier {
  List<Formula> _formualeList = [];

  List<Formula> get formulaeList {
    return [..._formualeList];
  }

  Formulae(this._formualeList);

  Future<void> getAllFormulae() async {
    const url = "http://192.168.1.141:3000/allformulae";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      //final List<Formula> loadedFormulae = [];
      if (data == null) return;
      print(data);
      //notifyListeners();
    } catch (error) {}
  }
}
