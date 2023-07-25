import 'package:api_demo/screen/add_member/add_member_screen.dart';
import 'package:api_demo/screen/all_news/all_news_screen.dart';
import 'package:api_demo/screen/create_news/create_news_screen.dart';
import 'package:api_demo/screen/member_list/member_list_screen.dart';
import 'package:api_demo/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            "Wel Come",
            style: TextStyle(
              fontFamily: Font.poppins,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(height: 20),
          const SizedBox(height: 50),
          CardText(
            text: "Member List",
            onTap: () => Get.to(() => MemberListScreen()),
          ),
          CardText(
            text: "Add Member",
            onTap: () => Get.to(() => AddMemberScreen()),
          ),
          CardText(
            text: "Create News",
            onTap: () => Get.to(() => CreateNewsScreen()),
          ),
          CardText(
            text: "All News",
            onTap: () => Get.to(() => AllNewsScreen()),
          ),
        ],
      ),
    );
  }
}

class CardText extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;

  const CardText({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text(
                text ?? "",
                style: TextStyle(fontSize: 18, fontFamily: Font.poppins),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}
