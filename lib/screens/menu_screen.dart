import 'package:flutter/material.dart';

import '../widgets/menu_avatar.dart';

class ItemMenu {
  final String title;
  final IconData icon;

  const ItemMenu({required this.icon, required this.title});
}

class MenuItems {
  static const profile = ItemMenu(icon: Icons.person, title: 'Profile');
  static const categories =
      ItemMenu(icon: Icons.menu_rounded, title: 'Categories');
  static const favorites = ItemMenu(icon: Icons.favorite, title: 'Favorites');
  static const cart =
      ItemMenu(icon: Icons.shopping_cart_outlined, title: 'Cart');
  static const orders = ItemMenu(icon: Icons.shopify, title: 'My Orders');
  static const logout = ItemMenu(icon: Icons.logout, title: 'Logout');

  static const all = <ItemMenu>[
    profile,
    categories,
    favorites,
    cart,
    orders,
    logout
  ];
}

class MenuScreen extends StatelessWidget {
  final ItemMenu currentItem;
  final ValueChanged<ItemMenu> onSelectedItem;

  const MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  Widget buildMenuItem(ItemMenu item) => ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        selectedTileColor: Colors.white70,
        selectedColor: Colors.white,
        selected: currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(
          item.icon,
          color: Colors.white,
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () => onSelectedItem(item),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuAvatar(),
          ...MenuItems.all.map(buildMenuItem).toList(),
          const Spacer(flex: 20),
        ],
      )),
    );
  }
}
