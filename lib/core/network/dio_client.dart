  
import 'package:dio/dio.dart';

class DioClient {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.29.129:8080/api/",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
  
class ImageBaseUrl {
  static const baseUrl = "http://192.168.29.129:8080/uploads/";
}
