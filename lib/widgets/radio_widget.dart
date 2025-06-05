import 'package:doctors_app/screens/search_screen/controller/doctor%20search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';

class GenderRadioTile extends StatelessWidget {
  final String value;

  const GenderRadioTile({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<DoctorSearchController>(
      builder: (controller) {
        return Row(
          children: [
            Radio<String>(
              activeColor: ColorConstant.appBlue,
              value: value,
              groupValue: controller.selectedGender.value,
              onChanged: (val) => controller.selectedGender.value = val!,
            ),
            Text(value),
            SizedBox(width: 10.sp),
          ],
        );
      },
    );
  }
}