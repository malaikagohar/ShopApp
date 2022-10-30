import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget descCont(BuildContext context, String dummyDesc) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        ReadMoreText(
          dummyDesc,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          trimCollapsedText: 'Read More',
          moreStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
          trimExpandedText: 'Read Less',
          lessStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
          trimLines: 4,
          trimMode: TrimMode.Line,
        )
      ],
    ),
  );
}
