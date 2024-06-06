import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

import 'package:gppharmacy/Utils/Methods_Helper.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {super.key,
      required this.items,
      this.onChanged,
      required this.hint,
      this.isExpanded = false,
      this.value,
      this.disabledHint});
  final List<String> items;
  final void Function(String?)? onChanged;
  final String hint;
  final bool isExpanded;
  final String? value;
  final Widget? disabledHint;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: DropdownButton(
        disabledHint: disabledHint,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        menuMaxHeight: 400,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        value: value,
        underline: const SizedBox(),
        isExpanded: isExpanded,
        hint: Text(
          hint,
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
        items: MethodHelper.getDropDownItems(items),
        style: AppStyles.styleBold20(context).copyWith(color: Colors.blue),
        onChanged: onChanged,
      ),
    );
  }
}

class CustomDropDownButtonCustom extends StatelessWidget {
  const CustomDropDownButtonCustom({
    super.key,
    required this.items,
    this.onChanged,
    required this.hint,
    this.isExpanded = false,
    this.value,
    this.disabledHint,
  });

  final List<String> items;
  final void Function(String?)? onChanged;
  final String hint;
  final bool isExpanded;
  final String? value;
  final Widget? disabledHint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: DropdownButton<String>(
        disabledHint: disabledHint,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        menuMaxHeight: 400,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        value: value,
        underline: const SizedBox(),
        isExpanded: isExpanded,
        hint: Text(
          hint,
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
              ),
            ),
          );
        }).toList(),
        style: AppStyles.styleBold20(context).copyWith(color: Colors.blue),
        onChanged: onChanged,
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((String item) {
            return Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
