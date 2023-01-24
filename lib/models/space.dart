import 'dart:convert';

class Space {
  final int id;
  final String name;
  final int price;
  final String city;
  final String country;
  final String imgUrl;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int numberOfKitchens;
  final int numberOfBedrooms;
  final int numberOfCupboards;

  Space({
    required this.id,
    required this.name,
    required this.price,
    required this.city,
    required this.country,
    required this.imgUrl,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        id: json["id"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        name: json["name"],
        city: json["city"],
        country: json["country"],
        price: json["price"],
        imgUrl: json["image_url"],
        rating: json["rating"],
        address: json["address"],
        phone: json["phone"],
        mapUrl: json["map_url"],
        numberOfKitchens: json["number_of_kitchens"],
        numberOfBedrooms: json["number_of_bedrooms"],
        numberOfCupboards: json["number_of_cupboards"],
      );
}
