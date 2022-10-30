import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';
import '../../providers/cart.dart';
import '../../providers/product.dart';
import '../../providers/products.dart';

class AddToCart extends StatelessWidget {
  String? productID;
  AddToCart(String productID);

  @override
  Widget build(BuildContext context) {
    print(productID);
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productID!);
    print('loadedProduct: $loadedProduct');
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 9,
                shadowColor: Colors.grey[400],
                fixedSize: const Size(double.maxFinite, 50),
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white,
                animationDuration: Duration(milliseconds: 1000),
                onSurface: Colors.white),
            onPressed: () {
              cart.addItem(loadedProduct.id!, loadedProduct.price!,
                  loadedProduct.title!, loadedProduct.imageUrl!);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Added to cart!'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                    textColor: Colors.teal,
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id!);
                    }),
              ));
            },
            icon: const Icon(Icons.shopify_outlined),
            label: const Text('Add To Bag')),
      ),
    );
  }
}

// Widget addToCart(BuildContext context) {
//   final product = Provider.of<Product>(context, listen: false);
//     final cart = Provider.of<Cart>(context, listen: false);
//     final authData = Provider.of<Auth>(context, listen: false);
//   return Positioned(
//     bottom: 20,
//     left: 20,
//     right: 20,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//               elevation: 9,
//               shadowColor: Colors.grey[400],
//               fixedSize: const Size(double.maxFinite, 50),
//               primary: Theme.of(context).primaryColor,
//               onPrimary: Colors.white,
//               animationDuration: Duration(milliseconds: 1000),
//               onSurface: Colors.white),
//           onPressed: () {
//                 cart.addItem(product.id, product.price, product.title);
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: const Text('Added to cart!'),
//                   duration: const Duration(seconds: 2),
//                   action: SnackBarAction(
//                       textColor: Colors.teal,
//                       label: 'UNDO',
//                       onPressed: () {
//                         cart.removeSingleItem(product.id);
//                       }),
//                 ));
//               },
//           icon: const Icon(Icons.shopify_outlined),
//           label: const Text('Add To Bag')),
//     ),
//   );
// }
