import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Util/theme.dart';

ThemeApp themeApp = ThemeApp();

class AppStyle {
  static final TextStyle headerTextstyle = TextStyle(
    fontSize: SizeConfig.screenHeight * .02,
  );
  static final TextStyle smallRedTextStyle =
      TextStyle(fontSize: SizeConfig.screenHeight * .02, color: AppColors.red);

  static final TextStyle purpleBold20 = TextStyle(
    color: themeApp.purplecolor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle purpleBold16 = TextStyle(
    color: themeApp.purplecolor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle whiteBold16 = TextStyle(
    color: AppColors.defaultWhite,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
