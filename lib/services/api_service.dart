import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:e_commerce_app/constants/consts.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/model/user_model.dart';

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

  //Checking the Users
  Future authentication(User user) async {
    final dio = Dio();

    try {
      log("Success");
      final datas = await dio.get(
        "${ApiConstants.authBaseUrl}${ApiConstants.authEndPoint}",
      );

      final List users = datas.data;

      return users.map((e) => User.fromJson(e)).toList();
    } on DioException catch (e) {
      log("$e");
      return [];
    }
  }

  //Adding User to the Api
  Future addingUsers(User user) async {
    final dio = Dio();

    try {
      log("Success");
      final datas = await dio.post(
        "${ApiConstants.authBaseUrl}${ApiConstants.authEndPoint}",
        data: {"username": user.username, "password": user.password},
      );

      final List users = datas.data;

      return users.map((e) => User.fromJson(e)).toList();
    } on DioException catch (e) {
      log("$e");
      return [];
    }
  }
}
