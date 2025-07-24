import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> allProducts = [];
  List<Product> filteredList = [];
  List<Product> searchedList = [];
  List<Product> productCart = [];
  List<Product> favouriteList = [];
  bool isSearching = false;
  String selectedCategory = "all";
  int favCount = 0;

  //METHODS
  void getData() async {
    List<Product> data = await ApiService().fetchProducts();
    final pref = await SharedPreferences.getInstance();

    for (var product in data) {
      final key = product.title;
      product.isLiked = pref.getBool(key) ?? false;
    }
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

  void searching() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void searchedProducts(String query) {
    searchedList = filteredList
        .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //add to cart method

  void addToCart(Product product, context) {
    product.isOrdered = true;

    if (productCart.contains(product)) {
      product.itemCount++;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Already Added")));
    } else {
      productCart.add(product);
      product.isOrdered = true;
      product.itemCount = 1;
    }
    notifyListeners();
  }

  //remove from cart

  void removeFromCart(Product product) {
    product.isOrdered = false;
    product.itemCount = 1;
    productCart.remove(product);
    notifyListeners();
  }

  void itemIncreament(Product product) {
    product.itemCount++;
    notifyListeners();
  }

  void itemdecreament(Product product) {
    if (product.itemCount > 1) {
      product.itemCount--;
    } else {
      removeFromCart(product);
      return;
    }
    notifyListeners();
  }

  void liked(Product product) async {
    final pref = await SharedPreferences.getInstance();
    final key = product.title;

    // Read old state from prefs
    bool current = pref.getBool(key) ?? false;

    // Toggle and update
    bool updated = !current;
    await pref.setBool(key, updated);

    // Assign to product
    product.isLiked = updated;
    addToFav(product);
    notifyListeners();
  }

  //To fav list
  void addToFav(Product product) {
    if (product.isLiked == true) {
      favouriteList.add(product);
      favCount++;
    } else {
      favouriteList.remove(product);
      favCount--;
    }
  }
}
