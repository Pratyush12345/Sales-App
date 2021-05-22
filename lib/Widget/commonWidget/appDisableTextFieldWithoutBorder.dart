import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDisbleTextFieldWithoutBorder extends StatelessWidget {
  TextEditingController controller;
  final String intialvalue;
  bool obscureText;
  bool autoValidation;
  bool enabled = false;
  TextInputType textInputType;
  String hintText;
  FormFieldValidator validator;
  List<TextInputFormatter> textInputFormatter;
  int digit;
  AppDisbleTextFieldWithoutBorder(
      {this.digit,
      this.textInputFormatter,
      this.intialvalue,
      this.validator,
      this.textInputType,
      this.controller,
      this.hintText,
      this.autoValidation,
      this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLength: digit,
      controller: controller,
      initialValue: intialvalue,
      obscureText: obscureText ?? false,
      autovalidate: autoValidation ?? false,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.02),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)),
        hintText: hintText ?? '',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      ),
      validator: validator,
    );
  }
}
