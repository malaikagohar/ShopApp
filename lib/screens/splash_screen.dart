import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/auth_screen.dart';

import '../widgets/auth_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: false);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AuthScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      authBackground(),
      Center(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: ScaleTransition(
                scale: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset('assets/images/logo.png'),
                ))),
      ),
    ]));
  }
}
