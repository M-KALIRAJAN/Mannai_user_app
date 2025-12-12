import 'package:dio/dio.dart';
import 'package:mannai_user_app/core/network/dio_client.dart';
import 'package:mannai_user_app/core/utils/logger.dart';

class OnbordingService {
  final _dio = Dio();
  
  //About Api
  Future<Map<String, dynamic>?> fetchAbout() async {
    final Dio _dio = DioClient.dio;
    try {
      final response = await _dio.get("intro");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      AppLogger.error("About Api Error: $e");
    }
  }
    // Welcome 

    Future<Map<String,dynamic>?> loading()async{
      final Dio _dio = DioClient.dio;
      try{
         final response = await _dio.get("user/loading/loading-screen");
         if(response.statusCode == 200){
          return response.data ;
         } else{
                    return null ;
         } 
      }catch(e){
        AppLogger.error("loading Api ${e}");
      }
    }
}
