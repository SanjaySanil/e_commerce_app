
import 'package:e_commerce_app/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ApiServiceController extends ChangeNotifier{
  ApiServices services = ApiServices();
  bool isLoading=false;
  List <dynamic>fetchProducts = [];

  Future<void> fetchProduct() async {
    isLoading=false;
    notifyListeners();
    final response = await services.fetchDescendingProducts();
    fetchProducts = response;
    isLoading=true;
    notifyListeners();
  }
}
