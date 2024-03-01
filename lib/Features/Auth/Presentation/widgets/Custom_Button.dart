import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.buttonColor});
  final String text;
  final VoidCallback ontap;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 200,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.styleMeduim16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
////////////////kareem

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          MethodHelper.navigateTo(context, const HomeView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManeger.lightPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          S.of(context).AddAccount,
          style: AppStyles.styleMeduim16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
