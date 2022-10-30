import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/components/appBars.dart';

import '../widgets/order_tile.dart';

class MyOrders extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  // int randomNumber = Random().nextInt(4) + 2;
  Future? _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    print(_ordersFuture);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        orderAppBar(context),
        SliverToBoxAdapter(
            child: FutureBuilder(
                future: _ordersFuture,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        )));
                  } else {
                    if (snapshot.error != null) {
                      print("Error: ${snapshot.error}");
                      return Center(child: Text('An error occurred'));
                    } else {
                      return Consumer<Orders>(
                        builder: (context, orderData, child) =>
                            ListView.builder(
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orderData.orders.length,
                          itemBuilder: ((context, index) {
                            return OrderItem(orderData.orders[index]);
                          }),
                        ),
                      );
                    }
                  }
                })))
      ],
    ));
  }
}
