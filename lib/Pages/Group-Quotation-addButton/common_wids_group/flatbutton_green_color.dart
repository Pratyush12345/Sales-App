import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Util/theme.dart';

class FlatButtonGreenColor extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  FlatButtonGreenColor({@required this.buttonText, @required this.onTap});

  final ThemeApp themeApp = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        height: MediaQuery.of(context).size.height * 0.06,
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColors.defaultWhite,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        color: themeApp.innertextfieldbordercolor,
      ),
    );
  }
}
