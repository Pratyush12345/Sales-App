import 'package:flutter/material.dart';

class BusinessTypeCheckBoxWidget extends StatefulWidget {
  final String businessTypeName;
  final Function onTap;
  final bool selected;
  BusinessTypeCheckBoxWidget(
      {@required this.businessTypeName,
      @required this.onTap,
      @required this.selected,
    });

  @override
  _BusinessTypeCheckBoxWidgetState createState() =>
      _BusinessTypeCheckBoxWidgetState();
}

class _BusinessTypeCheckBoxWidgetState
    extends State<BusinessTypeCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .062,
      child: Row(
        children: <Widget>[
          (widget.selected)
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
                  onTap: widget.onTap,
                ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .01,
          ),
          Text(
            widget.businessTypeName,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .02,
                color: Color.fromRGBO(0, 0, 0, .8)),
          ),
        ],
      ),
    );
  }
}
