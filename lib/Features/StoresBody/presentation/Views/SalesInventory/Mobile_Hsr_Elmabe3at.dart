import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/ListViewOfSalesInventory.dart';

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
  Widget build(BuildContext context) {
    return BlocConsumer<SalesInventoryCubit, SalesInventoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var storCubit = BlocProvider.of<SalesInventoryCubit>(context);
        var authCubit = BlocProvider.of<AuthCubit>(context);
        if (state is GetSalesInventoryLoadingState) {
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
                      items: items,
                      hint: 'اختر الشهر',
                      onChanged: (value) {
                        setState(() {
                          monthValue = value;
                          intMonthValue = items.indexOf(value!) + 1;
                          print(intMonthValue);
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
                          token: authCubit.user!.token);
                    }
                  },
                  text: S.of(context).Search,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              storCubit.salesInventoryList.isEmpty
                  ? Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        decoration: BoxDecoration(
                          color: ColorManeger.colorDisabled,
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
                  : const ListViewOfSalesInventory(),
            ],
          ),
        );
      },
    );
  }
}













  // const CustomBottomSheetItem(),
  //         FloatingActionButton(
  //           onPressed: () {
  //             showDialog(
  //               barrierDismissible: false,
  //               context: context,
  //               builder: (context) {
  //                 return Dialog(
  //                   insetPadding: const EdgeInsets.symmetric(horizontal: 20),
  //                   child: SizedBox(
  //                     height: 200,
  //                     child: SimpleDialog(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       title: const Text('Flutter'),
  //                       children: const [
  //                         Text('Flutter'),
  //                         Text('Flutter'),
  //                         Text('Flutter'),
  //                         Text('Flutter'),
  //                         Text('Flutter'),
  //                         Text('Flutter'),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             );
  //           },
  //         )