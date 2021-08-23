import 'dart:convert';
import 'dart:io';

import 'package:shoppy_app/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class Api {
  static const String baseURL = "https://fakestoreapi.com";
  static const String products = baseURL + "/products";
  static const String category = baseURL + "/products/categories";
  static const String productsByCategory = baseURL + "/products/category/";

  Future getProducts() async {
    try {
      final response = await http.get(
        Uri.parse(products),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );

      if (response.statusCode == 200) {
        final rawJson = json.decode(response.body);
        return rawJson.map((product) => Product.fromJson(product)).toList();
      } else {
        throw response.body.toString();
      }
    } on SocketException {
      throw Exception;
    } catch (e) {
      print(e.toString());
    }
  }

  Future getCategories() async {
    try {
      final res = await http.get(
        Uri.parse(category),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
      if (res.statusCode == 200) {
        final rawJson = json.decode(res.body);
        rawJson.insert(0, "all");
        return rawJson;
      }
    } on SocketException {
      throw Exception;
    } catch (e) {
      print(e.toString());
    }
  }

  Future getPrroductsByCategory(String category) async {
    try {
      final res = await http.get(Uri.parse(productsByCategory + category),
          headers: {HttpHeaders.contentTypeHeader: "application/json"});
      if (res.statusCode == 200) {
        final rawJson = json.decode(res.body);
        return rawJson.map((product) => Product.fromJson(product)).toList();
      } else {
        throw res.body.toString();
      }
    } on SocketException {
      throw Exception;
    } catch (e) {
      print(e.toString());
    }
  }
}
