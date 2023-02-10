import 'dart:convert';
import 'dart:developer';
import 'dart:html';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


}
