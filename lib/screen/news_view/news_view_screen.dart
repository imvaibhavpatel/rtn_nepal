import 'package:api_demo/screen/create_news/create_news_screen.dart';
import 'package:api_demo/screen/news_view/view_controller.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/common_app_bar.dart';
import 'package:api_demo/utils/font.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsViewScreen extends StatelessWidget {
  NewsViewScreen({Key? key}) : super(key: key);

  final ViewController viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScreenBackGround(),
          Column(
            children: [
              const BackGroundBlur(),
              const CommonAppBar(title: "VIEW NEWS"),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(height: 20),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 22),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 20,
                              ),
                              color: Colors.orange,
                              width: double.infinity,
                              child: Text(
                                viewController.newsDetails.value.title ?? "",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: Font.poppins,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      viewController.deleteNews(
                                        newsId: viewController
                                            .newsDetails.value.id,
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.orange,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  GestureDetector(
                                    onTap: () => Get.to(
                                      () => CreateNewsScreen(),
                                      arguments: [
                                        viewController.newsDetails.value,
                                        true,
                                      ],
                                    ),
                                    child: const CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.orange,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Image.network(
                            viewController.newsDetails.value.banner
                                .toString(),
                            height: 200,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.network(
                                "https://cdn.wpbeginner.com/wp-content/uploads/2016/03/uploadfailed.jpg",
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            viewController.newsDetails.value.description ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
