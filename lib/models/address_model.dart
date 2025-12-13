class AddressModel {
  final String city;
  final String street;
  final String aptNo;
  final String building;
   final String floor;
   final String rode;

  AddressModel({
    required this.aptNo,
    required this.street,
    required this.city,
    required this.building,
      required this.floor,
      required this.rode
  });

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "aptNo": aptNo,
        "building": building,
          "floor": floor,
          "rode":rode
      };
}
