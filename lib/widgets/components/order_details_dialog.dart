import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' as ord;

import '../../models/categories_data.dart';
import '../../providers/orders.dart';

class OrderDetailsDialog extends StatefulWidget {
  ord.OrderItem order;
  OrderDetailsDialog(this.order);

  @override
  State<OrderDetailsDialog> createState() => _OrderDetailsDialogState();
}

class _OrderDetailsDialogState extends State<OrderDetailsDialog> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text('Order No: ${widget.order.id}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              height: 300,
              padding: EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 8),
              child: Theme(
                data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                        thumbColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor.withOpacity(0.5)))),
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 3,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 0.5,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                              width: 60,
                              child: Image.network(
                                '${widget.order.products[index].imageUrl}',
                                fit: BoxFit.cover,
                              )),
                          title: Text('${widget.order.products[index].title}'),
                          subtitle:
                              Text('\$${widget.order.products[index].price}'),
                          trailing: Text(
                              'x ${widget.order.products[index].quantity}'),
                        );
                      },
                      itemCount: widget.order.products.length,
                    ),
                  ),
                ),
              )),
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Placed On: ${DateFormat('MMM dd, yyyy hh:mm aaa').format(widget.order.dateTime)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text('Status: ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    Text('Delivered',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                RichText(
                    text: TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        children: [
                      TextSpan(
                        text:
                            'R-17 Row 8, NCEH Society, Gulshan-e-Iqbal Block 10-A. Karachi',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[600]),
                      )
                    ]))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Go Back',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Provider.of<Orders>(context, listen: false)
                        .addOrder(widget.order.products, widget.order.amount);
                    setState(() {
                      _isLoading = false;
                    });

                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Thank You For Shopping! ☺',
                        textAlign: TextAlign.center,
                      ),
                      duration: const Duration(seconds: 2),
                    ));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Reorder',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget orderDetailsDialog(BuildContext context, ord.OrderItem order) {
//   return
// }


// Widget orderDetailsDialog(BuildContext context, ord.OrderItem order) {
//   return Dialog(
//     insetPadding: EdgeInsets.all(20),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: Text('Order No: ${order.id}',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//         ),
//         Container(
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             decoration: BoxDecoration(
//                 border:
//                     Border.all(color: Theme.of(context).primaryColor, width: 2),
//                 borderRadius: BorderRadius.circular(15)),
//             height: 300,
//             padding: EdgeInsets.only(left: 10, right: 5, top: 8, bottom: 8),
//             child: Theme(
//               data: Theme.of(context).copyWith(
//                   scrollbarTheme: ScrollbarThemeData(
//                       thumbColor: MaterialStateProperty.all(
//                           Theme.of(context).primaryColor.withOpacity(0.5)))),
//               child: Scrollbar(
//                 thumbVisibility: true,
//                 thickness: 3,
//                 child: Container(
//                   margin: EdgeInsets.only(right: 15),
//                   child: ListView.separated(
//                     separatorBuilder: (context, index) => Divider(
//                       color: Theme.of(context).primaryColor,
//                       thickness: 0.5,
//                     ),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         leading: Container(
//                             width: 60,
//                             child: Image.network(
//                               '${order.products[index].imageUrl}',
//                               fit: BoxFit.cover,
//                             )),
//                         title: Text('${order.products[index].title}'),
//                         subtitle: Text('\$${order.products[index].price}'),
//                         trailing: Text('x ${order.products[index].quantity}'),
//                       );
//                     },
//                     itemCount: order.products.length,
//                   ),
//                 ),
//               ),
//             )),
//         Container(
//           height: 80,
//           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Placed On: ${DateFormat('MMM dd, yyyy hh:mm aaa').format(order.dateTime)}',
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//               ),
//               Row(
//                 children: [
//                   Text('Status: ',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
//                   Text('Delivered',
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500))
//                 ],
//               ),
//               RichText(
//                   text: TextSpan(
//                       text: 'Location: ',
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black),
//                       children: [
//                     TextSpan(
//                       text:
//                           'R-17 Row 8, NCEH Society, Gulshan-e-Iqbal Block 10-A. Karachi',
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FontStyle.italic,
//                           color: Colors.grey[600]),
//                     )
//                   ]))
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   'Go Back',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 style: TextButton.styleFrom(
//                     primary: Theme.of(context).primaryColor),
//               ),
//               TextButton(
//                 onPressed: () async {
//                   setState(() {
//                             _isLoading = true;
//                           });
//                           await Provider.of<Orders>(context, listen: false)
//                               .addOrder(order.products,
//                                   order.amount);
//                         setState(() {
//                             _isLoading = false;
//                           });
                        
//                           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: const Text(
//                               'Thank You For Shopping! ☺',
//                               textAlign: TextAlign.center,
//                             ),
//                             duration: const Duration(seconds: 2),
//                           ));
//                           Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   'Reorder',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 style: TextButton.styleFrom(
//                     primary: Theme.of(context).primaryColor),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
