import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/AuthButton.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Constants.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/generated/l10n.dart';

class AddAccountView extends StatefulWidget {
  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends State<AddAccountView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      drawer: Drawer(
        child: Container(color: PrimaryColor,),
      ),
      appBar: HomeAppBar(
        scafoldKey: scaffoldKey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PrimaryPaddingWidth , vertical: PrimaryPaddingHight),
        child:  Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(S.of(context).AddAccount 
                    ,style: AppSytles.styleBold28(context),),
                  ],
                ),
                SizedBox(height:20 ,),
                AuthTextField(
                  hintText: S.of(context).AuthUsername,
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:16 ,),
                //////////////2
                AuthTextField(
                  hintText: S.of(context).AuthPassword,
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesLock,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:18 ,),
                //////////////3
                AuthTextField(
                  hintText: S.of(context).PhoneNumber,
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesEyeCrossed  ,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:18 ,),
                /////////////4
                AuthTextField(
                  hintText: "الإسم",
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:18 ,),
                ///////////5
                AuthTextField(
                  hintText: "الإسم",
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:18 ,),
                /////////////6
                AuthTextField(
                  hintText: "الإسم",
                  hintStyle: AppSytles.styleMeduim16(context),
                  icon: isSelected ? Assets.imagesEye : Assets.imagesUser,
                  ontap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                ),
                SizedBox(height:32 ,),
                ////////////submit button
                AddAccountButton()
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}