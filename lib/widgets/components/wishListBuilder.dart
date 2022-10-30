import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../wishlist_tile.dart';

class WishListBuilder extends StatelessWidget {
  const WishListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).favorites;

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: ((context, index) {
        return ChangeNotifierProvider.value(
            value: products[index], child: WishListTile());
      }),
    );
  }
}
