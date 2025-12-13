

import 'package:mannai_user_app/core/network/dio_client.dart';
import 'package:mannai_user_app/core/utils/logger.dart';

class AuthService {
     final  _dio = DioClient.dio;

  // Sign Up Basic INFO
  Future<Map<String?, dynamic>>basicInfo({
    required String fullName,
    required String mobileNumber,
    required String email,
    required String password,
    required String gender,
  }) async {
    try {
      final response = await _dio.post(
        "user-account/basic-info",
           data: {
          "full_name": fullName,
          "mobile": mobileNumber,
          "email": email,
          "password": password,
          "gender": gender,
        },
      );
   
        return response.data;

    } catch (e) {
      AppLogger.error("Basic Info ${e}");
     throw Exception("Basic info failed");
      
    }
  }

  //LOGIN API

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      "{BaseUrl",
      data: {"email": email, "password": password},
    );
    return response.data;
  }
}
