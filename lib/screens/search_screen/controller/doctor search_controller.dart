import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/api_service.dart';
import '../model/doctor_model.dart';


class DoctorSearchController extends GetxController{


  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isDark = false.obs;
  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;
  RxList<String> specialities = <String>[].obs;

  final TextEditingController nameController = TextEditingController();
  RxString selectedSpeciality = ''.obs;
  RxString selectedGender = ''.obs;
  RxInt experience = 0.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    nameController.text = '';
    specialities.value = [];
    resetFilters();
    await getDoctors();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDark.value = brightness == Brightness.dark;
    super.onInit();
  }

  Future<void> getDoctors() async {
    try {
      isLoading.value = true;
      isError.value = false;

      final result = await ApiService.fetchDoctors(
        name: nameController.text,
        speciality: selectedSpeciality.value,
        experience: experience.value,
      );
      final filteredByExperience =
      result.where((doc) => doc.experience >= experience.value).toList();

      final filteredByGender =
      selectedGender.value.isEmpty || selectedGender.value == 'Any'
          ? filteredByExperience
          : filteredByExperience
          .where((doc) =>
      doc.gender.toLowerCase() ==
          selectedGender.value.toLowerCase())
          .toList();

      doctorList.value = filteredByGender;
      if (specialities.value.isEmpty) {
        await fetchSpecialitiesAndDoctors();
      }
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilters({
    required String speciality,
    required int exp,
    required String gender,
  }) {
    selectedSpeciality.value = speciality;
    experience.value = exp;
    selectedGender.value = gender;
    getDoctors();
  }

  Future<void> fetchSpecialitiesAndDoctors() async {
    specialities.value =
        doctorList.value.map((e) => e.speciality).toSet().toList();
  }

  void resetFilters() {
    selectedSpeciality.value = '';
    selectedGender.value = 'Any';
    experience.value = 0;
    getDoctors();
  }
}