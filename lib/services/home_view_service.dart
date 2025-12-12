import 'package:dio/dio.dart';
import 'package:mannai_user_app/core/utils/logger.dart';

class HomeViewService {
  final _dio = Dio();

  // Service ListApi
  Future <Map<String,dynamic>?> servicelists() async{
     final _dio = Dio();
     try{
      final response = await _dio.get("service");
          if(response.statusCode == 200){
            return response.data;
          }else{
            return null ;
          }

     }catch(e){
      AppLogger.error("servicelist Api : ${e.toString()}");
     }
  }
}