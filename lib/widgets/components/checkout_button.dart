import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';

class CheckOutButton extends StatefulWidget {
  final Cart cart;
  CheckOutButton({required this.cart});

  @override
  State<CheckOutButton> createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 172, 229, 223),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${widget.cart.totalAmount}/-',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(40)),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 8,
                    shadowColor: Theme.of(context).primaryColor,
                    primary: Theme.of(context).primaryColor,
                    // onPrimary: Colors.white ,
                    // animationDuration: Duration(milliseconds: 1000),
                    // onSurface: Colors.white
                  ),
                  onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
                      ? () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('No items in the cart!'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                                textColor: Colors.teal,
                                label: 'DISMISS',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                }),
                          ));
                        }
                      : () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await Provider.of<Orders>(context, listen: false)
                              .addOrder(widget.cart.items.values.toList(),
                                  widget.cart.totalAmount);
                          setState(() {
                            _isLoading = false;
                          });
                          widget.cart.clear();
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              'Thank You For Shopping! ☺',
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(seconds: 2),
                          ));
                        },
                  icon: const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: const Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
