class AddressModel {
  final String city;
  final String street;
  final String aptNo;
  final String building;
   final String floor;

  AddressModel({
    required this.aptNo,
    required this.street,
    required this.city,
    required this.building,
      required this.floor,
  });

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "aptNo": aptNo,
        "building": building,
          "floor": floor,
      };
}
