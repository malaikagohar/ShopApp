import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/configurations.dart';
import 'package:shop_app/models/categories_data.dart';
import 'package:shop_app/widgets/counterbutton.dart';

import '../providers/cart.dart';
import 'components/rating_bar.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  // ignore: use_key_in_widget_constructors
  CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        key: ValueKey(id),
        background: Container(
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Icon(
              Icons.delete,
              size: 30,
              color: Theme.of(context).primaryColor,
            )),
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: const Text("Are You Sure?"),
                    content: const Text(
                        "Do you want to remove the item from the cart?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ))
                    ],
                  ));
        },
        child: Container(
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
                      // '${tv[index]['image']}',
                      imageUrl,
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
                          // '${tv[index]['title']}',
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Container(
                      width: 180,
                      child: Text(
                        '$dummyDesc',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        // 'Price: \$${tv[index]['Amount']}',
                        price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ratingBar(context, 3.5), CounterButton(quantity)],
              )
            ],
          ),
        ));
  }
}
