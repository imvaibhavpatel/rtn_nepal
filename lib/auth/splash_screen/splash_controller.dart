import 'dart:async';
import 'package:api_demo/auth/login_screen/login_screen.dart';
import 'package:api_demo/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  var box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Timer(
      const Duration(seconds: 3),
      () async {
        var token = await box.read("token");
        if (token.toString() != "null" && token.toString().isNotEmpty) {
          Get.to(() => HomeScreen());
        } else {
          Get.to(() => LoginScreen());
        }
      },
    );
  }
}
