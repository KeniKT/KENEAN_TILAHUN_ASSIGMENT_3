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
factory Asebeza.historyfromJson(Map<String, dynamic> parsedJson) {
    return Asebeza(
      id: parsedJson["id"],
      foodTitle: parsedJson["foodTitle"],
      foodDescription: parsedJson["foodDescription"],
      foodPrice: parsedJson["foodPrice"],
      image: parsedJson["image"],
      
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['foodTitle'] = foodTitle;
    json['foodDescription'] = foodDescription;
    json['foodPrice'] = foodPrice;
    json['image'] = image;
    
    return json;
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Asebeza.fromJson(asbeza[i]));
    }
    return asbezas;
  }

  static List historyList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Asebeza.historyfromJson(asbeza[i]));
    }
    return asbezas;
  }
}
