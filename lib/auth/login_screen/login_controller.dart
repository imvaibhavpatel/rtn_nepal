import 'dart:convert';
import 'package:api_demo/screen/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  final box = GetStorage();

  userLogin() async {
    isLoading.value = true;
    try {
      final response = await http.post(
          Uri.parse("https://dummymomo.rtn.org.np/api/v1/account/rt_login"),
          body: {
            "email": emailController.text.toString(),
            "password": passwordController.text.toString(),
            "device_id": '1234',
            "device_type": '1234',
          });
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        box.write("token", jsonDecode(response.body)["data"]["token"]);
        Get.to(() => HomeScreen());
      } else {
        isLoading.value = true;
        throw Exception("error login failed");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
