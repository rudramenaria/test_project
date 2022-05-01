import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool? obscure;
  final String? Function(String? value)? validator;
  const AppTextFormField({this.decoration,this.controller,this.obscure,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: decoration,
      obscureText: obscure ?? false,
    );
  }
}