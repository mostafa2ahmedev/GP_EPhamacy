import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Widgets/ListViewForMedicineList.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
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

    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
    BlocProvider.of<MedicineCubit>(context).searchedList = [];
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicineCubit>(context);
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
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AuthTextField(
                label: 'ادخل $wayOfSearch',
                onChanged: (value) {
                  cubit.searchingInMedicineDataList(
                      typeOfSearch: wayOfSearch, searchedText: value);
                },
                hintStyle: AppStyles.styleRegular16(context)
                    .copyWith(color: Colors.grey)),
          ),
          const SizedBox(
            height: 16,
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
                }
              },
              child: Text(
                S.of(context).Search,
                style: AppStyles.styleMeduim16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<MedicineCubit, MedicineState>(
            builder: (context, state) {
              if (state is GetMedicineDataLoadingState) {
                return const CustomLoadingIndicator();
              }
              if (state is GetMedicineDataSuccessState) {
                return ListViewOfMedicineList(
                    searchedList:
                        BlocProvider.of<MedicineCubit>(context).searchedList);
              }
              return const CustomNoDataContainer();
            },
          )
        ],
      ),
    );
  }
}
