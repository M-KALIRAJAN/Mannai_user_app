import 'package:mannai_user_app/models/address_model.dart';

class FamilyMemberModel {
  final String fullName;
  final String mobileNumber;
  final String email;
  final String gender;

  final String relation;
  final String familyCount;
  final AddressModel address;

  FamilyMemberModel({
    required this.relation,
    required this.address,
    required this.fullName,
    required this.mobileNumber,
    required this.email,
    required this.gender,

    required this.familyCount,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "mobileNumber": mobileNumber,
    "email": email,
    "gender": gender,
  
    "relation": relation,
    "familyCount": familyCount,
    "address": address.toJson(),
  };
}
