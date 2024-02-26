import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/generated/l10n.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

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
          backgroundColor: ColorManeger.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          S.of(context).AuthSignIn,
          style: AppSytles.styleMeduim16(context).copyWith(color: Colors.white),
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
          backgroundColor: ColorManeger.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          S.of(context).AddAccount,
          style: AppSytles.styleMeduim16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}