import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';
import 'package:gppharmacy/Features/Patients/Presentation/widgets/ListViewOfPatient.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  String wayOfSearch = 'الرقم القومي للطالب';
  String typeOfDisease = 'الكل';
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PateintCubit>(context).fetchAllPateint();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
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
              S.of(context).AllPatient,
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
                    items: const ['الكل', 'مريض مزمن', 'مريض غير مزمن'],
                    hint: 'اختر نوع المريض',
                    onChanged: (value) {
                      setState(() {
                        typeOfDisease = value!;
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
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: AuthTextField(
                onChanged: (value) => BlocProvider.of<PateintCubit>(context)
                    .searchByName(value, wayOfSearch, typeOfDisease),
                controller: controller,
                label: 'ادخل $wayOfSearch',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<PateintCubit, PateintCubitState>(
              builder: (context, state) {
                if (state is PatientFaliureState) {
                  return const CustomFailureWidget();
                } else if (state is PatientSuccessState) {
                  return ListViewOfPatient(
                    patients: BlocProvider.of<PateintCubit>(context).searched,
                  );
                } else if (state is PatientLoadingState) {
                  return const CustomLoadingIndicator();
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
