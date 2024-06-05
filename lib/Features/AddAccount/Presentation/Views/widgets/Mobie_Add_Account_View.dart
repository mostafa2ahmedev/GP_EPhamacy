import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gppharmacy/Features/AddAccount/data/UsersModel.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_cubit.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_state.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';

import 'package:gppharmacy/generated/l10n.dart';

class MobileAddAccountView extends StatefulWidget {
  const MobileAddAccountView({super.key});

  @override
  State<MobileAddAccountView> createState() => _MobileAddAccountViewState();
}

class _MobileAddAccountViewState extends State<MobileAddAccountView> {
  GlobalKey<FormState> key = GlobalKey();
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController RoleController;
  late TextEditingController nationalIdController;

  bool isSelected = false;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    RoleController = TextEditingController();
    nationalIdController = TextEditingController();
  }

  void clearAllData() {
    nameController.clear();
    userNameController.clear();
    passwordController.clear();
    phoneController.clear();
    RoleController.clear();
    nationalIdController.clear();
    setState(() {
      autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: key,
        child: SingleChildScrollView(
          child: BlocConsumer<AddAccountCubit, AddAccountState>(
            listener: (context, state) {
              if (state is AddAccountSuccess) {
                Fluttertoast.showToast(
                  msg: 'تم اضافه الحساب بنجاح',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.greenAccent[400],
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                clearAllData();
              } else if (state is AddAccountFailure) {
                Fluttertoast.showToast(
                  msg: "حدثت مشكله",
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
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).AddAccount,
                        style: AppStyles.styleBold32(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    controller: nameController,
                    label: "الاسم",
                    hintStyle: const TextStyle(color: Colors.black),
                    icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //////////////2
                  AuthTextField(
                    controller: passwordController,
                    label: "كلمه المرور",
                    hintStyle: AppStyles.styleMeduim16(context),
                    icon: isSelected ? Assets.imagesEye : Assets.imagesLock,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //////////////3
                  AuthTextField(
                    controller: phoneController,
                    label: "رقم الهاتف",
                    hintStyle: AppStyles.styleMeduim16(context),
                    icon:
                        isSelected ? Assets.imagesEye : Assets.imagesEyeCrossed,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      } else if (data.length < 11 || data.length > 11) {
                        return 'ادخل 11 رقم فقط';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  /////////////4
                  AuthTextField(
                    controller: nationalIdController,
                    label: "رقم القومي",
                    hintStyle: AppStyles.styleMeduim16(context),
                    icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      } else if (data.length < 14 || data.length > 14) {
                        return 'ادخل 14 رقم فقط';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ///////////5
                  AuthTextField(
                    controller: RoleController,
                    label: "الدرجه في النظام",
                    hintStyle: AppStyles.styleMeduim16(context),
                    icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  /////////////6
                  AuthTextField(
                    controller: userNameController,
                    label: "اسم المستخدم",
                    hintStyle: AppStyles.styleMeduim16(context),
                    icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ////////////submit button
                  AddAccountButton(
                      state: state,
                      ontap: () {
                        if (key.currentState!.validate()) {
                          BlocProvider.of<AddAccountCubit>(context).addAccount(
                              user: Users(
                                  username: userNameController.text,
                                  password: passwordController.text,
                                  authority: RoleController.text,
                                  phone: int.parse(phoneController.text),
                                  name: nameController.text,
                                  nationalId: nationalIdController.text));
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
