import 'package:flutter/cupertino.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Constants.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileAddAccountView extends StatefulWidget {
  const MobileAddAccountView({super.key});

  @override
  State<MobileAddAccountView> createState() => _MobileAddAccountViewState();
}

class _MobileAddAccountViewState extends State<MobileAddAccountView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PrimaryPaddingWidth, vertical: PrimaryPaddingHight),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).AddAccount,
                    style: AppStyles.styleBold28(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextField(
                hintText: S.of(context).AuthUsername,
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
              ),
              const SizedBox(
                height: 16,
              ),
              //////////////2
              AuthTextField(
                hintText: S.of(context).AuthPassword,
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesLock,
              ),
              const SizedBox(
                height: 18,
              ),
              //////////////3
              AuthTextField(
                hintText: S.of(context).PhoneNumber,
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesEyeCrossed,
              ),
              const SizedBox(
                height: 18,
              ),
              /////////////4
              AuthTextField(
                hintText: "الإسم",
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
              ),
              const SizedBox(
                height: 18,
              ),
              ///////////5
              AuthTextField(
                hintText: "الإسم",
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
              ),
              const SizedBox(
                height: 18,
              ),
              /////////////6
              AuthTextField(
                hintText: "الإسم",
                hintStyle: AppStyles.styleMeduim16(context),
                icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
              ),
              const SizedBox(
                height: 32,
              ),
              ////////////submit button
              const AddAccountButton()
            ],
          ),
        ),
      ),
    );
  }
}
