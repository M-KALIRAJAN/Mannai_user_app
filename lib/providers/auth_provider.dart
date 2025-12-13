import 'package:flutter/material.dart';
import 'package:mannai_user_app/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _services = AuthService();
  bool isLoading = false;
  String? errorMessage;
  Map<String?, dynamic>? Userdata;



  //user BasiInfo
  Future<bool> basicInfo({
    required String fullName,
    required String mobileNumber,
    required String email,
    required String password,
    required String gender,
  }) async {
 
    try {
      Userdata = await _services.basicInfo(
        fullName: fullName,
        mobileNumber: mobileNumber,
        email: email,
        password: password,
        gender: gender,
      );
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } 
  }
}
