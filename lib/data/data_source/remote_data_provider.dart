import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class ApiServiceProvider {
  Future<List<Asebeza>> getGroceryItems() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      final asbezas = result.map((res) => Asebeza.fromJson(res)).toList();
      print("from data layer");
      print(asbezas);
      return asbezas;
    } else {
      throw Exception('Failed to load');
    }
  }
}
