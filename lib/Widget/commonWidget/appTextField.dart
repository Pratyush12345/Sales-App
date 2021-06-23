import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class AppTextField extends StatelessWidget {
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
  Function onChanged;
  FocusNode focusNode;
  Function onFieldSubmitted;
  Function onTap;
  AppTextField(
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
      this.onFieldSubmitted,
      this.textInputFormatter,
      this.maxlength,
      this.focusNode,
      this.onChanged,
      this.onTap});

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
          onTap: onTap,
          onChanged: onChanged,
          maxLength: maxlength,
          enabled: enabled,
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          autovalidate: autoValidation ?? false,
          keyboardType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          focusNode: focusNode,
          inputFormatters: textInputFormatter ??
              [
                DecimalTextInputFormatter(
                  decimalRange: 4,
                ),
              ],
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

class CheckBoxField extends StatelessWidget {
  bool checked = false;
  String text;
  Function onTap;
  CheckBoxField(
      {@required this.checked, @required this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Row(
          children: [
            !checked
                ? InkWell(
                    onTap: onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.06,
                      height: MediaQuery.of(context).size.width * 0.06,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.06,
                      height: MediaQuery.of(context).size.width * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: themeApp.textfieldbordercolor,
        ),
      ),
    );
  }
}

class DisableAppTextField extends StatelessWidget {
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
  Function onChanged;
  FocusNode focusNode;
  Function onFieldSubmitted;
  DisableAppTextField(
      {this.initialValue,
      this.enabled,
      this.mandatory: false,
      this.title,
      this.validator,
      this.textInputType,
      this.controller,
      this.autoValidation,
      this.hintText,
      this.obscureText,
      this.onFieldSubmitted,
      this.textInputFormatter,
      this.maxlength,
      this.focusNode,
      this.onChanged});

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
          onChanged: onChanged,
          maxLength: maxlength,
          enabled: enabled,
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          autovalidate: autoValidation ?? false,
          keyboardType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          focusNode: focusNode,
          inputFormatters: textInputFormatter ??
              [
                DecimalTextInputFormatter(
                  decimalRange: 4,
                ),
              ],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
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

abstract class KeyboardHiderMixin {
  void hideKeyboard({
    BuildContext context,
    bool hideTextInput = true,
    bool requestFocusNode = true,
  }) {
    if (hideTextInput) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
    if (context != null && requestFocusNode) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}

/// A widget that can be used to hide the text input that are opened by text
/// fields automatically on tap.
///
/// Delegates to [KeyboardHiderMixin] for hiding the keyboard on tap.
class KeyboardHider extends StatelessWidget with KeyboardHiderMixin {
  final Widget child;

  /// Decide whether to use
  /// `SystemChannels.textInput.invokeMethod('TextInput.hide');`
  /// to hide the keyboard
  final bool hideTextInput;
  final bool requestFocusNode;

  /// One of hideTextInput or requestFocusNode must be true, otherwise using the
  /// widget is pointless as it will not even try to hide the keyboard.
  const KeyboardHider({
    Key key,
    @required this.child,
    this.hideTextInput = true,
    this.requestFocusNode = true,
  })  : assert(child != null),
        assert(hideTextInput || requestFocusNode),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        hideKeyboard(
          context: context,
          hideTextInput: hideTextInput,
          requestFocusNode: requestFocusNode,
        );
      },
      child: child,
    );
  }
}
