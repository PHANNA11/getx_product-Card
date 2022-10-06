import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/product_model.dart';

class ProductController extends GetxController {
  List<Product> list = [];
  addProduct(Product pro) {
    list.add(pro);
    print(list.last.name);
    update();
  }

  getAllproduct() {
    return list;
  }
}
