import 'package:doctors_app/constants/color_constants.dart';
import 'package:doctors_app/constants/shimmer_container.dart';
import 'package:doctors_app/controller/network_cotroller.dart';
import 'package:doctors_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/error_view.dart';
import '../../../widgets/common_extracted_widgets.dart';
import '../../../widgets/radio_widget.dart';
import '../controller/doctor search_controller.dart';

class DoctorSearchScreen extends StatelessWidget {
  DoctorSearchScreen({super.key});

  final NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        final controller = Get.put(DoctorSearchController());
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            centerTitle: true,
            title: Text('Doctor Search'),
            actions: [
              GetX<DoctorSearchController>(
                builder: (controller) {
                  return IconButton(
                    icon: Icon(
                      controller.isDark.value
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    onPressed: () {
                      controller.isDark.value = !controller.isDark.value;
                      Get.changeThemeMode(
                        controller.isDark.value
                            ? ThemeMode.dark
                            : ThemeMode.light,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: RefreshIndicator(
            backgroundColor: ColorConstant.appBlue,
            color: ColorConstant.black,
            onRefresh: () async {
              controller.nameController.text='';
             controller .resetFilters();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: controller.nameController,
                            style: const TextStyle(color: ColorConstant.white),
                            decoration: InputDecoration(
                              hintText: 'Search doctors',
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            onChanged: (value) => controller.getDoctors(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.black,
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: ColorConstant.white,
                          ),
                          onPressed: () => openFilterSheet(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                     child:controller.isLoading.value
                         ? Center(
                       child:  ListView.builder(
                         itemCount: 6,
                         itemBuilder: (_, index) {
                           return Padding(
                             padding: const EdgeInsets.symmetric( horizontal: 12,
                               vertical: 6,),
                             child: ShimmerContainer(width: MediaQuery.of(context).size.width, height: 98.sp, borderRadius: 7),
                           );
                         },
                       ),
                     )
                         : controller.isError.value
                         ? ErrorView(
                       onTap: () => controller.onInit(),
                     )
                         : controller.doctorList.isEmpty
                         ? Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(
                           height: 200.sp,
                           width: 200.sp,
                           child: Image.asset(AppImages.noDoctor),
                         ),
                         Text(
                           "No doctors found",
                           style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                       ],
                     )
                         :
                     ListView.builder(
                      itemCount: controller.doctorList.length,
                      itemBuilder: (_, index) {
                        final doctor = controller.doctorList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.doctorDetails,arguments: doctor);
                          },
                          child: Card(
                            color: Theme.of(context).cardColor,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  doctor.avatarUrl,
                                ),
                              ),
                              title: Text(doctor.name),
                              subtitle: Text(
                                '${doctor.speciality} • ${doctor.experience} yrs',
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                ),
              ],
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}

void openFilterSheet() {
  final controller = Get.find<DoctorSearchController>();
  final theme = Get.theme;
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            theme.bottomSheetTheme.backgroundColor ??
            theme.scaffoldBackgroundColor,

        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Doctors',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.sp),
            const Text('Speciality'),
            GetX<DoctorSearchController>(
              builder: (controller) {
                return DropdownButton<String>(
                  dropdownColor: theme.cardColor,
                  value: controller.selectedSpeciality.value.isEmpty
                      ? null
                      : controller.selectedSpeciality.value,
                  isExpanded: true,
                  items: controller.specialities
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (val) =>
                      controller.selectedSpeciality.value = val ?? '',
                );
              },
            ),
            SizedBox(height: 16.sp),
            const Text('Gender'),
            Row(
              children: ['Any', 'Male', 'Female']
                  .map(
                    (gender) => Expanded(child: GenderRadioTile(value: gender)),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.sp),
            GetX<DoctorSearchController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minimum Experience (${controller.experience.value} years)',
                    ),
                    Slider(
                      thumbColor: ColorConstant.appBlue,
                      activeColor: ColorConstant.appBlue,
                      value: controller.experience.value.toDouble(),
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: '${controller.experience.value.round()}',
                      onChanged: (val) =>
                          controller.experience.value = val.toInt(),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () {
                    Get.back();
                    controller.resetFilters();
                  },
                  text: 'Reset Filter',
                  fontColor: theme.textTheme.labelLarge?.color ?? Colors.black,
                  buttonColor: theme.cardColor,
                ),
                SizedBox(width: 20.sp),
                AppButton(
                  onPressed: () {
                    controller.applyFilters(
                      speciality: controller.selectedSpeciality.value,
                      exp: controller.experience.value,
                      gender: controller.selectedGender.value,
                    );
                    Get.back();
                  },
                  text: 'Apply Filter',
                  fontColor: ColorConstant.black,
                  buttonColor: ColorConstant.appBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
