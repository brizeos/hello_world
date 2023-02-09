import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/fragments/list_product_widget.dart';
import 'package:hello_world/pages/product.dart';
import 'package:hello_world/pages/products.dart';
import 'package:hello_world/service/openfactfood_service.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://fakestoreapi.com/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:
        Center(child:
        const ProductsPage()
        )

    );
  }
}
