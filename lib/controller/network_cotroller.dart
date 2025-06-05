import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctors_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class NetworkController extends GetxController{
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();

    checkConnectivity();


    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);

    });
  }

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected.value = (connectivityResult != ConnectivityResult.none);
  }

  noDataImage(context){
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300.sp,
                width: 450.sp,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.noData),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text('No Network Connection',style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}