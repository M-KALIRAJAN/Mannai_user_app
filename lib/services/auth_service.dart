import 'package:dio/dio.dart';

class AuthService {
   final _dio = Dio();


    //LOGIN API 

    Future<Map<String,dynamic>> login(String email,String password) async{
       final response = await _dio.post(
       "https://api.example.com/login",
       data: {
        "email":email,
        "password":password
       }
       );
       return response.data ;
    }
}