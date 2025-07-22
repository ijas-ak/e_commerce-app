import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/model/product_model.dart';

class ApiService {
  final dio = Dio();
  Future fetchProducts() async {
    try {
      log('Success');
      final response = await dio.get(
        "${ApiConstants.baseUrl}${ApiConstants.urlEndpoint}",
        queryParameters: {'limit': 150},
      );
      List<dynamic> data = response.data["products"];
      return data.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      log("Error $e");
    }
  }
}
