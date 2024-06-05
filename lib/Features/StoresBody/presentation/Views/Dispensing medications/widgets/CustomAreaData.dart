import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';

class CustomAreaDataForMedicine extends StatelessWidget {
  const CustomAreaDataForMedicine(
      {super.key,
      required this.arbNameController,
      required this.engNameController,
      required this.strNameController,
      required this.activeIngNameController,
      required this.manufController,
      required this.alertDaysController,
      required this.codeController,
      required this.alertAmountController,
      required this.formKey,
      this.autovalidateMode});
  final TextEditingController arbNameController;
  final TextEditingController engNameController;
  final TextEditingController strNameController;
  final TextEditingController activeIngNameController;
  final TextEditingController manufController;
  final TextEditingController alertDaysController;
  final TextEditingController codeController;
  final TextEditingController alertAmountController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
              validator: (v) {
                if (v?.isEmpty ?? true) {
                  return 'ادخل اسم العربي للدواء';
                }
                return null;
              },
              autovalidateMode: autovalidateMode,
              controller: arbNameController,
              label: 'اسم الدواء (عربي)',
              suffixIcon: const Icon(FontAwesomeIcons.pills)),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
              validator: (v) {
                if (v?.isEmpty ?? true) {
                  return 'ادخل اسم العربي للدواء';
                }
                return null;
              },
              autovalidateMode: autovalidateMode,
              controller: engNameController,
              label: 'اسم الدواء (انجليزي)',
              suffixIcon: const Icon(FontAwesomeIcons.pills)),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            controller: activeIngNameController,
            label: 'الماده الفعاله',
            suffixIcon: const Icon(Icons.medical_information),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            controller: strNameController,
            keyboardType: TextInputType.number,
            label: 'التركيز',
            suffixIcon: const Icon(FontAwesomeIcons.zero),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'ادخل الشركه المصنعه للدواء';
              }
              return null;
            },
            autovalidateMode: autovalidateMode,
            controller: manufController,
            label: 'الشركه المصنعه',
            suffixIcon: const Icon(Icons.apartment),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'ادخل كود الدواء';
              }
              return null;
            },
            autovalidateMode: autovalidateMode,
            controller: codeController,
            keyboardType: TextInputType.number,
            label: 'كود العنصر',
            suffixIcon: const Icon(Icons.numbers),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            autovalidateMode: autovalidateMode,
            controller: alertAmountController,
            keyboardType: TextInputType.number,
            label: 'التنبيه قبل (كميه)',
            suffixIcon: const Icon(Icons.alarm),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            autovalidateMode: autovalidateMode,
            controller: alertDaysController,
            keyboardType: TextInputType.number,
            label: 'التنبيه قبل (يوم)',
            suffixIcon: const Icon(Icons.date_range),
          ),
        ],
      ),
    );
  }
}
