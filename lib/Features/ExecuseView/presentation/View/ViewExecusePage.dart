import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';

import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_state.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListViewOfSalesInventory.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

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
  void initState() {
    super.initState();
    BlocProvider.of<ExecuseCollegesCubit>(context).getCollegesExecuse();
  }

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
                      BlocProvider.of<ExecuseCollegesCubit>(context)
                          .searchingInCollegesDataList(
                              typeOfSearch: typeValue!, searchedText: value);
                    },
                    hintStyle: AppStyles.styleRegular16(context)
                        .copyWith(color: Colors.grey),
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
            BlocBuilder<ExecuseCollegesCubit, ExecuseCollegesState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<ExecuseCollegesCubit>(context);
                if (state is ExecuseCollegesLoadingState) {
                  return const CustomLoadingIndicator();
                }
                if (state is ExecuseCollegesSuccessState) {
                  return ListViewForExecuseColleges(
                      usageCollege: cubit.searchedColleges);
                }
                return const CustomNoDataContainer();
              },
            )
          ],
        ),
      ),
    );
  }
}
