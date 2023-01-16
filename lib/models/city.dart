class City {
  int id;
  String name;
  String imgUrl;
  bool isPopular;

  City(
      {required this.id,
      required this.name,
      required this.imgUrl,
      this.isPopular = false});
}
