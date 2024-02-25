import 'package:flutter/cupertino.dart';

import 'package:gppharmacy/Utils/SizeConfig.dart';

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double resFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.20;
  return resFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // // double width = MediaQuery.sizeOf(context).width;
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth /
  //     devicePixelRatio; // دا نفس الويدث بالظبط الي بيجي من الميديا كويري
  // // بس فيه مشكله بسيطه برده هنا وهي ان ف الويب مش هتقدر تتغير علطول لازم تعمل ريبلد والطريقه الي فوق دي مش هتعمل ريبلد
  // // وباتالي الطريقه دي حلوه لو انت هتتعامل مع تاب وتلفون بس

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreak) {
    return width /
        550; // القيم دي جس ورك وبنحددها اكتر خلال  الديزاين وانت شغال  والقيمه دي الي عندها بقول قيمه الفونت سايز تفضل زي ما هي
  } else if (width < SizeConfig.tabletBreak) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
