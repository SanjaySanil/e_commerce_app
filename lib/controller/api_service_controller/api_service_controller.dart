import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ApiServiceController extends ChangeNotifier {
  final apiService = ApiServices();
  bool isLoading = false;
  List<ProductModel> products = [];
  ProductModel? productsDetails;
  List<String> category = [];

  List<ProductModel> categoryList = [];

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    products = await apiService.fetchAllProducts() as List<ProductModel>;
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchProductById(String id) async {
    isLoading = true;
    notifyListeners();
    productsDetails = await apiService.fetchProductById(id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategory() async {
    isLoading = true;
    notifyListeners();
    category = await apiService.fetchCategories();
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchByCategory(String id) async {
    isLoading = true;
    notifyListeners();
    categoryList = await apiService.fetchProductByCategory(id);
    isLoading = false;
    notifyListeners();
  }

  ApiServices services = ApiServices();

  Future<void> fetchProduct() async {
    isLoading = true;
    notifyListeners();
    fetchProducts();
    isLoading = false;
    notifyListeners();
  }
}
