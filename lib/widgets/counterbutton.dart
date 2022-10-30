import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  int quantity;
  CounterButton(this.quantity);
  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   if (numOfProducts != 0) {
              //     numOfProducts = numOfProducts - 1;
              //   }
              // });
            },
            icon: Icon(Icons.remove,
                size: 20, color: Theme.of(context).primaryColor),
          ),
          Text(
            widget.quantity.toString(),
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
          ),
          IconButton(
            onPressed: () {
              // setState(() {
              //   // numOfProducts = numOfProducts + 1;
              // });
            },
            icon: Icon(Icons.add,
                size: 20, color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
