import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Background.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/ChoosenPage.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/generated/l10n.dart';

class AuthMobileBody extends StatefulWidget {
  const AuthMobileBody({super.key});

  @override
  State<AuthMobileBody> createState() => _AuthMobileBodyState();
}

class _AuthMobileBodyState extends State<AuthMobileBody> {
  bool isSelected = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? username, password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const AuthBackground(
                  borderColor: ColorManeger.lightPrimaryColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthTextField(
                    label: 'ادخل اسم المستخدم',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Field is Required";
                      }
                      return null;
                    },
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
                  obscureText: isSelected,
                  label: 'ادخل كلمه المرور',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Field is Required";
                    }
                    return null;
                  },
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
                        isSelected ? Assets.imagesEyeCrossed : Assets.imagesEye,
                      ),
                    ),
                  ),
                  hintText: S.of(context).AuthPassword,
                  hintStyle: AppStyles.styleMeduim16(context),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthCubitState>(
                  listener: (context, state) {
                    if (state is SuccessAuthState) {
                      Fluttertoast.showToast(
                        msg: 'Welcome ${state.user}',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.greenAccent[400],
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      MethodHelper.navigateToWithRep(
                          context, const ChoosenView());
                    } else if (state is FaulierAuthState) {
                      Fluttertoast.showToast(
                        msg: state.errorMsg,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  builder: (context, state) {
                    return LoginButton(
                      state: state,
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context)
                              .signIn(username!, password!);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
