import 'package:flutter/material.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';


class customDialog extends StatefulWidget {
  String s;
  dynamic response;
  TextEditingController visibilityGroupName;
  bool validation;
  final String termtype;
  customDialog(
      {this.termtype,this.s, this.response, this.visibilityGroupName, this.validation});
  @override
  _customDialogState createState() => _customDialogState();
}

bool valid = false;
bool load = false;


class _customDialogState extends State<customDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(
          widget.s != null
              ? widget.s
              : widget.response['status'] != "1"
              ? "Visibility Group"
              : "Successfully Generated Contract",
        ),
        actions: <Widget>[
          widget.s == null
              ? Row(
            children: [
              (widget.response['status'] == "2")
                  ? Container(
                width: MediaQuery.of(context).size.width * .64,
                child: AppTextField(
                  enabled: true,
                  title: 'Group Name',
                  controller: widget.visibilityGroupName,
                  autoValidation: true,
                  //textInputType: TextInputType.number,
                  hintText: 'Group Name',
                  onChanged: (text) {
                    setState(() {
                      valid = false;
                      widget.validation = false;
                    });
                  },
                  validator: (value) {

                      if (valid || widget.validation) {
                        return widget.response['msg'];
                      }
                    

                    return null;
                  },
                ),
              )
                  : Container(),
            ],
          )
              : Container(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          load ? AppConstant.circularProgressIndicator() : Container(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.038,
            child: TextButton(
              child: Text(
                widget.s != null
                    ? "OK"
                    : widget.response['status'] == "2"
                    ? "Submit"
                    : "OK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                print(widget.s);
                if (widget.s == null) {
                  setState(() {
                    load = true;
                  });
                  widget.response = await GenerateSite(
                    termType: widget.termtype,
                    visGroupName: widget.visibilityGroupName.text,
                  );
                  setState(() {
                    load = false;
                  });
                  if (widget.response['status'] != "1") {
                    setState(() {
                      valid = true;
                    });
                    // AppConstant.showFailToast(
                    //     context,
                    //     widget.response['msg'] ??
                    //         'Failed');
                  }
                }
                if (widget.s != null) {
                  Navigator.of(context).pop();
                } else if (widget.response['status'] == "1") {
                  AppConstant.showSuccessToast(
                      context, "Successfully Generated Contract");
                  Navigator.of(context).pop();
                }
              },
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(155, 119, 217, 1),
                borderRadius: BorderRadius.circular(30)),
          ),
        ],
      ),
    );
  }
}
