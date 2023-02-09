import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/product.dart';
import 'package:hello_world/pages/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(title: "Flutter App"),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) => ProductPage(int.parse(state.params["id"]!)),
      ),
    ],
  );


}
