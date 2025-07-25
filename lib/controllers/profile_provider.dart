import 'package:e_commerce_app/controllers/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier {
  String username = '';

  void getData() async {
    final pref = await SharedPreferences.getInstance();
    username = pref.getString('username') ?? '';
    notifyListeners();
  }

  void logOut(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    final productData = Provider.of<ProductProvider>(context, listen: false);
    productData.filteredList.clear();
    productData.favCount = 0;
    productData.productCart.clear();
    productData.searchedList.clear();
    productData.totalAmount = 0;
    notifyListeners();
  }
}
