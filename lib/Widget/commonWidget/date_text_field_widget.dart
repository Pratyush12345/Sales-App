import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Util/theme.dart';

class DateTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool autoValidate;
  final TextInputType textInputType;
  final String hintText;
  String initialValue;
  final FormFieldValidator validator;
  final double width;
  final Function onTap;
  final double height;
  DateTextFieldWidget(
      {this.initialValue,
      this.validator,
      this.textInputType,
      this.controller,
      this.obscureText,
      this.hintText,
      this.autoValidate,
      this.width,
      this.onTap,
      this.height});
  final ThemeApp theme = ThemeApp();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
//        height: height??SizeConfig.screenHeight*.062,
        width: width ?? SizeConfig.screenWidth,
        child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          obscureText: obscureText,
          autovalidate: autoValidate,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          enabled: false,
          decoration: InputDecoration(
            suffixIcon: Image.asset(
              "assets/calendar.png",
              scale: 12,
              color: Color.fromRGBO(155, 119, 217, 1),
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(color: AppColors.red),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.height * 0.02),
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
          ),
          validator: validator,
        ),
      ),
    );
  }
}


