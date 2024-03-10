import 'package:meta/meta.dart';
import 'dart:convert';

class MenuModel {
  final int id;
  final String name;
  String? url;
  final String category;
  String? icon;
  final int urutan;
  final int aktif;

  MenuModel({
    required this.id,
    required this.name,
    this.url,
    required this.category,
    this.icon,
    required this.urutan,
    required this.aktif,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        category: json["category"],
        icon: json["icon"],
        urutan: json["urutan"],
        aktif: json["aktif"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "category": category,
        "icon": icon,
        "urutan": urutan,
        "aktif": aktif,
      };
}
