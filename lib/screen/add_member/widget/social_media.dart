import 'package:api_demo/screen/add_member/add_member_controller.dart';
import 'package:api_demo/screen/add_member/widget/common_title.dart';
import 'package:api_demo/screen/add_member/widget/text_field.dart';
import 'package:api_demo/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialMedial extends StatelessWidget {
  SocialMedial({Key? key}) : super(key: key);

  final AddMemberController addMemberController =
      Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const CommonTitle(text: "Website"),
              const TextFieldCommon(hintText: "Enter your website URL"),
              const CommonTitle(text: "Facebook Profile Link"),
              const TextFieldCommon(
                  hintText: "Enter your facebook profile link URL"),
              const CommonTitle(text: "Twitter profile Link"),
              const TextFieldCommon(
                  hintText: "Enter your twitter profile link URL"),
              const CommonTitle(text: "Instagram Profile Link"),
              const TextFieldCommon(
                  hintText: "Enter your instagram profile link URL"),
              const CommonTitle(text: "LinkedIn Profile link"),
              const TextFieldCommon(
                  hintText: "Enter your linkedIn profile link URL"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonButton(
                    text: "BACK",
                    onTap: () {
                      addMemberController.currentPage.value = 0;
                    },
                    width: Get.width * 0.30,
                  ),
                  CommonButton(
                    text: "NEXT",
                    onTap: () {
                      addMemberController.currentPage.value = 2;
                    },
                    width: Get.width * 0.30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
