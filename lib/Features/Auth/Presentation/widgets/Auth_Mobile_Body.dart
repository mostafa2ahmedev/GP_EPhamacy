import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? username, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const AuthBackground(
                  borderColor: ColorManeger.lightPrimaryColor,
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthTextField(
                    onSaved: (value) {
                      username = value;
                    },
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
                  onSaved: (value) {
                    password = value;
                  },
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
                BlocConsumer<AuthCubit, AuthCubitState>(
                  listener: (context, state) {
                    if (state is SuccessAuthState) {
                      MethodHelper.navigateTo(context, const HomeView());
                    } else if (state is FaulierAuthState) {
                      //show Toaster
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      buttonColor: Colors.red,
                      text: S.of(context).AuthSignIn,
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context)
                              .signIn(username!, password!);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    );
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
      ),
    );
  }
}
