import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileImports extends StatefulWidget {
  const MobileImports({super.key});

  @override
  State<MobileImports> createState() => _MobileImportsState();
}

class _MobileImportsState extends State<MobileImports> {
  late TextEditingController controller;
  String wayOfSearch = "طلب الامداد";
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).ViewOldOrders,
            style: AppStyles.styleBold28(context),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                  controller: controller,
                  hintText: 'ادخل $wayOfSearch',
                  hintStyle: AppStyles.styleRegular16(context)
                      .copyWith(color: Colors.grey),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomDropDownButton(
                  isExpanded: true,
                  items: const [
                    'طلب الامداد',
                    'اسم الدواء',
                  ],
                  hint: wayOfSearch,
                  onChanged: (value) {
                    setState(() {
                      wayOfSearch = value!;
                    });
                  },
                  value: wayOfSearch,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: CustomButton(
                text: S.of(context).Search,
                buttonColor: (controller.text.isNotEmpty)
                    ? Theme.of(context).drawerTheme.backgroundColor!
                    : ColorManeger.colorDisabled,
                ontap: () {
                  if (controller.text.isNotEmpty) {}
                }),
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
