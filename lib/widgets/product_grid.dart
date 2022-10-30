import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(((context, index) {
        return ChangeNotifierProvider.value(
            value: products[index], child: ProductItem());
      }), childCount: products.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 4,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15),
    );
  }
}
