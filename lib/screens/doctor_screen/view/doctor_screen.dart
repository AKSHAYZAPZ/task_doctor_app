import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color_constants.dart';
import '../controller/doctor_details_controller.dart';


class DoctorDetailScreen extends StatelessWidget {
  DoctorDetailScreen({
    super.key,
  });
  final DoctorDetailController controller = Get.put(DoctorDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.appBlue,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBlue,
        title: Text(
          'Doctor Details',
          style: TextStyle(color: ColorConstant.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorConstant.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.sp),
          Center(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              radius: 95.sp,
              backgroundImage:
              NetworkImage(controller.argument!.avatarUrl ?? ''),
            ),
          ),
          SizedBox(height: 16.sp),
          Center(
            child: Column(
              children: [
                Text(
                  controller.argument!.name ?? '',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  controller.argument!.speciality ?? '',
                  style: TextStyle(fontSize: 20.sp, color: ColorConstant.grey),
                ),
                Text(
                  '${controller.argument!.experience ?? ''} yrs experience',
                  style: TextStyle(fontSize: 16.sp, color: ColorConstant.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Languages',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          ...controller.argument!.languages.map(
                                (lang) => Text(
                              '• $lang',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    infoTile('Education', controller.argument!.education ?? ''),
                    infoTile('About', controller.argument!.bio ?? ''),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoTile(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.sp),
          Text(content, style: TextStyle(fontSize: 15.sp)),
        ],
      ),
    );
  }
}