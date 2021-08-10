// To parse this JSON data, do
//
//     final popularCategories = popularCategoriesFromJson(jsonString);

import 'dart:convert';

List<PopularCategories> popularCategoriesFromJson(String str) => List<PopularCategories>.from(json.decode(str).map((x) => PopularCategories.fromJson(x)));

String popularCategoriesToJson(List<PopularCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularCategories {
  PopularCategories({
    required this.name,
    required this.img,
  });
  String name;
  String img;

  factory PopularCategories.fromJson(Map<String, dynamic> json) => PopularCategories(
    name: json["name"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "img": img,
  };
}
