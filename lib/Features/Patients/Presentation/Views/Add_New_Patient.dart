import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Patients/Presentation/Views/widgets/CustomAreaForPatients.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

import '../../../Auth/Presentation/widgets/Custom_Button.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  late TextEditingController studentName;
  late TextEditingController idCollege;
  late TextEditingController phoneNubmer;
  late TextEditingController idMain;
  late TextEditingController age;
  late GlobalKey<FormState> formKey;

  AutovalidateMode? autovalidateMode;

  @override
  void initState() {
    super.initState();
    studentName = TextEditingController();
    idCollege = TextEditingController();
    phoneNubmer = TextEditingController();
    idMain = TextEditingController();
    age = TextEditingController();
    formKey = GlobalKey();
  }

  @override
  void dispose() {
    studentName.dispose();
    idCollege.dispose();
    phoneNubmer.dispose();
    idMain.dispose();
    age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAreaForNewPatient(
              age: age,
              idCollege: idCollege,
              idMain: idMain,
              studentName: studentName,
              phoneNubmer: phoneNubmer,
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                      } else {}
                    },
                    buttonColor: Theme.of(context).drawerTheme.backgroundColor!,
                    child: Text(
                      'اضافه المريض',
                      style: AppStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: CustomButton(
                    ontap: () {
                      age.text = '';
                      idMain.text = '';
                      idCollege.text = '';
                      studentName.text = '';
                    },
                    buttonColor: Colors.red,
                    child: Text(
                      'اعاده ضبط للداتا',
                      style: AppStyles.styleBold16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
