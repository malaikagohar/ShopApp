import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/counterbutton.dart';
import '../providers/auth.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../widgets/components/rating_bar.dart';
import '../widgets/fav_icon.dart';
import '../widgets/components/cart_button.dart';
import '../widgets/components/appBars.dart';
import '../widgets/components/desc_cont.dart';

class DescriptionScreen extends StatefulWidget {
  static const routeName = '/product-detail';
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  double rating = 0;
  String dummyDesc =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  int numOfProducts = 0;

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);

    final cart = Provider.of<Cart>(context, listen: false);
    final productID =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    bool isFavorite = productID['isFavorite'] as bool;

    print('productID: $productID');

    final loadedProduct = Provider.of<Products>(context, listen: false)
        .findById(productID['id']! as String);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              catAppBar(context, loadedProduct),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height * 0.3),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 0,
                          spreadRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loadedProduct.title!,
                          style: const TextStyle(
                              fontSize: 28,
                              fontFamily: 'ZillaSlab',
                              fontWeight: FontWeight.bold)),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Stock Availaible',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${loadedProduct.price}',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          CounterButton(0)
                        ],
                      ),
                      descCont(context, loadedProduct.description!),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ratingBar(context, rating),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Consumer<Product>(
                                builder: (context, product, _) {
                                  return IconButton(
                                    icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 25,
                                        color: Colors.white),
                                    onPressed: () {
                                      product.toggleFavoriteStatus(
                                          authData.token!, authData.userId!);
                                      loadedProduct.toggleFavoriteStatus(
                                          authData.token!, authData.userId!);
                                      isFavorite = !isFavorite;
                                      print(
                                          "loadedProduct: ${loadedProduct.isFavorite}");
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
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
                    print(cart.toString());
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Added to cart!'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                          textColor: Colors.teal,
                          label: 'UNDO',
                          onPressed: () {
                            cart.removeSingleItem(loadedProduct.id!);
                          }),
                    ));
                  },
                  icon: const Icon(Icons.shopify_outlined),
                  label: const Text('Add To Bag')),
            ),
          ),
        ],
      ),
    );
  }
}
