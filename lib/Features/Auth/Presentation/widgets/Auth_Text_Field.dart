import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.hintText,
      this.hintStyle,
      this.onSubmitted,
      this.validator,
      this.icon,
      this.suffixIcon,
      this.controller,
      this.onChanged,
      this.keyboardType,
      this.label,
      this.onSaved,
      this.autovalidateMode,
      this.obscureText,
      this.enabled});
  final String? hintText;
  final TextStyle? hintStyle;
  final Function(String)? onSubmitted;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final bool? obscureText;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        enabled: enabled,
        obscureText: obscureText ?? false,
        autovalidateMode: autovalidateMode,
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        onSaved: onSaved,
        decoration: InputDecoration(
          label: FittedBox(fit: BoxFit.scaleDown, child: Text(label ?? '')),
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: BuildBorder(1),
          focusedBorder: BuildBorder(2, context: context),
          errorBorder: BuildBorder(3),
          focusedErrorBorder: BuildBorder(4),
        ),
      ),
    );
  }

  OutlineInputBorder BuildBorder(int isEnabled,
      {@required BuildContext? context}) {
    return OutlineInputBorder(
      borderSide: isEnabled == 1
          ? const BorderSide(color: Colors.grey)
          : isEnabled == 2
              ? BorderSide(
                  color: Theme.of(context!).drawerTheme.backgroundColor!)
              : const BorderSide(
                  color: Colors.red,
                ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

class TextFieldForEditData extends StatefulWidget {
  const TextFieldForEditData(
      {super.key,
      required this.label,
      this.editedDataStr,
      this.edidtedDataInt,
      this.suffixIcon});
  final String label;
  final String? editedDataStr;
  final int? edidtedDataInt;
  final Widget? suffixIcon;

  @override
  State<TextFieldForEditData> createState() => _TextFieldForEditDataState();
}

class _TextFieldForEditDataState extends State<TextFieldForEditData> {
  @override
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(
        text: widget.editedDataStr ?? widget.edidtedDataInt.toString());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(
          widget.label ?? '',
          style: AppStyles.styleMeduim16(context).copyWith(color: Colors.grey),
        ),
        suffixIcon: widget.suffixIcon,
        hintStyle: const TextStyle(color: Colors.grey),
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
