import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:intl/intl.dart';

class CustomBottomSheetItem extends StatefulWidget {
  const CustomBottomSheetItem({super.key});

  @override
  State<CustomBottomSheetItem> createState() => _CustomBottomSheetItemState();
}

class _CustomBottomSheetItemState extends State<CustomBottomSheetItem> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      focusColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          showDragHandle: true,
          isDismissible: false,
          elevation: 5,
          context: context,
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'اضافه طلبيه جديده',
                      style: AppStyles.styleMeduim16(context),
                    ),
                    const AuthTextField(
                      label: 'طلب الامداد',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const AuthTextField(
                      label: 'اذن التسليم',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: CustomDropDownButton(items: [], hint: 'hint'),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            MethodHelper.showIDialog(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Icon(Icons.car_rental),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AuthTextField(
                      controller: controller,
                      label: 'تاريخ التوريد',
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            // if (newpickedDate!= null) {}
                            var pickedDate = DateTime.now();
                            var newpickedDate = await MethodHelper.showIpiker(
                              context,
                              pickedDate,
                            );
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(newpickedDate!);
                            controller.text = formattedDate;
                          },
                          child: const Icon(Icons.abc)),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
