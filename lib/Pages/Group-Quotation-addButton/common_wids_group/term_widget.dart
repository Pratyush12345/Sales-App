import 'package:flutter/material.dart';

class ShowTerm extends StatelessWidget {
  final String yearName;
  final bool year;
  final Function onTapYear;
  bool yearSelected;
  ShowTerm(
      {@required this.yearName,
      @required this.year,
      @required this.onTapYear,
      @required this.yearSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * .062,
        child: Row(
          children: <Widget>[
            year
                ? Icon(
                    Icons.check_box,
                    color: Color.fromRGBO(155, 119, 217, 1),
                    size: MediaQuery.of(context).size.height * .023,
                  )
                : InkWell(
                    child: Icon(
                      Icons.check_box_outline_blank,
                      color: Color.fromRGBO(155, 119, 217, 1),
                      size: MediaQuery.of(context).size.height * .023,
                    ),
                    onTap: onTapYear,
                  ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            Text(
              yearName,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Color.fromRGBO(0, 0, 0, .8)),
            ),
          ],
        ),
      ),
      onTap: () {
        if (!yearSelected) {
          yearSelected = !yearSelected;
        }
        onTapYear();
      },
    );
  }
}
