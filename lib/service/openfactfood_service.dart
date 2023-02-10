import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/service/off_response_adapter.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';


class OpenfactfoodService {
  // static String baseUrl = "https://world.openfoodfacts.org/api/v2/";
  // static String searchUrl = "${baseUrl}search?code=";

  static Future<Product> getProductByISBN(String code) async {
    ProductQueryConfiguration query =
        ProductQueryConfiguration(code, version: ProductQueryVersion.v3);
    ProductResultV3 product = await OpenFoodAPIClient.getProductV3(query);
    return product.product!;
  }

  // static Future<Widget> getProduct(String code) async {
  //
  //   return FutureBuilder<ProductResultV3>(
  //       future: OpenfactfoodService.getProductByISBN(code),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData && snapshot.data != null && snapshot.data!.product is ProductResultV3 ) {
  //           ProductResultV3 product = snapshot.data!.product as ProductResultV3;
  //           return Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               children: [
  //                 Image.network(
  //                   product.product!.images![0].url!,
  //                   height: 300.0,
  //                 ),
  //                 Text(
  //                   product.product!.productName!,
  //                   style: Theme.of(context).textTheme.headlineMedium,
  //                 ),
  //                 // Text(product.description),
  //                 // Text(product.showPrice(), style: Theme.of(context).textTheme.displayMedium,),
  //               ],
  //             ),
  //           );
  //         } else if (snapshot.hasError) {
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             content: Text('Error'),
  //             duration: Duration(microseconds: 500),
  //           ));
  //           return const Text("Une erreur s'est produite.");
  //         } else {
  //           return const Center(child: CircularProgressIndicator(color: Colors.blue,));
  //         }
  //       });
  //
  // }

}
