import 'package:doan_chuyen_nganh/widget/text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.labelText,
      required this.obscureText,
      required this.controllerName})
      : super(key: key);

  final String labelText;
  final bool obscureText;
  TextEditingController controllerName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerName,
      obscureText: obscureText,
      style: AppTextStyle.style(
        color: Colors.black.withOpacity(0.8),
      ),
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.8)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.8)),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.8)),
        ),
        labelStyle: AppTextStyle.style(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
