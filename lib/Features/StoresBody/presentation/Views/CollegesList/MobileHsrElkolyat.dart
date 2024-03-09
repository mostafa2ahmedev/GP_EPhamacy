import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/widgets/ListViewOfCollegesList.dart';

import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<CollegesCubit, CollegesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var collegesCubit = BlocProvider.of<CollegesCubit>(context);
        var authCubit = BlocProvider.of<AuthCubit>(context);
        if (state is getCollegesListLoadingState) {
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
                S.of(context).HsrElkolyat,
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
                          token: authCubit.user.token);
                    }
                  },
                  text: S.of(context).Search,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              collegesCubit.collegesList.isEmpty
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
                  : const ListViewOfCollegesList(),
            ],
          ),
        );
      },
    );
  }
}
