import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/menu_widget.dart';

import '../../providers/cart.dart';
import '../../providers/product.dart';

// SliverAppBar homeAppBar(BuildContext context,) {
//   return SliverAppBar(
//     floating: true,
//     pinned: true,
//     elevation: 0,

//     backgroundColor: Colors.transparent,
//     actions: [
//       Consumer<Cart>(
//         builder: (_,cart,ch)=>Badge(child: ch!, value: cart.itemCount.toString()),
//         child: IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed(Categories.routeName);
//             },
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               size: 25,
//               color: Theme.of(context).primaryColor,
//             )),
//       ),
//       const SizedBox(
//         width: 10,
//       )
//     ],
//     leading:MenuWidget(),

//     );

// }

SliverAppBar catAppBar(BuildContext context, Product product) {
  return SliverAppBar(
    floating: true,
    pinned: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      Consumer<Cart>(
        builder: (_, cart, ch) =>
            Badge(child: ch!, value: cart.itemCount.toString()),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              color: Theme.of(context).primaryColor,
            )),
      ),
      const SizedBox(
        width: 10,
      )
    ],
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 23,
      ),
      color: Theme.of(context).primaryColor,
    ),
    expandedHeight: MediaQuery.of(context).size.height * 0.4,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 30),
        child: Hero(
          tag: product.id!,
          child: Image.network(
            product.imageUrl!,
            width: double.maxFinite,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}

SliverAppBar cartAppBar(BuildContext context) {
  return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: MenuWidget(),
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        padding: EdgeInsets.only(top: 90),
        margin: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "My Shopping Cart!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Happy Shopping! 😊",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ]),
      )));
}

SliverAppBar orderAppBar(BuildContext context) {
  return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: MenuWidget(),
      expandedHeight: MediaQuery.of(context).size.height * 0.15,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              padding: EdgeInsets.only(top: 80),
              margin: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.shopify_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "My Orders",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ))));
}

SliverAppBar favAppBar(BuildContext context) {
  return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: MenuWidget(),
      expandedHeight: MediaQuery.of(context).size.height * 0.18,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              padding: EdgeInsets.only(top: 80),
              margin: EdgeInsets.only(left: 12, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "My WishList",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ))));
}
