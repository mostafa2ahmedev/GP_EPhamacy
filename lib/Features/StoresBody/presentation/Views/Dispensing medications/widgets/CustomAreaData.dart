import 'package:flutter/material.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';

class CustomAreaData extends StatelessWidget {
  const CustomAreaData(
      {super.key,
      required this.arbNameController,
      required this.engNameController,
      required this.strNameController,
      required this.activeIngNameController,
      required this.manufController,
      required this.alertDaysController,
      required this.codeController,
      required this.alertAmountController});
  final TextEditingController arbNameController;
  final TextEditingController engNameController;
  final TextEditingController strNameController;
  final TextEditingController activeIngNameController;
  final TextEditingController manufController;
  final TextEditingController alertDaysController;
  final TextEditingController codeController;
  final TextEditingController alertAmountController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: arbNameController,
          label: 'اسم الدواء (عربي)',
          suffixIcon: const Icon(Icons.language),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: engNameController,
          label: 'اسم الدواء (انجليزي)',
          suffixIcon: const Icon(Icons.abc),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: activeIngNameController,
          label: 'الماده الفعاله',
          suffixIcon: const Icon(Icons.abc),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: strNameController,
          keyboardType: TextInputType.number,
          label: 'التركيز',
          suffixIcon: const Icon(Icons.abc),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: manufController,
          label: 'الشركه المصنعه',
          suffixIcon: const Icon(Icons.abc),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: codeController,
          keyboardType: TextInputType.number,
          label: 'كود العنصر',
          suffixIcon: const Icon(Icons.handshake),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: alertAmountController,
          keyboardType: TextInputType.number,
          label: 'التنبيه قبل (كميه)',
          suffixIcon: const Icon(Icons.alarm),
        ),
        const SizedBox(
          height: 12,
        ),
        AuthTextField(
          controller: alertDaysController,
          keyboardType: TextInputType.number,
          label: 'التنبيه قبل (يوم)',
          suffixIcon: const Icon(Icons.alarm),
        ),
      ],
    );
  }
}
