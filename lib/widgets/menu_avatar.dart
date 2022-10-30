import 'package:flutter/material.dart';

class MenuAvatar extends StatelessWidget {
  const MenuAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            foregroundColor: Colors.grey[200],
            backgroundColor: Colors.grey,
            child: const Center(
                child: Text(
              'M',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
            )),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Malaika Gohar",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
