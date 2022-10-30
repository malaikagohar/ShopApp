import 'package:flutter/material.dart';
import 'package:shop_app/widgets/profile_tile.dart';
import '../widgets/menu_widget.dart';
import '../widgets/profile_avatar.dart';

class Profile extends StatelessWidget {
  List profile = [
    ['Name', 'Malaika Gohar', Icons.person],
    ['Email', 'malaikagohar2003@gmail.com', Icons.alternate_email],
    ['Phone', '03353077951', Icons.phone_android_outlined],
    [
      'Address',
      'R-17, Row-8, NCEH Society, Gulshan-e-Eqbal Block 10-A, Karachi',
      Icons.location_on_outlined
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const MenuWidget()),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileAvatar(),
                Expanded(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 30),
                    itemCount: profile.length,
                    itemBuilder: ((context, index) => ProfileTile(
                        profile[index][0],
                        profile[index][1],
                        profile[index][2])),
                  ),
                )
              ]),
        ));
  }
}
