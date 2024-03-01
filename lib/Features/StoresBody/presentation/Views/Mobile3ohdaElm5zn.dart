import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class Mobile3ohdaElm5zn extends StatefulWidget {
  const Mobile3ohdaElm5zn({super.key});

  @override
  State<Mobile3ohdaElm5zn> createState() => _Mobile3ohdaElm5znState();
}

class _Mobile3ohdaElm5znState extends State<Mobile3ohdaElm5zn> {
  String wayOfSearch = 'الباركود الخاص بالدواء';
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
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
            S.of(context).H3ohdeElm5zn,
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
              )),
              Expanded(
                child: CustomDropDownButton(
                  isExpanded: true,
                  items: const [
                    'الباركود الخاص بالدواء',
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
