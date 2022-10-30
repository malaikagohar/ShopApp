import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  String value;
  String title;
  IconData tileIcon;
  ProfileTile(this.title, this.value, this.tileIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: InkWell(
          radius: 15,
          child: ListTile(
              selectedTileColor: Colors.grey[350],
              onTap: () {},
              horizontalTitleGap: 0,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(tileIcon, color: Colors.teal[800], size: 25),
                ],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(fontSize: 15),
                  ),
                  Icon(
                    Icons.mode_edit_outline_outlined,
                    color: Colors.teal[800],
                    size: 25,
                  )
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5, right: 25),
                child: Text(
                  '$value',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              )),
        ),
      ),
    );
  }
}
