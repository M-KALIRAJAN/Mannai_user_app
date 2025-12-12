  
  import 'package:dio/dio.dart';

class DioClient {
    static final Dio dio = Dio(
       BaseOptions(
        baseUrl: "http://192.168.29.129:8080/api/",
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
       )
    );
  }
  
class ImageBaseUrl {
  static const baseUrl = "http://192.168.29.129:8080/uploads/";
}
