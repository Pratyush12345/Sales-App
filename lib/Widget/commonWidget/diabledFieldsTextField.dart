import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Util/theme.dart';

class DisableFieldTextField extends StatelessWidget {
  TextEditingController controller;
  String title;
  int digit;
  bool enabled;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  bool mandatory;
  String hintText;
  String initialValue;
  FormFieldValidator validator;
  List<TextInputFormatter> textInputFormatter;
  DisableFieldTextField(
      {this.initialValue,
      this.digit,
      this.enabled: false,
      this.mandatory: false,
      this.title,
      this.validator,
      this.textInputType,
      this.controller,
      this.autoValidation,
      this.hintText,
      this.obscureText,
      this.textInputFormatter});

  ThemeApp theme = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
                color: Color.fromRGBO(31, 33, 29, 1)),
            children: <TextSpan>[
              TextSpan(
                  text: mandatory ? ' \*' : '',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFormField(
          enabled: enabled,
          maxLength: digit,
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          autovalidate: autoValidation ?? false,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          inputFormatters: textInputFormatter ?? [],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
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
                    color: theme.innertextfieldbordercolor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

class DateTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  String title;
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
      this.title,
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
                borderSide: BorderSide(color: Colors.red, width: 2)),
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

class DisableDateTextFieldWidget extends StatelessWidget {

  TextEditingController controller;
  String title;
  int digit;
  bool enabled;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  bool mandatory;
  String hintText;
  String initialValue;
  FormFieldValidator validator;
  List<TextInputFormatter> textInputFormatter;
  DisableDateTextFieldWidget(
      {this.initialValue,
      this.digit,
      this.enabled: false,
      this.mandatory: false,
      this.title,
      this.validator,
      this.textInputType,
      this.controller,
      this.autoValidation,
      this.hintText,
      this.obscureText,
      this.textInputFormatter});

  ThemeApp theme = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
                color: Color.fromRGBO(31, 33, 29, 1)),
            children: <TextSpan>[
              TextSpan(
                  text: mandatory ? ' \*' : '',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFormField(
          enabled: enabled,
          maxLength: digit,
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          autovalidate: autoValidation ?? false,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          inputFormatters: textInputFormatter ?? [],
          decoration: InputDecoration(
            suffixIcon: Image.asset(
              "assets/calendar.png",
              scale: 12,
              color: Color.fromRGBO(155, 119, 217, 1),
            ),
            filled: true,
            fillColor: Colors.grey[300],
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
                    color: theme.innertextfieldbordercolor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
