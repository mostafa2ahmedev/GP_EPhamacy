import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.hintText,
      required this.hintStyle,
      this.validator,
      this.onSubmitted,
      this.icon,
      this.suffixIcon,
      this.controller,
      this.onChanged});
  final String hintText;
  final TextStyle hintStyle;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: BuildBorder(true),
        focusedBorder: BuildBorder(false),
      ),
    );
  }

  OutlineInputBorder BuildBorder(bool isEnabled) {
    return OutlineInputBorder(
      borderSide: isEnabled
          ? const BorderSide(color: Colors.grey)
          : const BorderSide(color: ColorManeger.lightPrimaryColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
