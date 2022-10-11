import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/Controller/product_controller.dart';
import 'package:getx_with_list/widget/editwidget_dislog.dart';

class ListProductScreen extends StatelessWidget {
  ListProductScreen({Key? key}) : super(key: key);
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Card'),
      ),
      body: GetBuilder<ProductController>(
          init: productController,
          // initState: (state) => ProductController(),
          builder: (value) {
            return ListView.builder(
              controller: value.controller,
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                var pro = productController.list[index];
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          pro.name.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text('${pro.qty} x ${pro.price}=${pro.total}\$',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.redAccent))
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => EditWidgetDialog(
                                  product: pro,
                                ));
                      },
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
