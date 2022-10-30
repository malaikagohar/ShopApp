import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/fav_icon.dart';
import '../configurations.dart';
import '../models/categories_data.dart';
import '../providers/auth.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'components/rating_bar.dart';

class WishListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 30),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(5, 10))
        ],
      ),
      height: 160,
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(top: 10, right: 15),
                height: 80,
                width: 100,
                child: Image.network(
                  '${product.imageUrl}',
                  fit: BoxFit.contain,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    width: 180,
                    child: Text(
                      '${product.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                Container(
                  width: 180,
                  child: Text(
                    '${product.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    'Price: \$${product.price}',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ratingBar(context, 3.5),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
            ],
          )
        ],
      ),
    );
  }
}
