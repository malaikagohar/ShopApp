import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/wishlist_screen.dart';
import 'package:shop_app/screens/orders.dart';
import 'package:shop_app/screens/profile.dart';
import 'categories_screen.dart';
import 'menu_screen.dart';

class Menu extends StatefulWidget {
  static const routeName = '/menu';
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ItemMenu currentItem = MenuItems.categories;

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.profile:
        return Profile();
      case MenuItems.categories:
        return Categories();
      case MenuItems.favorites:
        return const WishList();
      case MenuItems.cart:
        return CartScreen();
      case MenuItems.orders:
        return MyOrders();
      case MenuItems.logout:
        return AuthScreen();
      default:
        return Categories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      dragOffset: 10,
      borderRadius: 50,
      angle: 0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      showShadow: true,
      menuBackgroundColor: Theme.of(context).primaryColor,
      drawerShadowsBackgroundColor: Colors.white,
      moveMenuScreen: true,
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                ZoomDrawer.of(context)!.close();

                currentItem = item;
              });
            });
      }),
      mainScreen: getScreen(),
    );
  }
}
