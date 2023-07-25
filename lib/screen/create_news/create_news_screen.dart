import 'package:api_demo/screen/add_member/widget/common_title.dart';
import 'package:api_demo/screen/add_member/widget/text_field.dart';
import 'package:api_demo/screen/create_news/create_news_controller.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/common_app_bar.dart';
import 'package:api_demo/utils/common_button.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewsScreen extends StatelessWidget {
  CreateNewsScreen({Key? key}) : super(key: key);

  final CreateNewsController createNewsController =
      Get.put(CreateNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenBackGround(),
          Column(
            children: [
              const BackGroundBlur(),
              const CommonAppBar(title: "CREATE NEWS"),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: createNewsController.createNewsKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const CommonTitle(text: "Title", validation: "*"),
                        TextFieldCommon(
                          hintText: 'Enter news title',
                          validation: (title) {
                            if (title!.isEmpty) {
                              return "Please enter title";
                            }
                            return null;
                          },
                          controller: createNewsController.newsTitleController,
                        ),
                        const CommonTitle(text: "Description", validation: "*"),
                        TextFieldCommon(
                          maxLine: 12,
                          hintText: 'Enter description',
                          validation: (description) {
                            if (description!.isEmpty) {
                              return "Please enter description";
                            }
                            return null;
                          },
                          controller:
                              createNewsController.newsDescriptionController,
                        ),
                        const CommonTitle(text: "Profile Image (Max: 2MB)"),
                        Obx(
                          () => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    createNewsController
                                            .imagePath.value.isNotEmpty
                                        ? createNewsController.imagePath
                                            .toString()
                                        : "Choose File",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    createNewsController.getNewsImage();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      "Chose File",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => createNewsController.isCreateNews.value
                              ? const CircularProgressIndicator()
                              : createNewsController.isEdit.value
                                  ? CommonButton(
                                      text: "save",
                                      width: Get.width * 0.30,
                                      onTap: ()  {
                                         createNewsController.editNews();
                                      },
                                    )
                                  : CommonButton(
                                      onTap: () {
                                        if (createNewsController
                                            .createNewsKey.currentState!
                                            .validate()) {
                                          createNewsController.createNews();
                                        }
                                      },
                                      text: "ADD",
                                      width: Get.width * 0.30,
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
