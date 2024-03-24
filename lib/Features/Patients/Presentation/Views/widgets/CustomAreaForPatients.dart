import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class CustomAreaForNewPatient extends StatefulWidget {
  const CustomAreaForNewPatient(
      {super.key,
      required this.studentName,
      required this.idCollege,
      required this.phoneNubmer,
      required this.idMain,
      required this.age,
      required this.formKey,
      this.autovalidateMode});
  final TextEditingController studentName;
  final TextEditingController idCollege;
  final TextEditingController phoneNubmer;
  final TextEditingController idMain;
  final TextEditingController age;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomAreaForNewPatient> createState() =>
      _CustomAreaForNewPatientState();
}

class _CustomAreaForNewPatientState extends State<CustomAreaForNewPatient> {
  String? collegeValue;
  String? rankValue;
  String? genderValue;
  String? dieseaseValue;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).AddNewPatient,
            style: AppStyles.styleBold28(context),
          ),
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
            autovalidateMode: widget.autovalidateMode,
            controller: widget.studentName,
            label: 'اسم الطالب (عربي)',
            suffixIcon: const Icon(Icons.language),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            controller: widget.idCollege,
            label: 'الرقم الجامعي',
            suffixIcon: const Icon(Icons.abc),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'ادخل رقم الهاتف';
              }
              return null;
            },
            autovalidateMode: widget.autovalidateMode,
            controller: widget.phoneNubmer,
            label: 'رقم الهاتف',
            suffixIcon: const Icon(Icons.abc),
          ),
          const SizedBox(
            height: 12,
          ),
          AuthTextField(
            validator: (v) {
              if (v?.isEmpty ?? true) {
                return 'ادخل الرقم القومي';
              }
              return null;
            },
            autovalidateMode: widget.autovalidateMode,
            controller: widget.idMain,
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
            autovalidateMode: widget.autovalidateMode,
            controller: widget.age,
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
          // ListView.separated(
          //     separatorBuilder: (context, index) {
          //       return const SizedBox(
          //         height: 12,
          //       );
          //     },
          //     itemBuilder: (context, index) {
          //       return CheckboxListTile(
          //         value: true,
          //         onChanged: (value) {},
          //       );
          //     },
          //     itemCount: 5)
        ],
      ),
    );
  }
}
