import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'product_model.dart';
import 'package:http/http.dart' as http;

class ProviderClass extends ChangeNotifier {
  List<Products>? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await fetchProducts());
    loading = false;

    notifyListeners();
  }


  Future<List<Products>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final json = (response.body);
    List<dynamic> parseListJson = jsonDecode(json)['products'];
    // List parseListJson = jsonDecode(json);
    List<Products> productItem = List<Products>.from(
      parseListJson.map<Products>((dynamic i) => Products.fromJson(i))).toList();
    // List<Products>.from(
    //     parseListJson.map<List<Products>>((dynamic i) => Products.fromJson(i)));
    return productItem;
  } else {
    throw Exception("Failed to load products");
  }
}

}