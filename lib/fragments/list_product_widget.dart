
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/bo/product.dart';

class ListProductsWidget extends StatelessWidget {
  final List<Product> products;

  const ListProductsWidget(
      this.products, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(thickness: 4.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index].name),
        leading: Image.network(products[index].imageUrl, height: 80, width: 80,),
        subtitle: Text(products[index].description, maxLines: 3,),
        trailing: Text(products[index].showPrice()),
        onTap: () => context.go("/product/${products[index].id}"),
      ),
    );
  }



}
