import 'package:api_demo/model/news_list_model.dart';
import 'package:api_demo/screen/all_news/all_news_controller.dart';
import 'package:api_demo/screen/all_news/all_news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CreateNewsController extends GetxController {
  GlobalKey<FormState> createNewsKey = GlobalKey<FormState>();

  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsDescriptionController = TextEditingController();
  ImagePicker picker = ImagePicker();

  RxString imagePath = "".obs;
  RxBool isCreateNews = false.obs;
  RxBool isEdit = false.obs;
  RxInt newsIndex = 0.obs;
  Rx<NewsData> newsEdit = NewsData().obs;

  getNewsImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  createNews() async {
    isCreateNews.value = true;
    try {
      var box = GetStorage();
      var token = box.read("token");
      var request = http.MultipartRequest('POST',
          Uri.parse('https://dummymomo.rtn.org.np/api/v1/news/add_news'));
      request.fields.addAll({
        'token': token,
        'title': newsTitleController.text,
        'description': newsDescriptionController.text,
      });
      request.files
          .add(await http.MultipartFile.fromPath('banner', imagePath.value));
      // request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        Get.off(() => AllNewsScreen());
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isCreateNews.value = false;
    }
  }

  editNews() async {
    isCreateNews.value = true;
    try {
      var box = GetStorage();
      var token = box.read("token");
      var request = http.MultipartRequest('POST',
          Uri.parse('https://dummymomo.rtn.org.np/api/v1/news/edit_news'));
      request.fields.addAll({
        'token': token,
        'news_id': newsEdit.value.id ?? "",
        'title': newsTitleController.text,
        'description': newsDescriptionController.text
      });

      if (imagePath.value.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath('banner', imagePath.value));
      }

      // request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Get.find<AllNewsController>().newsDataList[newsIndex.value] = NewsData(
            title: newsTitleController.text,
            banner: imagePath.value,
            description: newsDescriptionController.text,
            id: newsEdit.value.id,
            createdDatetime: newsEdit.value.createdDatetime,
            meetingDate: newsEdit.value.meetingDate,
            status: newsEdit.value.status);
        Get.back();
      } else {
        throw Exception("ERROR");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isCreateNews.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      newsEdit.value = Get.arguments[0];
      isEdit.value = Get.arguments[1];
      newsTitleController.text = newsEdit.value.title.toString();
      newsDescriptionController.text = newsEdit.value.description.toString();
      imagePath.value = newsEdit.value.banner.toString();
      newsIndex.value = Get.find<AllNewsController>().newsDataList.indexWhere(
          (element) => element.id!.contains(newsEdit.value.id ?? ""));
    }
  }
}
