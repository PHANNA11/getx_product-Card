import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_with_list/Controller/product_controller.dart';
import 'package:getx_with_list/model/product_model.dart';
import 'package:getx_with_list/widget/textfield_widget.dart';

class EditWidgetDialog extends StatefulWidget {
  EditWidgetDialog({super.key, required this.product});
  Product product;
  @override
  State<EditWidgetDialog> createState() => _EditWidgetDialogState();
}

class _EditWidgetDialogState extends State<EditWidgetDialog> {
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

  setInitData() {
    setState(() {
      priceController.text = widget.product.price.toString();
      productController.text = widget.product.name.toString();
      qtyController.text = widget.product.qty.toString();
      totalController.text = widget.product.total.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setInitData();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit'),
      content: Container(
        height: 500,
        width: 400,
        child: Column(
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
                'cancel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          child: MaterialButton(
            onPressed: () async {
              if (priceController.text.isNotEmpty &&
                  productController.text.isNotEmpty &&
                  qtyController.text.isNotEmpty &&
                  totalController.text.isNotEmpty) {
                getxController.updatProduct(Product(
                    code: widget.product.code,
                    name: productController.text,
                    qty: int.parse(qtyController.text),
                    price: double.parse(priceController.text),
                    total: double.parse(totalController.text)));
                clearText();
                Get.back();
              } else {
                Get.back();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Message'),
                    content: const Text('Something was null'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('OK'))
                    ],
                  ),
                );
              }
            },
            child: const Center(
              child: Text(
                'save',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
