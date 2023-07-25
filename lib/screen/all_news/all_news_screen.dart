import 'package:api_demo/screen/all_news/all_news_controller.dart';
import 'package:api_demo/screen/all_news/widget/bottom_sheet.dart';
import 'package:api_demo/screen/news_view/news_view_screen.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/common_app_bar.dart';
import 'package:api_demo/utils/font.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllNewsScreen extends StatelessWidget {
  AllNewsScreen({Key? key}) : super(key: key);

  final AllNewsController allNewsController = Get.put(AllNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenBackGround(),
          Column(
            children: [
              const BackGroundBlur(),
              const CommonAppBar(title: "ALL NEWS"),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    backgroundColor: Colors.white,
                    FilterBottomSheet(),
                  );
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.filter_list_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => allNewsController.newsGetLoading.value
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
                                shrinkWrap: true,
                                controller: allNewsController.scrollController,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    allNewsController.newsDataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => NewsViewScreen(),
                                            transition: Transition.zoom,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            arguments: [
                                              allNewsController
                                                  .newsDataList[index],
                                              allNewsController
                                            ],
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 20,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const CircleAvatar(
                                                radius: 25,
                                                child: Icon(Icons.person),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        maxLines: 2,
                                                        allNewsController
                                                            .newsDataList[index]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              Font.poppins,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            "Event Date",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 20),
                                                          CommonText(
                                                              text: allNewsController
                                                                  .newsDataList[
                                                                      index]
                                                                  .meetingDate
                                                                  .toString()),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                "Created Date",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              CommonText(
                                                                  text: allNewsController
                                                                      .newsDataList[
                                                                          index]
                                                                      .createdDatetime
                                                                      .toString()),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                "News Status",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              CommonText(
                                                                text: allNewsController
                                                                            .newsDataList[
                                                                                index]
                                                                            .status ==
                                                                        "1"
                                                                    ? "Pending "
                                                                    : allNewsController.newsDataList[index].status ==
                                                                            "2"
                                                                        ? "Approved"
                                                                        : "Rejected",
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Row(
                                          children: [
                                            const Status(
                                              text: "Approve",
                                              color: Colors.green,
                                            ),
                                            const Status(
                                              text: "Rejected",
                                              color: Color(0XFFD50000),
                                            ),
                                            Status(
                                              text: "Delete",
                                              color: Colors.black,
                                              onTap: () {
                                                allNewsController.deleteNews(
                                                    newsId: allNewsController
                                                        .newsDataList[index]
                                                        .id);
                                                allNewsController.newsDataList
                                                    .removeAt(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            Obx(() => allNewsController.pageLoading.value
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
                                : const SizedBox()),
                          ],
                        ),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CommonText extends StatelessWidget {
  const CommonText({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
        fontFamily: Font.poppins,
      ),
    );
  }
}

class Status extends StatelessWidget {
  const Status({super.key, this.text, this.onTap, this.color});

  final String? text;
  final Color? color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text ?? "",
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
