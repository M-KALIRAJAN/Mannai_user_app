import 'package:flutter/material.dart';
import 'package:mannai_user_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier{
   final AuthService _service = AuthService();

   
}