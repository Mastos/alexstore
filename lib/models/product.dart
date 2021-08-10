// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.available,
    this.index,
    this.amountOfRam,
    this.id,
    this.internalMemoryCapacity,
    this.name,
    this.isFavorite,
    this.picture,
    this.color,
    this.price,
    this.display,
    this.operatingSystem,
    this.displayResolution,
    this.address,
    this.articul,
    this.processor,
  });

  int ?available;
  int ?index;
  String ?amountOfRam;
  String ?id;
  String ?internalMemoryCapacity;
  String ?name;
  bool ?isFavorite;
  String ?picture;
  String ?color;
  String ?price;
  String ?display;
  String ?operatingSystem;
  String ?displayResolution;
  String ?address;
  int ?articul;
  String ?processor;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    available: json["available"],
    index: json["index"],
    amountOfRam: json["amountOfRAM"],
    id: json["_id"],
    internalMemoryCapacity: json["internalMemoryCapacity"],
    name: json["name"] as String,
    isFavorite: json["isFavorite"],
    picture: json["picture"],
    color: json["color"],
    price: json["price"],
    display: json["display"],
    operatingSystem: json["operatingSystem"],
    displayResolution: json["displayResolution"],
    address: json["address"],
    articul: json["articul"],
    processor: json["processor"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "index": index,
    "amountOfRAM": amountOfRam,
    "_id": id,
    "internalMemoryCapacity": internalMemoryCapacity,
    "name": name,
    "isFavorite": isFavorite,
    "picture": picture,
    "color": color,
    "price": price,
    "display": display,
    "operatingSystem": operatingSystem,
    "displayResolution": displayResolution,
    "address": address,
    "articul": articul,
    "processor": processor,
  };
}
