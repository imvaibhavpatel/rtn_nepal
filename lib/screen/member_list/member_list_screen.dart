import 'package:api_demo/screen/member_list/member_list_controller.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/common_app_bar.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberListScreen extends StatelessWidget {
  MemberListScreen({Key? key}) : super(key: key);

  final MemberListController memberListController =
      Get.put(MemberListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenBackGround(),
          Column(
            children: [
              const BackGroundBlur(),
              const CommonAppBar(title: "MEMBER LIST"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  cursorWidth: 0,
                  cursorHeight: 0,
                  controller: memberListController.searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent.withOpacity(0.9),
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusedBorder: InputBorder.none,
                    border: const OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onFieldSubmitted: (v) {
                    memberListController.page.value = 0;
                    memberListController.memberList.clear();
                    memberListController.getMemberList(
                        showPaginationLoader: true);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => memberListController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                controller:
                                    memberListController.scrollController,
                                itemCount:
                                    memberListController.memberList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                          top: 15,
                                          right: 10,
                                          bottom: 2,
                                          left: 50,
                                        ),
                                        padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 15,
                                          top: 15,
                                          bottom: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent
                                              .withOpacity(0.65),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Table Name",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              memberListController
                                                  .memberList[index].tableName
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            const Text(
                                              "Member Name",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              memberListController
                                                  .memberList[index].memberName
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 65,
                                        left: 20,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              memberListController
                                                  .memberList[index]
                                                  .profileImage
                                                  .toString(),
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Image.network(
                                                  "https://cdn-icons-png.flaticon.com/512/6522/6522516.png",
                                                  fit: BoxFit.contain,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            Obx(
                              () => memberListController.pageLoading.value
                                  ? Column(
                                      children: const [
                                        Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "loading",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    )
                                  : memberListController
                                              .pageAvailableOrNot.value ==
                                          false
                                      ? const Text(
                                          "No more data",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
