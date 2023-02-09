import 'dart:convert';

import 'package:hello_world/bo/product.dart';
import 'package:http/http.dart';

class OpenfactfoodAdapter{

  static List<Product> responseToList(Response response) {
    List<Product> products = [];
    List<dynamic> json = jsonDecode(response.body)["products"];

    json.forEach((v) {
      products.add(Product.fromOffJson(v));
    });

    return products;
  }

}