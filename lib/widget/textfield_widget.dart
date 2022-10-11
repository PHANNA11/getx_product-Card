import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {Key? key,
      required this.inputOnlyNumer,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.readOnly,
      required this.onChanged})
      : super(key: key);
  Function(dynamic)? onChanged;
  TextEditingController controller;
  String label;
  String hintText;
  bool readOnly = true;
  bool inputOnlyNumer = false;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType:
            widget.inputOnlyNumer == true ? TextInputType.number : null,
        onChanged: widget.onChanged,
        controller: widget.controller,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
