import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWithOutBorder extends StatelessWidget {
  TextEditingController controller;
  TextInputAction textInputAction;
  final String intialvalue;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  FocusNode focusNode;
  String hintText;
  Function onEditComplete;
  Function onFieldSubmitted;
  Function onChange;
  bool enabled = true;
  bool autofocus;
  FormFieldValidator validator;
  void onEditingComplete;
  List<TextInputFormatter> textInputFormatter;
  int digit;
  AppTextFieldWithOutBorder({
    this.digit,
    this.textInputFormatter,
    this.textInputAction,
    this.intialvalue,
    this.focusNode,
    this.onEditComplete,
    this.onChange,
    this.validator,
    this.textInputType,
    this.controller,
    this.hintText,
    this.autoValidation,
    this.obscureText,
    this.onFieldSubmitted,
    this.enabled,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      enabled: enabled,
      maxLength: digit,
      controller: controller,
      initialValue: intialvalue,
      obscureText: obscureText ?? false,
      autovalidate: autoValidation ?? false,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      focusNode: focusNode,
      onEditingComplete: onEditComplete,
      onChanged: onChange,
      inputFormatters: textInputFormatter,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.02),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)),
        hintText: hintText ?? '',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
      ),
    );
  }
}

class DisableAppTextFieldWithOutBorder extends StatelessWidget {
  TextEditingController controller;
  TextInputAction textInputAction;
  final String intialvalue;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  FocusNode focusNode;
  String hintText;
  Function onEditComplete;
  Function onChange;
  bool enabled = false;
  bool autofocus;
  FormFieldValidator validator;
  void onEditingComplete;
  List<TextInputFormatter> textInputFormatter;
  int digit;
  DisableAppTextFieldWithOutBorder({
    this.digit,
    this.textInputFormatter,
    this.textInputAction,
    this.intialvalue,
    this.focusNode,
    this.onEditComplete,
    this.onChange,
    this.validator,
    this.textInputType,
    this.controller,
    this.hintText,
    this.autoValidation,
    this.obscureText,
    this.enabled,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      enabled: enabled,
      maxLength: digit,
      controller: controller,
      initialValue: intialvalue,
      obscureText: obscureText ?? false,
      autovalidate: autoValidation ?? false,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      focusNode: focusNode,
      onEditingComplete: onEditComplete,
      onChanged: onChange,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.02),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)),
        hintText: hintText ?? '',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
      ),
    );
  }
}
