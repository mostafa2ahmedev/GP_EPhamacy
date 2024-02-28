import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileHsrElmabe3at extends StatefulWidget {
  const MobileHsrElmabe3at({super.key});

  @override
  State<MobileHsrElmabe3at> createState() => _MobileHsrElmabe3atState();
}

class _MobileHsrElmabe3atState extends State<MobileHsrElmabe3at> {
  String? monthValue;
  String? yearValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).HsrElmbe3at,
            style: AppStyles.styleBold28(context),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: CustomDropDownButton(
                  isExpanded: true,
                  items: const [
                    'يناير',
                    'فبراير',
                    'مارس',
                    'ابريل',
                    'مايو',
                    'يونيو',
                    'يوليو',
                    'اغسطس',
                    'سبتمبر',
                    'اكتوبر',
                    'نوفمبر',
                    'ديسمبر'
                  ],
                  hint: 'اختر الشهر',
                  onChanged: (value) {
                    setState(() {
                      monthValue = value;
                    });
                  },
                  value: monthValue,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomDropDownButton(
                  isExpanded: true,
                  items: const [
                    '2020',
                    '2021',
                    '2022',
                    '2023',
                    '2024',
                    '2025',
                    '2026',
                    '2027',
                    '2028',
                    '2029',
                    '2030',
                  ],
                  hint: 'اختر السنه',
                  onChanged: (value) {
                    setState(() {
                      yearValue = value;
                    });
                  },
                  value: yearValue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: CustomButton(
              ontap: () {},
              text: S.of(context).Search,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: ColorManeger.lightPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'عذرا حدث خطا ما يرجي المحاوله لاحقا',
                  style: AppStyles.styleBold16(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
