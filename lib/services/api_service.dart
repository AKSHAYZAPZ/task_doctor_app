import 'package:dio/dio.dart';
import '../screens/search_screen/model/doctor_model.dart';
import 'api_constant.dart';
import 'dio_client.dart';

class ApiService {
  static final Dio _dio = DioClient.dio;
  static Future<List<DoctorModel>> fetchDoctors(
      {String? name, String? speciality, int? experience}) async {
    try {
      final response = await _dio.get(
        ApiConstants.doctors,
        queryParameters: {
          if (name != null && name.isNotEmpty) 'name': name,
          if (speciality != null && speciality.isNotEmpty)
            'speciality': speciality,
          if (experience != null && experience > 0) 'experience': experience,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => DoctorModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
