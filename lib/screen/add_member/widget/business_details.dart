import 'package:api_demo/screen/add_member/add_member_controller.dart';
import 'package:api_demo/screen/add_member/widget/common_title.dart';
import 'package:api_demo/screen/add_member/widget/text_field.dart';
import 'package:api_demo/utils/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDetails extends StatelessWidget {
  BusinessDetails({Key? key}) : super(key: key);

  final AddMemberController addMemberController =
      Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: addMemberController.companyNameTextField.length,
                itemBuilder: (BuildContext context, int index) {
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonTitle(text: "Company Name"),
                                index == 0
                                    ? const SizedBox()
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          side: const BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                        onPressed: () {
                                          addMemberController
                                              .companyNameTextField
                                              .removeAt(index);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                      )
                              ],
                            ),
                            const SizedBox(height: 5),
                            TextFieldCommon(
                              hintText: "Enter your company name",
                              controller: addMemberController
                                  .companyNameTextField[index]
                                  .companyController,
                            ),
                            const SizedBox(height: 20),
                            const CommonTitle(text: "Designation"),
                            TextFieldCommon(
                              hintText: "Enter your designation in the company",
                              controller: addMemberController
                                  .companyNameTextField[index]
                                  .designationController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                addMemberController.addMoreCompany();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Add More",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: addMemberController.brandNameTextField.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CommonTitle(text: "Brand/Product Name"),
                            index == 0
                                ? const SizedBox()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(
                                          color: Colors.red,
                                        )),
                                    onPressed: () {
                                      addMemberController.brandNameTextField
                                          .removeAt(index);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  ),
                          ],
                        ),
                        TextFieldCommon(
                          hintText: "Enter your brand or product name here",
                          controller: addMemberController
                              .brandNameTextField[index].brandController,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                addMemberController.addMoreBrand();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Add More",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonButton(
                  width: Get.width * 0.30,
                  onTap: () {
                    addMemberController.currentPage.value = 1;
                  },
                  text: "BACK",
                ),
                CommonButton(
                  width: Get.width * 0.33,
                  onTap: () {},
                  text: "ADD MEMBER",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
