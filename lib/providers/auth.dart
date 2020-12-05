import 'package:almond/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  bool _loginStatus;

  bool get isAuth {
    return loginStatus != null;
  }

  bool get loginStatus {
    if (_loginStatus != null) {
      return _loginStatus;
    }
    return null;
  }

  Future<void> signUp(User user) async {
    const url = 'http://192.168.1.141:3000/user/signup';
    var reqBody = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'password': user.password,
    };
    try {
      final response = await http.post(
        url,
        body: reqBody,
      );
      final responseData = json.decode(response.body);

      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loginStatus', true);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    const url = 'http://192.168.1.141:3000/user/signin';
    var reqBody = {'email': email, 'password': password};

    try {
      final response = await http.post(
        url,
        body: reqBody,
      );
      final responseData = json.decode(response.body);

      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loginStatus', true);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('loginStatus')) {
      return false;
    }
    final bool extractedStatus = prefs.getBool('loginStatus');
    _loginStatus = extractedStatus;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _loginStatus = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('loginStatus');
  }
}
