import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/Controller/product_controller.dart';
import 'package:getx_with_list/model/product_model.dart';
import 'package:getx_with_list/widget/list_product_screen.dart';
import 'package:getx_with_list/widget/textfield_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Futter With Getx'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController productController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  ProductController getxController = Get.put(ProductController());
  clearText() {
    priceController.text = '';
    productController.text = '';
    qtyController.text = '';
    totalController.text = '0.0\$';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  Get.to(() => ListProductScreen());
                },
                icon: const Icon(Icons.list)),
            const SizedBox(
              width: 40,
            )
          ],
        ),
        body: Column(
          children: [
            TextFieldWidget(
              inputOnlyNumer: false,
              label: 'Product name',
              hintText: 'Enter product',
              controller: productController,
              readOnly: false,
              onChanged: (value) {},
            ),
            TextFieldWidget(
              inputOnlyNumer: true,
              readOnly: false,
              label: 'Product Qty',
              hintText: 'Enter Qty',
              controller: qtyController,
              onChanged: (value) {
                if (priceController.text.isNotEmpty || value != null) {
                  totalController.text =
                      (double.parse(priceController.text) * int.parse(value))
                          .toString();
                  print(totalController.text);
                } else {
                  totalController.text = '0.0\$';
                }
              },
            ),
            TextFieldWidget(
              inputOnlyNumer: true,
              readOnly: false,
              label: 'Product Price',
              hintText: 'Enter Price',
              controller: priceController,
              onChanged: (value) {
                if (qtyController.text.isNotEmpty || value != null) {
                  totalController.text =
                      (int.parse(qtyController.text) * double.parse(value))
                          .toString();
                  print(totalController.text);
                } else {
                  totalController.text = '0.0\$';
                }
              },
            ),
            TextFieldWidget(
              inputOnlyNumer: false,
              readOnly: false,
              label: 'Product Total\$',
              hintText: '0.0\$',
              controller: totalController,
              onChanged: (value) {},
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(
                color: Colors.blue,
                child: const Text("save"),
                onPressed: () async {
                  if (priceController.text.isNotEmpty &&
                      productController.text.isNotEmpty &&
                      qtyController.text.isNotEmpty &&
                      totalController.text.isNotEmpty) {
                    getxController.addProduct(Product(
                        code: DateTime.now().microsecondsSinceEpoch,
                        name: productController.text,
                        qty: int.parse(qtyController.text),
                        price: double.parse(priceController.text),
                        total: double.parse(totalController.text)));
                    clearText();
                    //  print(DateTime.now().microsecondsSinceEpoch);
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Message'),
                        content: const Text('Something was null'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'))
                        ],
                      ),
                    );
                  }
                }),
            CupertinoButton(
                color: Colors.blue,
                child: const Text("clear"),
                onPressed: () {
                  clearText();
                })
          ],
        ));
  }
}
