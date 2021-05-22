import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';

class CheckBoxFieldWidget extends StatelessWidget {
  final bool checkBoxSelected;
  final String labelText;
  final Function onTap;
  CheckBoxFieldWidget(
      {@required this.checkBoxSelected,
      @required this.labelText,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeApp themeApp = ThemeApp();
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * .065,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            InkWell(
              child: Icon(
                checkBoxSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Color.fromRGBO(155, 119, 217, 1),
                size: MediaQuery.of(context).size.height * .023,
              ),
              onTap: onTap,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            Text(
              labelText,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .019,
                  color: Color.fromRGBO(0, 0, 0, .8)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: themeApp.textfieldbordercolor, width: 2),
            borderRadius: BorderRadius.circular(3)),
      ),
      onTap: onTap,
    );
  }
}
