import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingBar(BuildContext context, double ratings) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RatingBar.builder(
          glowColor: Colors.amber[200],
          updateOnDrag: true,
          itemSize: 22,
          minRating: 0,
          itemBuilder: ((context, index) => Icon(
                Icons.star_rounded,
                color: Colors.amber,
              )),
          onRatingUpdate: (rating) {
            ratings = rating;
          }),
      Text(
        " (132 Reviews)",
        style: TextStyle(
            color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ],
  );
}
