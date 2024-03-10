import 'package:flutter/material.dart';
import 'package:masbro_canteen/model/user_model.dart';
import 'package:masbro_canteen/service/auth_future.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      UserModel? user = await AuthFuture().login(email, password);
      _user = user;
      print(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
