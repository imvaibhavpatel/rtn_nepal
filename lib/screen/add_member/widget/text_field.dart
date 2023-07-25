import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    Key? key,
    required this.hintText,
    this.validation,
    this.controller,
    this.suffixIcon,
    this.onTap,
    this.maxLine,
  }) : super(key: key);

  final String hintText;
  final FormFieldValidator? validation;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        maxLines: maxLine,
        validator: validation,
        cursorHeight: 0,
        cursorWidth: 0,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        onTap: onTap,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
