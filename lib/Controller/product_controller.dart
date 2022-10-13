import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  ScrollController controller = ScrollController();
  List<Product> list = <Product>[].obs();
  addProduct(Product pro) {
    list.add(pro);
    print(list.last.name);
    update();
  }

  List<Product> getDataAll() {
    return list;
  }

  updatProduct(Product product) {
    list[list.indexWhere((element) => element.code == product.code)] = product;
    update();
  }

  deleteProduct(int productCode) {
    list.removeAt(list.indexWhere((element) => element.code == productCode));
    update();
  }
}
