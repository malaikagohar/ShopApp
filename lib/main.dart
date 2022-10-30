import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/screens/description_screen.dart';
import 'package:shop_app/screens/menu.dart';
import 'package:shop_app/screens/orders.dart';
import 'package:shop_app/screens/splash_screen.dart';

import 'edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
              create: (_) => Products(null, null, []),
              update: ((context, auth, previousProducts) => Products(
                  auth.token,
                  auth.userId,
                  previousProducts == null ? [] : previousProducts.items))),
          ChangeNotifierProvider(create: (_) => Cart()),
          ChangeNotifierProvider(
            create: (_) => Product(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
              create: (_) => Orders(null, null, []),
              update: (context, auth, previousOrders) => Orders(
                  auth.token,
                  auth.userId,
                  previousOrders == null ? [] : previousOrders.orders))
        ],
        child: Consumer<Auth>(
          builder: ((context, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colors.teal[500],
                ),
                home: auth.isAuth
                    ? Categories()
                    : FutureBuilder(
                        future: auth.tryAutoLogin(),
                        builder: (context, authResultSnapshot) =>
                            authResultSnapshot.connectionState ==
                                    ConnectionState.waiting
                                ? SplashScreen()
                                : AuthScreen(),
                      ),
                routes: {
                  // '/': (context) => SplashScreen(),
                  DescriptionScreen.routeName: ((context) =>
                      const DescriptionScreen()),
                  Categories.routeName: ((context) => Categories()),
                  Menu.routeName: ((context) => Menu()),

                  CartScreen.routeName: (context) => const CartScreen(),
                  MyOrders.routeName: (context) => MyOrders()
                },
              )),
        ));
  }
}
