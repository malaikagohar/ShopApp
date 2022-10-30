import 'package:flutter/material.dart';

Container authBackground() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.luminosity)),
    ),
  );
}
