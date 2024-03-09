import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';
import 'package:gppharmacy/Features/Patients/Presentation/widgets/ListViewOfPatient.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  String wayOfSearch = 'الرقم القومي للطالب';
  String? typeOfDisease;
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PateintCubit>(context).fetchAllPateint();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).AllPatient,
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
                  items: const [
                    'الرقم القومي للطالب',
                    'اسم الطالب',
                  ],
                  hint: 'الرقم القومي للطالب',
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
                  items: const ['مرض مزمن', 'مرض غير مزمن'],
                  hint: 'اختر نوع المرض',
                  onChanged: (value) {
                    setState(() {
                      typeOfDisease = value;
                    });
                  },
                  value: typeOfDisease,
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
                controller: controller,
                hintText: 'ادخل $wayOfSearch',
                hintStyle: AppStyles.styleRegular16(context)
                    .copyWith(color: Colors.grey)),
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: CustomButton(
              buttonColor: (typeOfDisease != null && controller.text.isNotEmpty)
                  ? Theme.of(context).drawerTheme.backgroundColor!
                  : ColorManeger.colorDisabled,
              ontap: () {
                if (controller.text.isNotEmpty && typeOfDisease != null) {}
              },
              text: S.of(context).Search,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<PateintCubit, PateintCubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PatientFaliureState) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: ColorManeger.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        state.errMsq,
                        style: AppStyles.styleBold16(context),
                      ),
                    ),
                  ),
                );
              } else if (state is PatientSuccessState ||
                  state is PatientSearchingState) {
                return ListViewOfPatient(
                  patients: BlocProvider.of<PateintCubit>(context).searched,
                );
              } else {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: ColorManeger.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
