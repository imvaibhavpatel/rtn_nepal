import 'package:api_demo/model/news_list_model.dart';
import 'package:api_demo/screen/all_news/all_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ViewController extends GetxController {

  Rx<NewsData> newsDetails = NewsData(

  ).obs;
  var box = GetStorage();

  deleteNews({String? newsId}) async {
    try {
      var token = box.read("token");
      var response = await http.post(
          Uri.parse("https://dummymomo.rtn.org.np/api/v1/news/delete_news"),
          body: {
            "token": token,
            "news_id": newsId.toString(),
          });
      if (response.statusCode == 200) {
        Get.find<AllNewsController>().newsDataList.remove(
            Get.find<AllNewsController>().newsDataList.firstWhere(
                (element) => element.id == newsDetails.value.id));

        Get.back();
      } else {
        throw Exception("ERROR");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      newsDetails.value = Get.arguments[0];
    }
  }
}
