import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';

class BackGroundBlur extends StatelessWidget {
  const BackGroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return DropShadowImage(
      blurRadius: 15,
      image: Image.asset(
        "assets/images/login_bg.png",
        height: 0,
      ),
    );
  }
}
