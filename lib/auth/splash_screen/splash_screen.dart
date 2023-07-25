import 'package:api_demo/auth/splash_screen/splash_controller.dart';
import 'package:api_demo/utils/font.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         const ScreenBackGround(),
          Column(
            children: [
              SizedBox(height: Get.height * 0.40),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: DropShadowImage(
                      blurRadius: 10,
                      scale: 1.35,
                      offset: const Offset(0, 5),
                      image: Image.asset(
                        "assets/images/circle.png",
                        height: 200,
                      ),
                    ),
                  ),
                   Positioned(
                    top: 90,
                    left: 145,
                    child: Text(
                      "Wel come",
                      style: TextStyle(
                        fontFamily: Font.poppins,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
