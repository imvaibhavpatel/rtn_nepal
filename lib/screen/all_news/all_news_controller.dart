import 'package:api_demo/model/news_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AllNewsController extends GetxController {
  TextEditingController toDateController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxInt selected = 0.obs;
  RxInt id = 1.obs;
  RxInt page = 0.obs;
  RxString selectedStatus = "".obs;
  RxString newsId = "".obs;
  RxBool newsGetLoading = false.obs;
  RxBool pageLoading = false.obs;
  RxBool pageAvailableOrNot = true.obs;

  RxList<NewsData> newsDataList = <NewsData>[].obs;

  var box = GetStorage();

  fromDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyy').format(pickedDate);
      fromDateController.text = formattedDate.toString();
    }
  }

  toDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyy').format(pickedDate);
      toDateController.text = formattedDate.toString();
    }
  }

  getNewsList({
    required bool showPaginationLoader,
  }) async {
    try {
      if (showPaginationLoader == true) {
        pageLoading.value = true;
        newsGetLoading.value = false;
      } else {
        newsGetLoading.value = true;
        pageLoading.value = false;
      }
      var token = box.read("token");
      var response = await http.post(
          Uri.parse("https://dummymomo.rtn.org.np/api/v1/news/news_list"),
          body: {
            "token": token,
            "page": page.value.toString(),
            "title": titleController.text.toString().trim(),
            "from_date": fromDateController.text,
            "to_date": toDateController.text,
            "status": selectedStatus.value,
          });
      if (response.statusCode == 200) {
        newsDataList.value += newsListFromJson(response.body).data!;

        if (newsListFromJson(response.body).status.toString() == "0") {
          pageAvailableOrNot.value = false;
        }
      } else {
        throw Exception("ERROR");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      newsGetLoading.value = false;
      pageLoading.value = false;
    }
  }

  scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (pageAvailableOrNot.value) {
        page = page + 1;
        getNewsList(showPaginationLoader: true);
      }
    }
  }

  clearFilter() {
    titleController.clear();
    fromDateController.clear();
    toDateController.clear();
    selectedStatus.value = "";
    Get.back();
    getNewsList(showPaginationLoader: true);
  }

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
      } else {
        throw Exception("ERROR");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    scrollController.addListener(scrollListener);
    getNewsList(showPaginationLoader: false);
    deleteNews();
  }
}
