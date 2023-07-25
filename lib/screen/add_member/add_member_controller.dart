import 'package:api_demo/model/blood_group_list_model.dart';
import 'package:api_demo/model/table_name_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddMemberController extends GetxController {
  GlobalKey<FormState> addMemberKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController workAddressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController spouseDateController = TextEditingController();
  TextEditingController marriageDateController = TextEditingController();
  TextEditingController productNameController = TextEditingController();

  ImagePicker picker = ImagePicker();
  var box = GetStorage();

  RxString selectedValue = "".obs;
  RxString imagePath = "".obs;
  RxInt currentPage = 0.obs;
  RxBool deleteIcon = false.obs;

  RxList<Company> companyNameTextField = <Company>[
    Company(
        companyController: TextEditingController(),
        designationController: TextEditingController())
  ].obs;

  RxList<Brand> brandNameTextField =
      <Brand>[Brand(brandController: TextEditingController())].obs;

  RxList<BloodGroupList> bloodGroup = <BloodGroupList>[].obs;
  RxList<TableName> tableName = <TableName>[].obs;

  Rx<BloodGroupList> selectedBloodGroup = BloodGroupList().obs;
  Rx<TableName> selectedTable = TableName().obs;

  addMoreCompany() {
    companyNameTextField.add(Company(
        designationController: TextEditingController(),
        companyController: TextEditingController()));

    deleteIcon.value = true;
  }

  addMoreBrand() {
    brandNameTextField.add(Brand(brandController: TextEditingController()));
  }

  birthDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyy').format(pickedDate);
      birthDateController.text = formattedDate.toString();
    }
  }

  spouseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyy').format(pickedDate);
      spouseDateController.text = formattedDate.toString();
    }
  }

  marriageDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyy').format(pickedDate);
      marriageDateController.text = formattedDate.toString();
    }
  }

  getImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.name.toString();
    }
  }

  getBloodGroupList() async {
    try {
      var token = box.read("token");
      final response = await http.post(
          Uri.parse(
              "https://dummymomo.rtn.org.np/api/v1/other/blood_group_list"),
          body: {"token": token});
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        bloodGroup.value = bloodGroupFromJson(response.body).data!;
      } else {
        throw Exception("error");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  getTableNameList() async {
    try {
      var token = box.read("token");
      final response = await http.post(
          Uri.parse("https://dummymomo.rtn.org.np/api/v1/table/all_table_list"),
          body: {"token": token});
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203 ||
          response.statusCode == 204) {
        tableName.value = tableNameFromJson(response.body).data!;
      } else {
        throw Exception("error");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getBloodGroupList();
    getTableNameList();
  }
}

class Company {
  final TextEditingController companyController;
  final TextEditingController designationController;

  Company({
    required this.designationController,
    required this.companyController,
  });
}

class Brand {
  final TextEditingController brandController;

  Brand({required this.brandController});
}
