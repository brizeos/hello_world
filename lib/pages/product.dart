import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/bo/product.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/service/openfactfood_service.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';

class ProductPage extends StatelessWidget {
  final int id;
  const ProductPage(this.id, {Key? key}) : super(key: key);

  final String url = "https://fakestoreapi.com/products/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page produit")),
      body: FutureBuilder<Response>(
          future: get(Uri.parse(url + id.toString())),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              Product product =
                  ProductAdapter.responseToInstance(snapshot.data!);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(
                      product.imageUrl,
                      height: 300.0,
                    ),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(product.description),
                    Text(product.showPrice(), style: Theme.of(context).textTheme.displayMedium,),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('this'),
                duration: Duration(microseconds: 500),
              ));
              return const Text("Une erreur s'est produite.");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
