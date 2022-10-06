import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/Controller/product_controller.dart';

class ListProductScreen extends StatelessWidget {
  ListProductScreen({Key? key}) : super(key: key);
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Card'),
        ),
        body: ListView.builder(
          itemCount: productController.list.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(productController.list[index].name.toString()),
              ),
            );
          },
        ));
  }
}
