import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:masbro_canteen/model/user_model.dart';
// import 'package:provider/provider.dart';
// import 'package:testgetdata/provider/user_provider.dart';

class AuthFuture {
  final url = "https://8413-103-24-58-34.ngrok-free.app/api";

  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$url/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(json['data']);
      print(user.menu.toString());
      return user;
    } else if (response.statusCode == 401) {
      final json = jsonDecode(response.body);
      String message = json['message'].toString();

      throw Exception(message);
    }
    return null;
  }
}
