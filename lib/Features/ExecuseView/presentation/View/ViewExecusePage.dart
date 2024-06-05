import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_state.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/widgets/ListTileForCollegesList.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListViewOfSalesInventory.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class ExecuseView extends StatefulWidget {
  const ExecuseView({super.key});

  @override
  State<ExecuseView> createState() => _ExecuseViewState();
}

class _ExecuseViewState extends State<ExecuseView> {
  String wayOfSearch = 'اسم الدواء';
  String? typeValue;
  int selectedItem = 0;
  List<String> items = [
    'اسم الدواء',
    'رقم الاذن',
    'اسم الكليه',
    'اسم الدواء باللغه العربيه'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).ExecuseView,
              style: AppStyles.styleBold32(context),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: AuthTextField(
                      label: 'ادخل $wayOfSearch',
                      onChanged: (value) {
                        // cubit.searchingInMedicineDataList(
                        //     typeOfSearch: wayOfSearch, searchedText: value);
                      },
                      hintStyle: AppStyles.styleRegular16(context)
                          .copyWith(color: Colors.grey)),
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
            Center(
              child: CustomButton(
                buttonColor: (typeValue != null)
                    ? Theme.of(context).drawerTheme.backgroundColor!
                    : ColorManeger.colorDisabled,
                ontap: () {
                  if (typeValue != null) {
                    BlocProvider.of<ExecuseCollegesCubit>(context)
                        .getCollegesExecuse();
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
              height: 20,
            ),
            BlocBuilder<ExecuseCollegesCubit, ExecuseCollegesState>(
              builder: (context, state) {
                if (state is ExecuseCollegesLoadingState) {
                  return const CustomLoadingIndicator();
                }
                if (state is ExecuseCollegesSuccessState) {
                  return const ListViewForExecuseColleges();
                }
                return const CustomNoDataContainer();
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
