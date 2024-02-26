import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String data = 'حصر المبيعات';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: data,
      items: getDropDownItems(),
      onChanged: (value) {
        setState(() {
          data = value!;
        });
      },
    );
  }
}

List<DropdownMenuItem<String>> getDropDownItems() {
  return List.generate(
    dropDownItems.length,
    (index) => DropdownMenuItem(
      value: dropDownItems[index],
      child: Text(dropDownItems[index]),
    ),
  );
}

List<String> dropDownItems = ["حصر الكميات", 'حصر المبيعات', "صافي الربح"];
