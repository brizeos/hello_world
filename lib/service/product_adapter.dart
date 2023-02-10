import 'dart:convert';

import 'package:hello_world/bo/product.dart';
import 'package:http/http.dart';

class ProductAdapter{

  static List<ProductCustom> responseToList(Response response) {
    List<ProductCustom> products = [];
    List<dynamic> json = jsonDecode(response.body);

    json.forEach((v) {
      products.add(ProductCustom.fromJson(v));
    });

    return products;
  }

  static ProductCustom responseToInstance(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return ProductCustom.fromOffJson(json);
  }

}