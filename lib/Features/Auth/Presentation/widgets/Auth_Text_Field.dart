import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.hintStyle,
    this.validator,
    this.onSubmitted,
    required this.icon,
    this.ontap,
  });
  final String hintText;
  final TextStyle hintStyle;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String icon;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: ontap,
            child: SvgPicture.asset(icon),
          ),
        ),
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
          : const BorderSide(color: ColorManeger.primaryColor),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
