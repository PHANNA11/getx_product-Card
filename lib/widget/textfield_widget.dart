import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.readOnly})
      : super(key: key);
  TextEditingController controller;
  String label;
  String hintText;
  bool readOnly = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
