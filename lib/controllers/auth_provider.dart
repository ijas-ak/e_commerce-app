// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:e_commerce_app/view/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth with ChangeNotifier {
  List<User> users = [];

  Future getUsers(User user) async {
    users = await ApiService().authentication(user);
    notifyListeners();
  }

  void login(String name, String password, BuildContext context) async {
    for (var user in users) {
      if (name == user.username && password == user.password) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('logged', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage()),
        );
        return;
      }
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Invalid username or password")));
  }

  void signIn(User user) async {
    await ApiService().addingUsers(user);
  }
}
