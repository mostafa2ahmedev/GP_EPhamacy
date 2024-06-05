// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
// import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
// import 'package:gppharmacy/Features/Patients/data/Disease_Model.dart';
// import 'package:gppharmacy/Utils/AppStyles.dart';
// import 'package:gppharmacy/Utils/Methods_Helper.dart';
// import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
// import 'package:gppharmacy/generated/l10n.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

// import '../../../../StoresBody/presentation/Views/Dispensing medications/widgets/AddNewCategoryMethod.dart';
// import '../../../../StoresBody/presentation/Views/Dispensing medications/widgets/CustomCircleAdd.dart';

// class CustomAreaForNewPatient extends StatefulWidget {
//   const CustomAreaForNewPatient({
//     super.key,
//     required this.name,
//     required this.nationalId,
//     required this.studentId,
//     required this.gender,
//     required this.chronic,
//     required this.level,
//     required this.collegeName,
//     required this.age,
//     required this.phoneNubmer,
//     required this.formKey,
//     required this.selectedDiseases,
//     required this.autovalidateMode,
//     required this.rankValue,
//     required this.genderValue,
//     required this.dieseaseValue,
//     required this.collegeValue,
//     required this.currentIndex,
//   });
//   final TextEditingController name;
//   final TextEditingController nationalId;
//   final TextEditingController studentId;
//   final TextEditingController gender;
//   final TextEditingController chronic;
//   final TextEditingController level;
//   final TextEditingController collegeName;
//   final TextEditingController age;
//   final TextEditingController phoneNubmer;
//   final GlobalKey<FormState> formKey;
//   final AutovalidateMode? autovalidateMode;
//   final List<DiseaseModel> selectedDiseases;
//   String? rankValue;
//   String? genderValue;
//   String? dieseaseValue;
//   String? collegeValue;
//   bool isClicked = false;
//   int? currentIndex;
//   @override
//   State<CustomAreaForNewPatient> createState() =>
//       _CustomAreaForNewPatientState();
// }

