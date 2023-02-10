import 'dart:convert';

import 'package:hello_world/bo/product.dart';
import 'package:http/http.dart';

class OpenfactfoodAdapter{

  static List<ProductCustom> responseToList(Response response) {
    List<ProductCustom> products = [];
    List<dynamic> json = jsonDecode(response.body)["products"];

    json.forEach((v) {
      products.add(ProductCustom.fromOffJson(v));
    });

    return products;
  }

}