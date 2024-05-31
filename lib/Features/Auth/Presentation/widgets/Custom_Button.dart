import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_state.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.ontap,
      required this.buttonColor,
      required this.child});
  final VoidCallback ontap;
  final Color buttonColor;
  final Widget child;
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
          child: child),
    );
  }
}
////////////////kareem

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({super.key, required this.ontap, required this.state});
  final VoidCallback ontap;
  final AddAccountState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 200,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state is AddAccountLoading
            ? const CircularProgressIndicator()
            : Text(
                S.of(context).AddAccount,
                style: AppStyles.styleMeduim16(context)
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.ontap, required this.state});
  final VoidCallback ontap;
  final AuthCubitState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 200,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: state is AddAccountLoading
            ? const CircularProgressIndicator()
            : Text(
                S.of(context).AddAccount,
                style: AppStyles.styleMeduim16(context)
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
