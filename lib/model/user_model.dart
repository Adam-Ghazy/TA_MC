import 'package:masbro_canteen/model/menu_model.dart';

class UserModel {
  final String nama;
  final String token;
  final List<String> permission;
  final List<MenuModel> menu;

  UserModel({
    required this.nama,
    required this.token,
    required this.permission,
    required this.menu,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        // url: json["url"],
        token: json["token"],
        menu: json['menu']
            .map<MenuModel>((menu) => MenuModel.fromJson(menu))
            .toList(),
        permission: json["permission"].cast<String>(),
      );
}
