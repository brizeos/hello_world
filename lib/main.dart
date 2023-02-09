import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/service/product_adapter.dart';
import 'package:http/http.dart';

import 'fragments/list_product_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://fakestoreapi.com/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FutureBuilder<Response>(
          future: get(Uri.parse(url)),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data != null){
              return ListProductsWidget(
                  ProductAdapter.responseToList(snapshot.data!)
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
