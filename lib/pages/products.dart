import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/service/openfactfood_service.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String url = "https://fakestoreapi.com/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: OpenfactfoodService.getProductByISBN("3263859883713")


        child: FutureBuilder<Response>(
          future: get(Uri.parse(url)),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data != null){
              return ListProductsWidget(
                  ProductAdapter.responseToList(snapshot.data!)
              );
            }else if(snapshot.hasError){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('this'),
                duration: Duration(microseconds: 500),
              ));
              return Text("Une erreur s'est produite.");
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
