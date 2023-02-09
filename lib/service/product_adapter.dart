import 'dart:convert';

import 'package:hello_world/bo/product.dart';
import 'package:http/http.dart';

class ProductAdapter{

  static List<Product> responseToList(Response response) {
    List<Product> products = [];
    List<dynamic> json = jsonDecode(response.body);

    json.forEach((v) {
      products.add(Product.fromJson(v));
    });

    return products;
  }

  static Product responseToInstance(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return Product.fromJson(json);
  }

}