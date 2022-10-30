import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/orders.dart' as ord;
import '../../models/categories_data.dart';
import 'components/order_details_dialog.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int randomNumber = Random().nextInt(7) + 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
        height: 150,
        child: ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text('Order No: ${widget.order.id}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Amount: \$${widget.order.amount}",
                      style: TextStyle(color: Colors.black)),
                  Text('Quantity: ${widget.order.products.length}',
                      style: TextStyle(color: Colors.black))
                ],
              ),
              Text(
                  'Placed On: ${DateFormat('MMM dd, yyyy hh:mm aaa').format(widget.order.dateTime)}'),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return OrderDetailsDialog(widget.order);
                            });
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(fontSize: 17),
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Text('Delivered',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
        ));
  }
}
