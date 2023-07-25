import 'package:api_demo/model/member_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MemberListController extends GetxController {

  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool pageLoading = false.obs;
  RxBool pageAvailableOrNot = true.obs;
  RxInt page = 0.obs;

  RxList<MemberDataList> memberList = <MemberDataList>[].obs;

  final box = GetStorage();

  getMemberList({required bool showPaginationLoader}) async {
    try {
      if (showPaginationLoader == true) {
        pageLoading.value = true;
        isLoading.value = false;
      } else {
        isLoading.value = true;
        pageLoading.value = false;
      }
      final token = box.read("token");
      final response = await http.post(
          Uri.parse("https://dummymomo.rtn.org.np/api/v1/member/member_list"),
          body: {
            "token": token,
            "page": page.value.toString(),
            "name": searchController.text.trim(),
            "email": "",
            "table_id": "",
            "from_dob": "",
            "to_dob": "",
            "from_doa": "",
            "to_doa": "",
            "status": "",
          });
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        memberList.value += memberListFromJson(response.body).data!;
        if (memberListFromJson(response.body).status.toString() == "0") {
          pageAvailableOrNot.value = false;
        }
      } else {
        throw Exception("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
      pageLoading.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    scrollController.addListener(scrollListener);
    getMemberList(showPaginationLoader: false);
  }

  scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (pageAvailableOrNot.value) {
        page = page + 1;
        getMemberList(showPaginationLoader: true);
      }
    }
  }
}
