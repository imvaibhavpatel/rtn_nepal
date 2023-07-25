import 'package:api_demo/screen/all_news/all_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  final AllNewsController allNewsController = Get.put(AllNewsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "FILTER",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close, size: 25),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Obx(
                () => Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width * 0.30,
                        color: Colors.grey.withOpacity(0.5),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                allNewsController.selected.value = 0;
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                color: allNewsController.selected.value == 0
                                    ? Colors.white
                                    : null,
                                child: const Center(
                                  child: Text(
                                    "Title",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                allNewsController.selected.value = 1;
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                color: allNewsController.selected.value == 1
                                    ? Colors.white
                                    : null,
                                child: const Center(
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                allNewsController.selected.value = 2;
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                color: allNewsController.selected.value == 2
                                    ? Colors.white
                                    : null,
                                child: const Center(
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        allNewsController.selected.value == 0
                            ? TextFormField(
                                maxLines: 6,
                                controller: allNewsController.titleController,
                                decoration: InputDecoration(
                                  hintText: "Enter title",
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              )
                            : allNewsController.selected.value == 1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Select Date Range"),
                                      const SizedBox(height: 5),
                                      TextFormField(
                                        readOnly: true,
                                        controller: allNewsController
                                            .fromDateController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "From",
                                          suffixIcon: const Icon(
                                            Icons.calendar_month,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onTap: () {
                                          allNewsController.fromDate();
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        readOnly: true,
                                        controller:
                                            allNewsController.toDateController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "To",
                                          suffixIcon: const Icon(
                                            Icons.calendar_month,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onTap: () {
                                          allNewsController.toDate();
                                        },
                                      ),
                                    ],
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17),
                                    child: Obx(
                                      () => Column(
                                        children: [
                                          RadioListTile(
                                            title: const Text(
                                              "Pending",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            activeColor: Colors.black,
                                            value: "Pending",
                                            groupValue: allNewsController
                                                .selectedStatus.value,
                                            onChanged: (value) {
                                              allNewsController.selectedStatus
                                                  .value = value.toString();
                                            },
                                          ),
                                          RadioListTile(
                                            title: const Text(
                                              "Approved",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            activeColor: Colors.black,
                                            value: "Approved",
                                            groupValue: allNewsController
                                                .selectedStatus.value,
                                            onChanged: (value) {
                                              allNewsController.selectedStatus
                                                  .value = value.toString();
                                            },
                                          ),
                                          RadioListTile(
                                            title: const Text(
                                              "Rejected",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            activeColor: Colors.black,
                                            value: "Rejected",
                                            groupValue: allNewsController
                                                .selectedStatus.value,
                                            onChanged: (value) {
                                              allNewsController.selectedStatus
                                                  .value = value.toString();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                allNewsController.clearFilter();
                allNewsController.page.value = 0;
                allNewsController.newsDataList.clear();
                allNewsController.getNewsList(showPaginationLoader: true);
              },
              child: Container(
                width: Get.width * 0.30,
                padding: const EdgeInsets.symmetric(vertical: 17),
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "CLEAR ALL",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  allNewsController.page.value = 0;
                  allNewsController.newsDataList.clear();
                  allNewsController.getNewsList(showPaginationLoader: true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  color: Colors.grey.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      "APPLY FILTER",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
