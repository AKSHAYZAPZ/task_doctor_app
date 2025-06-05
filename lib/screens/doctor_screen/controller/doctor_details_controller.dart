import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../search_screen/model/doctor_model.dart';


class DoctorDetailController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  DoctorModel? argument;
  @override
  void onInit() {
    if (Get.arguments != null) {
      argument = Get.arguments;
    }
    super.onInit();
  }
}