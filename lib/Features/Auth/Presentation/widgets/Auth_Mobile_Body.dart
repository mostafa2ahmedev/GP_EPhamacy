import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/AuthButton.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Background.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/generated/l10n.dart';

class AuthMobileBody extends StatefulWidget {
  const AuthMobileBody({super.key});

  @override
  State<AuthMobileBody> createState() => _AuthMobileBodyState();
}

class _AuthMobileBodyState extends State<AuthMobileBody> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthBackground(),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                hintText: S.of(context).AuthUsername,
                hintStyle: AppSytles.styleRegular16(context),
                icon: Assets.imagesUser,
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                hintText: S.of(context).AuthPassword,
                hintStyle: AppSytles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesEyeCrossed,
                ontap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const AuthButton(),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).AuthForgotPassword,
                  style: AppSytles.styleMeduim16(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
