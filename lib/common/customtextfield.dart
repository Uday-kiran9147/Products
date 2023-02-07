import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  CustomTextFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: (val)=>{},
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
    );
  }
}
