import 'package:flutter/material.dart';

// بنحط ف الكلاس دا حاجات كتير زي قيم البادنج والاورينتيشن
class SizeConfig {
  // الكلاس دا بحط فيه اي حاجه لها علاقه بالريسبونسف انترفيس بتاعي يعني اي حاجه هتتكر ف موضوع الريسبونسف بحطها هنا

  static const double desktopBreak = 1200;
  static const double tabletBreak = 800;

  static late double width, height;
  // بيحتتوي علي قيمه الويدث والهايت بتاع الشاشه  وهي ليت عشان انا مش عايز اخليها نالابل وانا مش هعرف اديها قيمه عشان محتاج الكونتكست ف بخيلها ليت وبعدين بعمل الميثود

  static init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
