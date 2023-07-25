import 'package:api_demo/screen/drawer/drawer_screen.dart';
import 'package:api_demo/screen/home/home_controller.dart';
import 'package:api_demo/utils/back_ground_blur.dart';
import 'package:api_demo/utils/font.dart';
import 'package:api_demo/utils/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
       drawer: const DrawerScreen(),
      body: Stack(
        children: [
          const ScreenBackGround(),
          const BackGroundBlur(),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 50,
                    right: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeController.scaffoldKey.currentState!.openDrawer();
                        },
                        child: Image.asset(
                          "assets/icons/drawer_icon.png",
                          height: 15,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/profile_icon.png",
                        height: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (homeController.isLoading.value) const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ) else Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Upcoming Birthday",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Font.poppins,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(
                                () => homeController.userBirthData.isEmpty
                                    ? const Text(
                                        " Data not found",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: homeController.viewAll.value
                                            ? homeController
                                                .userBirthData.length
                                            : homeController
                                                        .userBirthData.length <
                                                    3
                                                ? homeController
                                                    .userBirthData.length
                                                : 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            color: Colors.transparent
                                                .withOpacity(0.5),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      homeController
                                                          .userBirthData[index]
                                                          .profileImage
                                                          .toString(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            homeController
                                                                .userBirthData[
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style:
                                                                 TextStyle(
                                                                  fontFamily: Font.poppins,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Text(
                                                            homeController
                                                                .userBirthData[
                                                                    index]
                                                                .tableAbbrName
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    homeController
                                                        .userBirthData[index]
                                                        .dob
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              homeController.viewAll.value
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        homeController.viewAll.value = true;
                                      },
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                              const SizedBox(height: 25),
                               Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "News Updates",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Font.poppins,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Obx(
                                () => ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: homeController.newsUpdate.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      color:
                                          Colors.transparent.withOpacity(0.5),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13,
                                                bottom: 5,
                                                top: 10,
                                                right: 10),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(radius: 25),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 13),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          homeController
                                                              .newsUpdate[index]
                                                              .title
                                                              .toString(),
                                                          style:
                                                               TextStyle(
                                                            color: Colors.white,
                                                                fontFamily: Font.poppins,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          homeController
                                                              .newsUpdate[index]
                                                              .createdDatetime
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: 15,
                                            ),
                                            child: Text(
                                              homeController
                                                  .newsUpdate[index].description
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Image.network(
                                            homeController
                                                .newsUpdate[index].banner
                                                .toString(),
                                            height: 200,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Image.network(
                                                "https://cdn.wpbeginner.com/wp-content/uploads/2016/03/uploadfailed.jpg",
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),

    );
  }
}
