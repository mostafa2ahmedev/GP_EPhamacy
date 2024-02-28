import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {super.key,
      required this.items,
      this.onChanged,
      required this.hint,
      this.isExpanded = false,
      this.value});
  final List<String> items;
  final void Function(String?)? onChanged;
  final String hint;
  final bool isExpanded;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(12),
        focusColor: Colors.grey.withOpacity(0.3),
        iconEnabledColor: Colors.black,
        elevation: 1,
        menuMaxHeight: 400,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        value: value,
        underline: const SizedBox(),
        isExpanded: isExpanded,
        hint: Text(hint),
        items: MethodHelper.getDropDownItems(items),
        onChanged: onChanged,
      ),
    );
  }
}
