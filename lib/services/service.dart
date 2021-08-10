import 'dart:convert';

import 'package:alexstore/models/cart.dart';
import 'package:alexstore/models/popularCategories.dart';
import 'package:alexstore/models/product.dart';
import 'package:http/http.dart' as http;
// import 'package:alexstore/models/menu.dart';

class Service {

  static const String urlMenu = 'http://www.json-generator.com/api/json/get/cfIJbUgIKq?indent=2';
  static const String product = 'http://www.json-generator.com/api/json/get/ceGJwjmKsy?indent=2';
  static const String popularCategories = 'http://www.json-generator.com/api/json/get/cfmSmXQwXS?indent=2';

  // static Future<List<dynamic>> getMenu() async {
  //   try {
  //     final response = await http.get(Uri.parse(urlMenu));
  //     if(200 == response.statusCode) {
  //       final List<Menu> menu = menuFromJson(response.body);
  //       return menu;
  //     }
  //   }catch(e) {
  //     return <Menu>[];
  //   }
  //   return <Menu>[];
  // }
  static Future<List<Product>> getProduct() async {
    try {
      final response = await http.get(Uri.parse(product));
      if(200 == response.statusCode) {
        final List<Product> product = productFromJson(response.body);
        return product;
      } else {
        return <Product>[];
      }
    }catch(e) {
      return <Product>[];
    }
  }

  static Future<List<PopularCategories>> getPopularCategories() async {
    try {
      final response = await http.get(Uri.parse(popularCategories));
      if(200 == response.statusCode) {
        final List<PopularCategories> popularCategories = popularCategoriesFromJson(response.body);
        return popularCategories;
      }
    }catch(e) {
      return <PopularCategories>[];
    }
    return <PopularCategories>[];
  }
}
Future<List<dynamic>> getListData() async {
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Mastos/mockjson/menu'));
  List<dynamic> menu = json.decode(response.body);
  print(menu);
  return menu;
}
Future<Cart> deleteProduct(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://my-json-server.typicode.com/Mastos/mockjson/cart/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return Cart.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}
Future<List<Cart>> getCartProducts() async {
  final response = await http.get(
    Uri.parse('https://my-json-server.typicode.com/Mastos/mockjson/cart'),
  );
  if (response.statusCode == 200) {
    final List<Cart> cartProducts = cartFromJson(response.body);
    return cartProducts;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}