import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 50),
          height: 120,
          width: 120,
          alignment: Alignment.center,
          child: Text("M"),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2.5),
              borderRadius: BorderRadius.circular(80)),
        ),
        Positioned(
            bottom: 55,
            right: 0,
            child: CircleAvatar(
              child: Icon(
                Icons.camera_alt_rounded,
                size: 18,
                color: Colors.white,
              ),
              radius: 18,
              backgroundColor: Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
