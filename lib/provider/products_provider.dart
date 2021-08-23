import 'package:flutter/material.dart';
import 'package:shoppy_app/models/product_model.dart';
// import 'package:shoppy_app/utils/api.dart';

class ProductsProvider with ChangeNotifier {
  late Product products;
  bool loading = false;

  getAllProducts(context) async {
    loading = true;
    // products = await Api().getProducts(context);
    loading = false;

    notifyListeners();
  }
}
