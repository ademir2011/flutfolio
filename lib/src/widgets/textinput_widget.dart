import 'package:flutter/material.dart';

class TextFormInputWidget extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const TextFormInputWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        focusColor: Theme.of(context).primaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      validator: validator,
    );
  }
}
