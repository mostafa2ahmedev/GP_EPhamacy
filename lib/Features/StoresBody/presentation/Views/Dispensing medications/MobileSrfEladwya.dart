import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/ListViewForDispensingMedications.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileSrfEladwya extends StatefulWidget {
  const MobileSrfEladwya({super.key});

  @override
  State<MobileSrfEladwya> createState() => _MobileSrfEladwyaState();
}

class _MobileSrfEladwyaState extends State<MobileSrfEladwya> {
  String wayOfSearch = 'رقم الروشته';
  String? typeOfRosheta;
  int? index;
  List<String> items = const [
    'روشتات المزمن',
    'روشتات الغير مزمن',
    'جميع الروشتات',
    'الروشتات المصروفه',
  ];

  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var srfCubit = BlocProvider.of<DispensingMedicationsCubit>(context);
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
                  items: const ['رقم الروشته', 'اسم الدواء', 'اسم الطالب'],
                  hint: wayOfSearch,
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
                  hint: 'اختر نوع الروشته',
                  onChanged: (value) {
                    setState(() {
                      typeOfRosheta = value;
                    });
                    index = items.indexOf(value!) + 1;
                  },
                  value: typeOfRosheta,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: AuthTextField(
                label: 'ادخل $wayOfSearch',
                onChanged: (value) {
                  srfCubit.searchingInPrescriptionList(
                      wayOfSearch: wayOfSearch, text: value);
                },
                controller: controller,
              )),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: CustomButton(
              buttonColor: (typeOfRosheta != null)
                  ? Theme.of(context).drawerTheme.backgroundColor!
                  : ColorManeger.colorDisabled,
              ontap: () {
                if (typeOfRosheta != null) {
                  srfCubit.getPrescriptionData(indexToSearch: index);
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
          BlocBuilder<DispensingMedicationsCubit, DispensingMedicationsState>(
            builder: (context, state) {
              if (state is GetPrescriptionDataLoadingState) {
                return const CustomLoadingIndicator();
              } else if (state is GetPrescriptionDataSuccessState) {
                return ListViewOfDispensingMedications(
                    presriptionList:
                        BlocProvider.of<DispensingMedicationsCubit>(context)
                            .searchedPrescriptionList);
              } else if (state is GetPrescriptionDataFailureState) {
                return const CustomFailureWidget();
              } else {
                return const CustomNoDataContainer();
              }
            },
          )
        ],
      ),
    );
  }
}
