import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/bo/product.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/service/openfactfood_service.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductPage extends StatelessWidget {
  final int id;

  const ProductPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(title: const Text("Page produit")),
        body: FutureBuilder<Product>(
            future: OpenfactfoodService.getProductByISBN("3244081500005"),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                Product product = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Row(children: [
                        Image.network(
                          product.images![0].url!,
                        ),
                        Text(
                          product.productName!,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ]),
                      Text(product.categories!),
                      Text(product.origins!, style: Theme.of(context).textTheme.headlineLarge,),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text("Une erreur s'est produite.");
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              }
            })

        // OpenfactfoodService.getProduct("3244081500005"),

        );
  }
}