// class _CustomAreaForNewPatientState extends State<CustomAreaForNewPatient> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             S.of(context).AddNewPatient,
//             style: AppStyles.styleBold28(context),
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           AuthTextField(
//             validator: (v) {
//               if (v?.isEmpty ?? true) {
//                 return 'ادخل اسم الطالب';
//               }
//               return null;
//             },
//             autovalidateMode: widget.autovalidateMode,
//             controller: widget.name,
//             label: 'اسم الطالب (عربي)',
//             suffixIcon: const Icon(Icons.language),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           AuthTextField(
//             controller: widget.studentId,
//             label: 'الرقم الجامعي',
//             suffixIcon: const Icon(Icons.abc),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           AuthTextField(
//             validator: (v) {
//               if (v?.isEmpty ?? true) {
//                 return 'ادخل رقم الهاتف';
//               }
//               return null;
//             },
//             autovalidateMode: widget.autovalidateMode,
//             controller: widget.phoneNubmer,
//             label: 'رقم الهاتف',
//             suffixIcon: const Icon(Icons.abc),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           AuthTextField(
//             validator: (v) {
//               if (v?.isEmpty ?? true) {
//                 return 'ادخل الرقم القومي';
//               }
//               return null;
//             },
//             autovalidateMode: widget.autovalidateMode,
//             controller: widget.nationalId,
//             keyboardType: TextInputType.number,
//             label: 'الرقم القومي',
//             suffixIcon: const Icon(Icons.abc),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           AuthTextField(
//             validator: (v) {
//               if (v?.isEmpty ?? true) {
//                 return 'ادخل السن';
//               }
//               return null;
//             },
//             autovalidateMode: widget.autovalidateMode,
//             controller: widget.age,
//             label: 'السن',
//             suffixIcon: const Icon(Icons.abc),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           CustomDropDownButton(
//             items: const [
//               'كلية الهندسة بشيرا',
//               'كلية الهندسة بينها',
//               'كلية الحاسبات والذكاء الإصطناعي',
//               'كلية العلوم',
//               'كلية الزراعة',
//               'كلية الفنون التطبيقية',
//               'كلية التجارة',
//               'كلية التربية',
//               'كلية التربية النوعية',
//               'كلية التربية الرياضية',
//               'كلية الحقوق',
//               'كلية الآداب',
//               'كلية الطب البشري',
//               'كلية الطب البيطري',
//               'كلية التمريض',
//               'كلية العلاج الطبيعي',
//             ],
//             hint: 'اختر الكليه',
//             isExpanded: true,
//             onChanged: (value) {
//               setState(() {
//                 widget.collegeValue = value;
//               });
//             },
//             value: widget.collegeValue,
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           CustomDropDownButton(
//             items: const [
//               'الفرقة الأولى',
//               'الفرقة الثانية',
//               'الفرقة الثالثة',
//               'الفرقة الرابعة',
//               'الفرقة الخامسة',
//               'الفرقة السادسة',
//               'الفرقة السابعة',
//             ],
//             hint: 'اختر الفرقه',
//             isExpanded: true,
//             onChanged: (value) {
//               setState(() {
//                 widget.rankValue = value;
//               });
//             },
//             value: widget.rankValue,
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           CustomDropDownButton(
//             items: const ['ذكر', 'انثي'],
//             hint: 'اختر النوع',
//             isExpanded: true,
//             onChanged: (value) {
//               setState(() {
//                 widget.genderValue = value;
//               });
//             },
//             value: widget.genderValue,
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           CustomDropDownButton(
//             items: const ['نعم', 'لا'],
//             hint: 'مريض مزمن؟',
//             isExpanded: true,
//             onChanged: (value) {
//               setState(() {
//                 widget.dieseaseValue = value;
//               });
//             },
//             value: widget.dieseaseValue,
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           MultiSelectDialogField(
//             title: Text("الامراض المزمنه"),
//             items: BlocProvider.of<PateintCubit>(context)
//                 .diseases
//                 .map((e) => MultiSelectItem(e, e.name))
//                 .toList(),
//             listType: MultiSelectListType.CHIP,
//             onConfirm: (values) {
//               selectedDiseases = values;
//               print(selectedDiseases.toString());
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   bool isSelected(
//       {required List<DiseaseModel> diseases, required DiseaseModel x}) {
//     for (var element in diseases) {
//       if (x.name == element.name) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

// class CustomCheckBoxList extends StatelessWidget {
//   const CustomCheckBoxList(
//       {super.key,
//       required this.value,
//       required this.ontap,
//       required this.diseaseModel});
//   bool value;
//   final Function(bool?)? ontap;
//   final DiseaseModel diseaseModel;

//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       title: Text(diseaseModel.name),
//       value: value,
//       onChanged: ontap,
//     );
//   }
// }
//   //  Row(
//   //           children: [
//   //             Expanded(
//   //               flex: 3,
//   //               child: Container(
//   //                 decoration: BoxDecoration(
//   //                     borderRadius: BorderRadius.circular(4),
//   //                     border: Border.all(color: Colors.grey)),
//   //                 height: MediaQuery.sizeOf(context).height * 0.17,
//   //                 child: SingleChildScrollView(
//   //                   scrollDirection: Axis.vertical,
//   //                   child: Column(
//   //                     children: List.generate(
//   //                       BlocProvider.of<PateintCubit>(context).diseases.length,
//   //                       (index) {
//   //                         return CustomCheckBoxList(
//   //                           diseaseModel: BlocProvider.of<PateintCubit>(context)
//   //                               .diseases[index],
//   //                           value: isClicked,
//   //                           ontap: (data) {
//   //                             setState(() {
//   //                               isClicked = data!;
//   //                             });
//   //                             currentIndex = BlocProvider.of<PateintCubit>(
//   //                                     context)
//   //                                 .getIndexOfDieasesList(
//   //                                     name:
//   //                                         BlocProvider.of<PateintCubit>(context)
//   //                                             .diseases[index]
//   //                                             .name);
//   //                           },
//   //                         );
//   //                       },
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             Expanded(
//   //               child: InkWell(
//   //                 onTap: () {
//   //                   addNewCategory(context,
//   //                       text1: "اضافه مرض جديد", text2: "اسم المرض", index: 5);
//   //                 },
//   //                 child: const CustomCircleAdd(),
//   //               ),
//   //             ),
//   //           ],
//   //         )