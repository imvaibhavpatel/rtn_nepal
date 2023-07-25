import 'package:api_demo/model/news_update_model.dart';
import 'package:api_demo/model/user_birthdata_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<News> newsUpdate = <News>[].obs;
  RxList<UserBirthData> userBirthData = <UserBirthData>[].obs;

  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  RxBool viewAll = false.obs;
  final box = GetStorage();

  getNewsUpdate() async {
    isLoading.value = true;
    try {
      final token = await box.read("token");
      final response = await http.post(
          Uri.parse(
              "https://dummymomo.rtn.org.np/api/v1/dashboard/latest_news"),
          body: {
            "token": token,
            "type": "1",
            "area_code": '',
            "table_id": '',
          });
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        newsUpdate.value = newsUpdateModelFromJson(response.body).data!;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  getUpcomingBirthday() async {
    isLoading.value = true;
    try {
      final token = box.read("token");
      final response = await http.post(
          Uri.parse(
              "https://dummymomo.rtn.org.np/api/v1/dashboard/upcoming_birthday"),
          body: {
            "token": token,
            "type": "1",
            "area_code": '',
            "table_id": '',
          });
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        userBirthData.value =
            upcomingBirthdataModelFromJson(response.body).birthData!;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUpcomingBirthday();
    getNewsUpdate();
  }
}
