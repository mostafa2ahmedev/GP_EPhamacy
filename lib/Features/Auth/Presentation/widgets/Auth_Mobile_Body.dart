import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Background.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
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
              const AuthBackground(
                borderColor: ColorManeger.lightPrimaryColor,
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                  hintText: S.of(context).AuthUsername,
                  hintStyle: AppStyles.styleRegular16(context),
                  icon: Assets.imagesUser,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(Assets.imagesUser),
                  )),
              const SizedBox(
                height: 24,
              ),
              AuthTextField(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: SvgPicture.asset(
                      isSelected ? Assets.imagesEye : Assets.imagesEyeCrossed,
                    ),
                  ),
                ),
                hintText: S.of(context).AuthPassword,
                hintStyle: AppStyles.styleMeduim16(context),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                buttonColor: Colors.red,
                text: S.of(context).AuthSignIn,
                ontap: () {
                  MethodHelper.navigateTo(context, const HomeView());
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).AuthForgotPassword,
                  style: AppStyles.styleMeduim16(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
