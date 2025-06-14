import 'package:doctors_app/constants/color_constants.dart';
import 'package:doctors_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_images.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.error,
            height: 200.sp,
            width: 200.sp,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            'Error!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text("Something Went Wrong", style: TextStyle(fontSize: 15.sp)),
          SizedBox(
            height: 20.sp,
          ),
          AppButton(onPressed: onTap, text: 'Retry', fontColor: ColorConstant.white, buttonColor: ColorConstant.appBlue)
        ],
      ),
    );
  }
}
