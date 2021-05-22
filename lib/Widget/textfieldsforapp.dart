import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Util/theme.dart';
import 'dart:math' as math;

ThemeApp theme = ThemeApp();

Widget textField(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).size.height * 0.02,
          20.0,
          MediaQuery.of(context).size.height * 0.02),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget textFieldEmail(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    //textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).size.height * 0.02,
          20.0,
          MediaQuery.of(context).size.height * 0.02),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget dropdowntextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.arrow_drop_down),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
    ),
    validator: validator,
  );
}

Widget innertextfield2(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context,
    int maxlength) {
  return TextFormField(
    maxLength: maxlength,
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget Disableinnertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: enabled,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget ExtraDisableinnertextfield(
    //String initialValue,
    //bool obscuretext,
    //bool autovalidation,
    String hinttext,
    bool enabled,
    //TextInputType textInputType,
    // FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    // initialValue: initialValue,
    //obscureText: obscuretext,
    // autovalidate: autovalidation,
    //keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: enabled,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    //validator: validator,
  );
}

Widget DecimalInnertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    TextInputFormatter inputFormatter,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    inputFormatters: [
      LengthLimitingTextInputFormatter(9),
      //FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
      WhitelistingTextInputFormatter(
        RegExp(r'^\d+\.?\d{0,2}'),
      ),
      // DecimalTextInputFormatter(
      //   decimalRange: 4,
      // ),
    ],
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget DisableDecimalInnertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    TextInputFormatter inputFormatter,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    enabled: enabled,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
      DecimalTextInputFormatter(
        decimalRange: 4,
      ),
    ],
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innertextfieldEmail(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    // textCapitalization: TextCapitalization.words,
    autofocus: false,

    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget DisableinnertextfieldEmail(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    // textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: enabled,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innerMobilefield(
    int digit,
    TextEditingController controller,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    maxLength: digit,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget DisableinnerMobilefield(
    int digit,
    TextEditingController controller,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    maxLength: digit,
    enabled: false,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innerLongtextfield(
    int lines,
    TextEditingController controller,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    maxLines: lines,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget DisableinnerLongtextfield(
    int lines,
    TextEditingController controller,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    enabled: enabled,
    maxLines: lines,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget datetextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
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
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red /*theme.innertextfieldbordercolor*/, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),

      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.red/*theme.innertextfieldbordercolor*/,width: 1)),
      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
    ),
    validator: validator,
  );
}

Widget Disabledatetextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: enabled,
    decoration: InputDecoration(
      suffixIcon: Image.asset(
        "assets/calendar.png",
        scale: 12,
        color: Color.fromRGBO(155, 119, 217, 1),
      ),
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red /*theme.innertextfieldbordercolor*/, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),

      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.red/*theme.innertextfieldbordercolor*/,width: 1)),
      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
    ),
    validator: validator,
  );
}

Widget datetextfieldWithoutBorder(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      //  suffixIcon: Image.asset("assets/calendar.png",scale: 12,color: Color.fromRGBO(155, 119, 217, 1),),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
      //errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.red/*theme.innertextfieldbordercolor*/,width: 1)),
      //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  theme.innertextfieldbordercolor,width: 1)),
    ),
    validator: validator,
  );
}

Widget withoutboderdropdowntextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.arrow_drop_down),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    ),
    validator: validator,
  );
}

Widget Disablewithoutboderdropdowntextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    bool enabled,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: enabled = false,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.arrow_drop_down),
      filled: true,
      fillColor: Colors.black12,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    ),
    validator: validator,
  );
}

Widget withoutborderinnertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    autovalidate: autovalidation,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1)),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    ),
    validator: validator,
  );
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
