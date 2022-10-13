import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About Product'),
      content: SizedBox(
        height: 500,
        width: 400,
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 172, 191, 201),
              child: ListTile(
                title: Text('Procduct Code: ${product.code}'),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 172, 191, 201),
              child: ListTile(
                title: Text('Procduct Name: ${product.name}'),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 172, 191, 201),
              child: ListTile(
                title: Text('Procduct Qty : ${product.qty}'),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 172, 191, 201),
              child: ListTile(
                title: Text('Procduct Price: ${product.price}'),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 172, 191, 201),
              child: ListTile(
                title: Text('Procduct Total: ${product.total}'),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: MaterialButton(
            onPressed: () {
              Get.back();
            },
            child: const Center(
              child: Text(
                'close',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
