import 'dart:convert';

import 'package:e_commerce_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<Iterable> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        final  json=jsonDecode(response.body)as List;
        final category=json.map((e){
          return CategoryModel(category:e["category"]);
        });
        return category;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<dynamic>> fetchJewelryProducts() async {
    try {
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch jewelry products');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<dynamic>> fetchLimitedProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?limit=5'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch limited products');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<dynamic>> fetchDescendingProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?sort=desc'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch descending products');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<Map<String, dynamic>> fetchProductById(int productId) async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/$productId'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch product');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }
}
