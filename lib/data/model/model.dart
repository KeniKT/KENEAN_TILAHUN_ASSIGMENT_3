class Asebeza {
  String foodTitle;
  String foodDescription;
  String image;
  num foodPrice;
  int id;

  Asebeza(
      {required this.foodTitle,
      required this.foodDescription,
      required this.foodPrice,
      required this.image,
      required this.id});

  factory Asebeza.fromJson(Map<String, dynamic> parsedJson) {
    return Asebeza(
        id: parsedJson["id"],
        foodTitle: parsedJson["title"],
        foodDescription: parsedJson["description"],
        foodPrice: parsedJson["price"],
        image: parsedJson["image"]);
  }
}
