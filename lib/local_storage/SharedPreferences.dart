import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SaveLocally{

  static String userKey = 'user';

  Future<void> saveUser(LocalUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toJson()));
  }

  Future<LocalUser?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(userKey);
    if (user != null) {
      final Map<String, dynamic> userMap = jsonDecode(user);
      return LocalUser.fromJson(userMap);
    }
    return null;
  }

}