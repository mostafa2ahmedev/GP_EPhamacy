import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_state.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/widgets/ListViewOfCollegesList.dart';

import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileHsrElkolyat extends StatefulWidget {
  const MobileHsrElkolyat({super.key});

  @override
  State<MobileHsrElkolyat> createState() => _MobileHsrElkolyatState();
}

class _MobileHsrElkolyatState extends State<MobileHsrElkolyat> {
  String? monthValue;
  int? intMonthValue;
  String? yearValue;
  Color buttonColor = Colors.blueGrey;
  List<String> items = const [
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
  ];

  @override
  void initState() {
    super.initState();
    var collegesCubit = BlocProvider.of<CollegesCubit>(context);
    collegesCubit.collegesList = [];
  }

  @override
  Widget build(BuildContext context) {
    var collegesCubit = BlocProvider.of<CollegesCubit>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).HsrElkolyat,
              style: AppStyles.styleBold32(context),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDropDownButton(
                    isExpanded: true,
                    items: items,
                    hint: 'اختر الشهر',
                    onChanged: (value) {
                      setState(() {
                        monthValue = value;
                        intMonthValue = items.indexOf(value!) + 1;
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
                buttonColor: (monthValue != null && yearValue != null)
                    ? Theme.of(context).drawerTheme.backgroundColor!
                    : ColorManeger.colorDisabled,
                ontap: () {
                  if (monthValue != null && yearValue != null) {
                    collegesCubit.getCollegesList(
                      query: {"month": intMonthValue, "year": yearValue},
                    );
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
            BlocBuilder<CollegesCubit, CollegesState>(
              builder: (context, state) {
                if (state is GetCollegesListLoadingState) {
                  return const CustomLoadingIndicator();
                } else if (state is GetCollegesListSuccessState) {
                  return const ListViewOfCollegesList();
                } else if (state is GetCollegesListFailureState) {
                  return const CustomFailureWidget();
                } else {
                  return const CustomNoDataContainer();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
