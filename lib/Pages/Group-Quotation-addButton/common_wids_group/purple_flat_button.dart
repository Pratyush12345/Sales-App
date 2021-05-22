import 'package:flutter/material.dart';

class PurpleFlatButton extends StatelessWidget {
  final Function onTap;
  final String text;
  PurpleFlatButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.062,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.023,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(155, 119, 217, 1),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
