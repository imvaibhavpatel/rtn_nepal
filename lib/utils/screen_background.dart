import 'package:flutter/material.dart';

class ScreenBackGround extends StatelessWidget {
  const ScreenBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/login_bg.png",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
