import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Util/theme.dart';

class AppTextFieldforMprn extends StatelessWidget {
  TextEditingController controller;
  String title;
  bool enabled;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  bool mandatory;
  String hintText;
  String initialValue;
  int maxlength;
  FormFieldValidator validator;
  List<TextInputFormatter> textInputFormatter;
  AppTextFieldforMprn(
      {this.initialValue,
      this.enabled: true,
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
          onChanged: (value) {},
          maxLength: maxlength,
          enabled: enabled,
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
            fillColor: Colors.white,
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
