import 'dart:convert';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<String>> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      if (response.statusCode == 200) {
        return List<String>.from(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<ProductModel>> fetchProductByCategory(String category) async {
    try {
      final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products/category/$category'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        var products =
            jsonData.map((item) => ProductModel.fromJson(item)).toList();
        return products;
      } else {
        throw Exception('Failed to fetch jewelry products');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<ProductModel>> fetchLimitedProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?limit=5'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = await json.decode(response.body);
        return jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch limited products');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products?sort=desc'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = await json.decode(response.body);
        return jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to fetch descending products');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }

  Future<ProductModel> fetchProductById(String productId) async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/${productId}'));
      if (response.statusCode == 200) {
        final jsonResponse = await json.decode(response.body);
        return ProductModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch product');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API server');
    }
  }
}
