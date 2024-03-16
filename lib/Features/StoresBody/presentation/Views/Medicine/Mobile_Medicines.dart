import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/medicineCategoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Widgets/ListViewForMedicineList.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileMedicines extends StatefulWidget {
  const MobileMedicines({super.key});

  @override
  State<MobileMedicines> createState() => _MobileMedicinesState();
}

class _MobileMedicinesState extends State<MobileMedicines> {
  String wayOfSearch = 'اسم الدواء';
  String? typeValue;
  late TextEditingController controller;
  int selectedItem = 0;
  List<String> items = const [
    'الأقراص',
    'امبولات',
    'منوعات',
    'جميع الانواع',
  ];
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
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MedicineCubit>(context);
        if (state is GetMedicineDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Medicines,
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
                      items: const ['اسم الدواء', 'كود الدواء'],
                      hint: 'ادخل $wayOfSearch',
                      onChanged: (value) {
                        setState(() {
                          wayOfSearch = value!;
                        });
                      },
                      value: wayOfSearch,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CustomDropDownButton(
                      isExpanded: true,
                      items: items,
                      hint: 'اختر نوع الدواء',
                      onChanged: (value) {
                        setState(() {
                          typeValue = value;
                        });
                        selectedItem = items.indexOf(value!) + 1;
                      },
                      value: typeValue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AuthTextField(
                    onChanged: (value) {
                      cubit.searchingInMedicineDataList(
                          typeOfSearch: wayOfSearch, searchedText: value);
                    },
                    hintText: 'ادخل $wayOfSearch',
                    hintStyle: AppStyles.styleRegular16(context)
                        .copyWith(color: Colors.grey)),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: CustomButton(
                  buttonColor: (typeValue != null)
                      ? Theme.of(context).drawerTheme.backgroundColor!
                      : ColorManeger.colorDisabled,
                  ontap: () {
                    if (typeValue != null) {
                      BlocProvider.of<MedicineCubit>(context)
                          .getMedicineData(typeOfSearch: selectedItem);
                      print('a7a');
                    }
                  },
                  text: S.of(context).Search,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              cubit.searchedList.isNotEmpty
                  ? ListViewOfMedicineList(medicineModel: cubit.searchedList)
                  : Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
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
                    ),
            ],
          ),
        );
      },
    );
  }
}
