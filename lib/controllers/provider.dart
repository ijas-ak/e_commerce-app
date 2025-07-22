import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> allProducts = [];
  List<Product> filteredList = [];
  String selectedCategory = "all";

  void getData() async {
    List<Product> data = await ApiService().fetchProducts();
    allProducts = data;
    filteredList = data;
    notifyListeners();
  }

  void getFilteredList(String category) {
    if (category == 'all') {
      filteredList = allProducts;
    } else {
      filteredList = allProducts
          .where((element) => element.category == category)
          .toList();
    }
    notifyListeners();
  }
}

class SearchProvider extends ChangeNotifier {
  bool isSearching = false;

  void searching() {
    isSearching = !isSearching;
    notifyListeners();
  }
}
