import 'package:doctors_app/controller/network_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {

NetworkController networkController = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
         if(networkController.isConnected.value) {
           SplashController splashController = Get.put(SplashController());
           return Scaffold(
             body: Center(
               child: Text(
                 "Doctors App",
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
               ),
             ),
           );
         }else{
           return networkController.noDataImage(context);
         }
      }
    );
  }
}