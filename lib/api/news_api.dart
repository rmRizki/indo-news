import 'dart:convert';
import 'package:Indo_News/models/articles.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String baseUrl = 'https://newsapi.org/v2';
  String country = 'country=id';
  String apiKey = 'apiKey=db01b3fe1646405db5372e74e6bf778e';
  String endpoint;

  Future<Articles> fetchTopHeadlines() async {
    endpoint = 'top-headlines';
    final response = await http.get('$baseUrl/$endpoint?$country&$apiKey');
    if (response.statusCode == 200) {
      return Articles.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
