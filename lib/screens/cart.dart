import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/components/appBars.dart';
import 'package:shop_app/widgets/components/checkout_button.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_tile.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            cartAppBar(context),
            SliverToBoxAdapter(
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart.itemCount,
                  itemBuilder: ((context, index) => CartItem(
                      cart.items.values.toList()[index].id,
                      cart.items.keys.toList()[index],
                      cart.items.values.toList()[index].price,
                      cart.items.values.toList()[index].quantity,
                      cart.items.values.toList()[index].title,
                      cart.items.values.toList()[index].imageUrl))),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 120))
          ],
        ),
        CheckOutButton(cart: cart)
      ]),
    );
  }
}
