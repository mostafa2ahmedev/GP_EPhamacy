import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';

import 'package:gppharmacy/Features/Patients/data/Disease_Model.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailurewidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../Utils/Widgets/CustomDropDownButton.dart';
import '../../../../generated/l10n.dart';
import '../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../Auth/Presentation/widgets/Custom_Button.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({super.key});

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  late TextEditingController name;
  late TextEditingController nationalId;
  late TextEditingController studentId;
  late TextEditingController chronic;
  late TextEditingController age;
  late TextEditingController phoneNubmer;
  String? rankValue;
  String? genderValue;
  String? dieseaseValue;
  String? collegeValue;
  bool isClicked = false;
  int? currentIndex;
  late GlobalKey<FormState> formKey;

  List<DiseaseModel> selectedDiseases = [];

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isChronic = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    nationalId = TextEditingController();
    studentId = TextEditingController();

    chronic = TextEditingController();

    age = TextEditingController();
    phoneNubmer = TextEditingController();
    formKey = GlobalKey();
    BlocProvider.of<PateintCubit>(context).getAllChronicDieases();
  }

  @override
  void dispose() {
    name.dispose();
    studentId.dispose();
    phoneNubmer.dispose();
    nationalId.dispose();
    age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).AddNewPatient,
                style: AppStyles.styleBold32(context),
              ),
              BlocConsumer<PateintCubit, PateintCubitState>(
                listener: (context, state) {
                  if (state is PostPatientDataSuccessState) {
                    MethodHelper.showToast(
                        message: "تم اضافه المريض بنجاح", type: true);
                  } else if (state is PostPatientDataFailureState) {
                    MethodHelper.showToast(
                        message: "حدثت مشكله اثناء الاضافه", type: false);
                  }
                },
                builder: (context, state) {
                  return state is GetDiseasesLoadingState
                      ? CustomLoadingIndicator()
                      : state is GetDiseasesFailureState
                          ? CustomFailureWidget()
                          : Form(
                              autovalidateMode: autovalidateMode,
                              key: formKey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  AuthTextField(
                                    validator: (v) {
                                      if (v?.isEmpty ?? true) {
                                        return 'ادخل اسم الطالب';
                                      }
                                      return null;
                                    },
                                    controller: name,
                                    label: 'اسم الطالب (عربي)',
                                    suffixIcon: const Icon(Icons.language),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    keyboardType: TextInputType.number,
                                    controller: studentId,
                                    label: 'الرقم الجامعي',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (v) {
                                      if (v?.isEmpty ?? true) {
                                        return 'ادخل الرقم الجامعي';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    keyboardType: TextInputType.number,
                                    validator: (v) {
                                      if (v!.length < 11 || v.length > 11) {
                                        return 'ادخل 11 رقم فقط';
                                      }
                                      return null;
                                    },
                                    controller: phoneNubmer,
                                    label: 'رقم الهاتف',
                                    suffixIcon: const Icon(Icons.abc),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    validator: (v) {
                                      if (v!.length < 14 || v.length > 14) {
                                        return 'ادخل 14 رقم فقط';
                                      }
                                      return null;
                                    },
                                    controller: nationalId,
                                    keyboardType: TextInputType.number,
                                    label: 'الرقم القومي',
                                    suffixIcon: const Icon(Icons.abc),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    validator: (v) {
                                      if (v?.isEmpty ?? true) {
                                        return 'ادخل السن';
                                      }
                                      return null;
                                    },
                                    controller: age,
                                    label: 'السن',
                                    suffixIcon: const Icon(Icons.abc),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomDropDownButton(
                                    items: const [
                                      'كلية الهندسة بشيرا',
                                      'كلية الهندسة بينها',
                                      'كلية الحاسبات والذكاء الإصطناعي',
                                      'كلية العلوم',
                                      'كلية الزراعة',
                                      'كلية الفنون التطبيقية',
                                      'كلية التجارة',
                                      'كلية التربية',
                                      'كلية التربية النوعية',
                                      'كلية التربية الرياضية',
                                      'كلية الحقوق',
                                      'كلية الآداب',
                                      'كلية الطب البشري',
                                      'كلية الطب البيطري',
                                      'كلية التمريض',
                                      'كلية العلاج الطبيعي',
                                    ],
                                    hint: 'اختر الكليه',
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        collegeValue = value;
                                      });
                                    },
                                    value: collegeValue,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomDropDownButton(
                                    items: const [
                                      'الفرقة الأولى',
                                      'الفرقة الثانية',
                                      'الفرقة الثالثة',
                                      'الفرقة الرابعة',
                                      'الفرقة الخامسة',
                                      'الفرقة السادسة',
                                      'الفرقة السابعة',
                                    ],
                                    hint: 'اختر الفرقه',
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        rankValue = value;
                                      });
                                    },
                                    value: rankValue,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomDropDownButton(
                                    items: const ['ذكر', 'انثي'],
                                    hint: 'اختر النوع',
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        genderValue = value;
                                      });
                                    },
                                    value: genderValue,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomDropDownButton(
                                    items: const ['نعم', 'لا'],
                                    hint: 'مريض مزمن؟',
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        dieseaseValue = value;
                                      });
                                    },
                                    value: dieseaseValue,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  if (dieseaseValue == "نعم")
                                    MultiSelectDialogField(
                                      title: const Text("الامراض المزمنه"),
                                      buttonText: const Text(
                                        "الامراض المزمنه",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      buttonIcon: const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.grey,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      items:
                                          BlocProvider.of<PateintCubit>(context)
                                              .diseases
                                              .map((e) =>
                                                  MultiSelectItem(e, e.name))
                                              .toList(),
                                      listType: MultiSelectListType.CHIP,
                                      onConfirm: (values) {
                                        selectedDiseases = values;
                                        print(selectedDiseases.toString());
                                      },
                                    ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CustomButton(
                                          ontap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              BlocProvider.of<PateintCubit>(
                                                      context)
                                                  .postPatientData(
                                                patientModel: PatientModel(
                                                    age: int.parse(age.text),
                                                    studentId: int.parse(
                                                        studentId.text),
                                                    phoneNumber:
                                                        phoneNubmer.text,
                                                    diseases: selectedDiseases,
                                                    name: name.text,
                                                    nationalId: int.parse(
                                                        nationalId.text),
                                                    gender: genderValue!,
                                                    chronic:
                                                        chronic.text == "نعم"
                                                            ? true
                                                            : false,
                                                    level: rankValue!,
                                                    collegeName: collegeValue!),
                                              );
                                              BlocProvider.of<PateintCubit>(
                                                      context)
                                                  .fetchAllPateint();
                                            } else {
                                              autovalidateMode =
                                                  AutovalidateMode.always;
                                            }
                                          },
                                          buttonColor: Colors.green,
                                          child: Text(
                                            'اضافه مريض',
                                            style:
                                                AppStyles.styleBold16(context)
                                                    .copyWith(
                                                        color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: CustomButton(
                                          ontap: () {},
                                          buttonColor: Colors.red,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearAllData() {
    name.text = "";
    nationalId.text = "";
    studentId.text = "";
    genderValue = null;
    chronic.text = "";
    rankValue = null;
    collegeValue = null;
    age.text = "";
    phoneNubmer.text = "";
    rankValue = null;
    genderValue = null;
    dieseaseValue = null;
    collegeValue = null;
    isClicked = false;
    currentIndex = null;
    formKey = GlobalKey<FormState>();
    selectedDiseases.clear();
    isChronic = false;
  }
}
