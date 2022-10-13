import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/Controller/product_controller.dart';
import 'package:getx_with_list/product_detailScreen.dart';
import 'package:getx_with_list/widget/editwidget_dislog.dart';

class ListProductScreen extends StatefulWidget {
  ListProductScreen({Key? key}) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Card'),
      ),
      body: GetBuilder<ProductController>(
          init: productController,
          builder: (value) {
            return ListView.builder(
              controller: value.controller,
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                var pro = productController.list[index];
                return Slidable(
                    enabled: true,
                    endActionPane: ActionPane(
                      key: ValueKey(index),
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (actionPresss) {
                            productController.deleteProduct(pro.code!);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (value) {
                            showDialog(
                                context: context,
                                builder: (_) => EditWidgetDialog(
                                      product: pro,
                                    ));
                          },
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.edit_note,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ProductDetailScreen(
                            product: pro,
                          ),
                        );
                      },
                      child: Card(
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
                        ),
                      ),
                    ));
              },
            );
          }),
    );
  }
}
