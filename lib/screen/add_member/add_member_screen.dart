import 'package:api_demo/screen/add_member/add_member_controller.dart';
import 'package:api_demo/screen/add_member/widget/basic_information.dart';
import 'package:api_demo/screen/add_member/widget/business_details.dart';
import 'package:api_demo/screen/add_member/widget/social_media.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/common_app_bar.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMemberScreen extends StatelessWidget {
  AddMemberScreen({Key? key}) : super(key: key);

  final AddMemberController addMemberController =
      Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenBackGround(),
          Obx(
            () => Column(
              children: [
                const BackGroundBlur(),
                const CommonAppBar(title: "ADD MEMBER"),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: addMemberController.currentPage.value == 0
                              ? Colors.orange
                              : addMemberController.currentPage.value > 0
                                  ? Colors.orange
                                  : Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: addMemberController.currentPage.value == 1
                              ? Colors.orange
                              : addMemberController.currentPage.value > 1
                                  ? Colors.orange
                                  : Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: addMemberController.currentPage.value == 2
                              ? Colors.orange
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Basic Information",
                        style: TextStyle(
                          fontSize: 14,
                          color: addMemberController.currentPage.value == 0
                              ? Colors.white
                              : addMemberController.currentPage.value > 0
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                      Text(
                        "Social Media",
                        style: TextStyle(
                          fontSize: 14,
                          color: addMemberController.currentPage.value == 1
                              ? Colors.white
                              : addMemberController.currentPage.value > 1
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                      Text(
                        "Business Details",
                        style: TextStyle(
                          fontSize: 14,
                          color: addMemberController.currentPage.value == 2
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                addMemberController.currentPage.value == 0
                    ? BasicInformation()
                    : addMemberController.currentPage.value == 1
                        ? SocialMedial()
                        : BusinessDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
