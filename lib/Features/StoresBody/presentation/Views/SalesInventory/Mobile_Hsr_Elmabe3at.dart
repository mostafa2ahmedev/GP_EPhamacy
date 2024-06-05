import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListViewOfSalesInventory.dart';

import 'package:gppharmacy/Utils/AppStyles.dart';

import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileHsrElmabe3at extends StatefulWidget {
  const MobileHsrElmabe3at({super.key});

  @override
  State<MobileHsrElmabe3at> createState() => _MobileHsrElmabe3atState();
}

class _MobileHsrElmabe3atState extends State<MobileHsrElmabe3at> {
  String? monthValue;
  int? intMonthValue;
  String? yearValue;
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

    BlocProvider.of<SalesInventoryCubit>(context).salesInventoryList = [];
  }

  @override
  Widget build(BuildContext context) {
    var storCubit = BlocProvider.of<SalesInventoryCubit>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).HsrElmbe3at,
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
                    storCubit.getSalesInventory(
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
              height: 20,
            ),
            BlocBuilder<SalesInventoryCubit, SalesInventoryStates>(
              builder: (context, state) {
                if (state is GetSalesInventoryLoadingState) {
                  return const CustomLoadingIndicator();
                }
                if (state is GetSalesInventorySuccessState ||
                    state is GetSalesInventoryItemDetailsSuccessState) {
                  return const ListViewOfSalesInventory();
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
