import 'package:http/http.dart' as http;
import 'dart:convert';

class Cat {
  String id;
  String url;
  int width;
  int height;
  List<Map<String, dynamic>> breeds;

  Cat(this.id, this.url, this.width, this.height, this.breeds);

  static Future<List<Cat>> fetch10Cats() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((cat) => Cat.fromJson(cat)).toList();
    } else {
      throw Exception('Failed to load cats');
    }
  }

  static Future<Cat> fetchCatById(String id) async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/images/$id'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Cat.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load cat with id $id');
    }
  }

  static Future<Cat> fetchRandomCat() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/images/search'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body)[0];
      return Cat.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load random cat');
    }
  }

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      json['id'],
      json['url'],
      json['width'],
      json['height'],
      (json['breeds'] as List<dynamic>?)
              ?.map((b) => b as Map<String, dynamic>)
              .toList() ??
          [],
    );
  }
}
