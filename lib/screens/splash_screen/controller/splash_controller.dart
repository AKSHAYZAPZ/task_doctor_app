import 'package:doctors_app/routes/routes.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
   Get.offAllNamed(AppRoute.search);
    });
  }
}
