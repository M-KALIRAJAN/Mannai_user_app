import 'package:flutter/material.dart';

import 'package:mannai_user_app/models/address_model.dart';

class AddressController {
  // Text controllers for each field
  final street = TextEditingController();
  final city = TextEditingController();
  final aptNo = TextEditingController();
  final building = TextEditingController();
final floor = TextEditingController();
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Validators
  String? validateDoorNo(String? value) =>
      value == null || value.isEmpty ? "Enter door number" : null;

  String? validateStreet(String? value) =>
      value == null || value.isEmpty ? "Enter street" : null;

       String? validateFloor(String? value) =>
      value == null || value.isEmpty ? "Enter Floor" : null;

  String? validateAptNo(String? value) =>
      value == null || value.isEmpty ? "Enter apartment number" : null;

  String? validateBuilding(String? value) =>
      value == null || value.isEmpty ? "Enter building name" : null;

  // Save data to model
  AddressModel getAddressData() {
    return AddressModel(
      aptNo: aptNo.text, 
      street: street.text, 
      city: city.text,
        floor: floor.text,
       building: building.text);
  }

 
}
