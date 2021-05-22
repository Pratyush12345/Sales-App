import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class EditSiteDetailDialog extends StatefulWidget {
  @override
  _EditSiteDetailDialogState createState() => _EditSiteDetailDialogState();
}

class _EditSiteDetailDialogState extends State<EditSiteDetailDialog> {
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController mpanOneController = TextEditingController();
  TextEditingController mpanTwoController = TextEditingController();
  TextEditingController mpanThreeController = TextEditingController();
  TextEditingController mpanFourController = TextEditingController();
  TextEditingController mpanFiveController = TextEditingController();
  TextEditingController mpanSixController = TextEditingController();
  TextEditingController dayEacController = TextEditingController();
  TextEditingController nightEacController = TextEditingController();
  TextEditingController contractStartDateController = TextEditingController();
  bool autoValidation = false;

  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  void selectDate(BuildContext context, String fromField) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        contractStartDateController.text = dateFormat.format(picked).toString();
      });
    }
  }

  Widget mpancodeview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mpancodelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                mpancodelist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                onChangeMPanCode(mpancodelist[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  void onChangeMPanCode(String val) {
    setState(() {
      mpancodecontroller.text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.11,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        color: AppColors.defaultWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height * 0.07,
              color: themeApp.greenappcolor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EDIT SITE DETAIL (GROUP ID :- 19755)',
                      style: AppStyle.whiteBold16,
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.defaultWhite,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "MPAN",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * .062,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      child: withoutboderdropdowntextfield(
                          mpancodecontroller,
                          false,
                          autoValidation,
                          TextInputType.text,
                          "", (value) {
                        return null;
                      }, context),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color.fromRGBO(128, 189, 40, 1),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                          context: context,
                          builder: (context)=> Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  "Select MPAN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: Colors.grey.withOpacity(.2),
                                ),
                                Container(
                                  child: mpancodeview(),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .29,
                    child: AppTextFieldWithOutBorder(
                      controller: mpanOneController,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      digit: 3,
                      //hintText: '12',
                      onChange: (text) {
                        if (text.length == 3) {
                          TextSelection previousSelection =
                              mpanTwoController.selection;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Color.fromRGBO(128, 189, 40, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .26,
                    child: AppTextFieldWithOutBorder(
                      onChange: (text) {
                        if (text.length == 3) {
                          TextSelection previousSelection =
                              mpanThreeController.selection;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: mpanTwoController,
                      digit: 3,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: themeApp.textfieldbordercolor, width: 2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: AppTextFieldWithOutBorder(
                      onChange: (text) {
                        if (text.length == 2) {
                          TextSelection previousSelection =
                              mpanFourController.selection;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: mpanThreeController,
                      digit: 2,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: themeApp.textfieldbordercolor,
                                width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: AppTextFieldWithOutBorder(
                      onChange: (text) {
                        if (text.length == 4) {
                          TextSelection previousSelection =
                              mpanFiveController.selection;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: mpanFourController,
                      digit: 4,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: themeApp.textfieldbordercolor, width: 2),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: AppTextFieldWithOutBorder(
                      onChange: (text) {
                        if (text.length == 4) {
                          TextSelection previousSelection =
                              mpanSixController.selection;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller: mpanFiveController,
                      digit: 4,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                    child: AppTextFieldWithOutBorder(
                      controller: mpanSixController,
                      digit: 3,
                      autoValidation: autoValidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    textInputType: TextInputType.text,
                    controller: dayEacController,
                    autoValidation: autoValidation,
                    title: AppString.dayEac,
                    hintText: AppString.dayEac,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.dayEac);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppTextField(
                    textInputType: TextInputType.text,
                    controller: nightEacController,
                    autoValidation: autoValidation,
                    title: AppString.nightEac,
                    hintText: AppString.nightEac,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.nightEac);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Contract Start Date
                  Text(
                    AppString.contractStartDate,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  DateTextFieldWidget(
                    autoValidate: autoValidation,
                    obscureText: false,
                    hintText: 'Select Date',
                    controller: contractStartDateController,
                    textInputType: TextInputType.text,
                    validator: (value) => AppConstant.stringValidator(
                        value, AppString.selectDate),
                    onTap: () {
                      selectDate(context, AppString.required);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  PurpleFlatButton(
                    text: AppString.update,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
