import 'package:api_demo/model/blood_group_list_model.dart';
import 'package:api_demo/model/table_name_list_model.dart';
import 'package:api_demo/screen/add_member/add_member_controller.dart';
import 'package:api_demo/screen/add_member/widget/text_field.dart';
import 'package:api_demo/utils/common_button.dart';
import 'package:api_demo/screen/add_member/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInformation extends StatelessWidget {
  BasicInformation({Key? key}) : super(key: key);

  final AddMemberController addMemberController =
  Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: addMemberController.addMemberKey,
            child: Obx(
                  () =>
                  Column(
                    children: [
                      const CommonTitle(text: "Table Name", validation: "*"),
                      DropdownButtonFormField(
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.circular(13),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select table',
                          style: TextStyle(color: Colors.grey),
                        ),
                        items: addMemberController.tableName
                            .map(
                              (item) =>
                              DropdownMenuItem<TableName>(
                                value: item,
                                child: Text(item.tableName.toString()),
                              ),
                        )
                            .toList(),
                        onChanged: (TableName? value) {
                          addMemberController.selectedValue.value =
                              value.toString();
                        },
                        validator: (v) =>
                        v == null ? "Please select table name" : null,
                      ),
                      const SizedBox(height: 20),
                      const CommonTitle(text: "Full Name", validation: "*"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: 'Enter name here',
                        validation: (fullName) {
                          if (fullName!.isEmpty) {
                            return "Please enter full name";
                          }
                          return null;
                        },
                        controller: addMemberController.nameController,
                      ),
                      const CommonTitle(text: "Profile Image (Max: 1MB)"),
                      Container(
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
                                addMemberController.imagePath.value.isNotEmpty
                                    ? addMemberController.imagePath.toString()
                                    : "Choose File",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addMemberController.getImage();
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CommonTitle(text: "Email", validation: "*"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: 'Enter email',
                        validation: (email) {
                          if (email!.isEmpty) {
                            return "Please enter full name";
                          } else if (!GetUtils.isEmail(email)) {
                            return "Email not valid";
                          }
                          return null;
                        },
                        controller: addMemberController.emailController,
                      ),
                      const CommonTitle(text: "Home Address", validation: "*"),
                      TextFieldCommon(
                        hintText: "Enter address here",
                        validation: (homeAddress) {
                          if (homeAddress!.isEmpty) {
                            return "Please enter home address";
                          }
                          return null;
                        },
                        controller: addMemberController.homeAddressController,
                      ),
                      const CommonTitle(text: "Work Address", validation: "*"),
                      TextFieldCommon(
                        hintText: "Enter address here",
                        validation: (workAddress) {
                          if (workAddress!.isEmpty) {
                            return "Please enter work address";
                          }
                          return null;
                        },
                        controller: addMemberController.workAddressController,
                      ),
                      const CommonTitle(text: "Date Of Birth", validation: "*"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: "Select date of birth",
                        suffixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          addMemberController.birthDate();
                        },
                        controller: addMemberController.birthDateController,
                        validation: (dob) {
                          if (dob!.isEmpty) {
                            return "Please select date of birth";
                          }
                          return null;
                        },
                      ),
                      const CommonTitle(text: "Mobile Number", validation: "*"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: "Enter mobile  number",
                        validation: (mobileNumber) {
                          if (mobileNumber!.isEmpty) {
                            return "Please enter mobile number";
                          } else if (mobileNumber.length < 10) {
                            return "Enter valid Mobile number";
                          }
                          return null;
                        },
                        controller: addMemberController.mobileController,
                      ),
                      const CommonTitle(text: "Alternate Mobile Number"),
                      const TextFieldCommon(
                        maxLine: 1,
                        hintText: "Enter alternate mobile number",
                      ),
                      const CommonTitle(text: "Phone Number"),
                      const TextFieldCommon(
                          maxLine: 1, hintText: "Enter phone number"),
                      const CommonTitle(text: "Spouse Name"),
                      const TextFieldCommon(
                          maxLine: 1, hintText: "Enter spouse name"),
                      const CommonTitle(text: "Spouse Of Birth"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: "Select spouse date of birth",
                        controller: addMemberController.spouseDateController,
                        suffixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          addMemberController.spouseDate();
                        },
                      ),
                      const CommonTitle(text: "Marriage Anniversary Date"),
                      TextFieldCommon(
                        maxLine: 1,
                        hintText: "Select marriage anniversary date",
                        controller: addMemberController.marriageDateController,
                        suffixIcon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          addMemberController.marriageDate();
                        },
                      ),
                      const CommonTitle(text: "Blood Group", validation: "*"),
                      DropdownButtonFormField(
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.circular(13),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select blood group',
                          style: TextStyle(color: Colors.grey),
                        ),
                        items: addMemberController.bloodGroup
                            .map(
                              (item) =>
                              DropdownMenuItem<BloodGroupList>(
                                value: item,
                                child: Text(item.name.toString()),
                              ),
                        )
                            .toList(),
                        onChanged: (BloodGroupList? value) {
                          addMemberController.selectedBloodGroup.value = value!;
                        },
                        validator: (v) =>
                        v == null ? "Please select blood group" : null,
                      ),
                      CommonButton(
                        text: "NEXT",
                        onTap: () {
                          if (addMemberController.addMemberKey.currentState!
                              .validate()) {
                            addMemberController.currentPage.value = 1;
                          }
                        },
                        width: Get.width * 0.30,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
