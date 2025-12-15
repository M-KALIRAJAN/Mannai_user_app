  
import 'package:dio/dio.dart';

class DioClient {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://nadi-buhrain-backend.onrender.com/api/",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
  
class ImageBaseUrl {
  static const baseUrl = "https://nadi-buhrain-backend.onrender.com/uploads";
}
