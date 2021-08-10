// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    required this.id,
    required this.name,
    required this.count,
    required this.images,
    required this.price,
    required this.articul,
  });

  int id;
  String name;
  int count;
  List<String> images;
  int price;
  String articul;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    name: json["name"],
    count: json["count"],
    images: List<String>.from(json["images"].map((x) => x)),
    price: json["price"],
    articul: json["articul"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "count": count,
    "images": List<dynamic>.from(images.map((x) => x)),
    "price": price,
    "articul": articul,
  };
}
