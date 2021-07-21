import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/group_quotation_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/services/text_formatter.dart';

class SiteDetailWidget extends StatefulWidget {
  final Function selectDate;
  final bool autoValidation;
  final bool fieldsEnabled;
  final TextEditingController startDateController;
  final TextEditingController businessNameController;
  final TextEditingController mpanCoreController;
  final TextEditingController mprnController;
  final Function add;
  final Function remove;
  final bool addButtonEnable;
  final bool removeButtonEnable;
  SiteDetailWidget({
    @required this.selectDate,
    this.autoValidation = false,
    this.fieldsEnabled = false,
    this.startDateController,
    this.businessNameController,
    this.mpanCoreController,
    this.mprnController,
    this.add,
    this.remove,
    this.addButtonEnable,
    this.removeButtonEnable,
  });

  @override
  _SiteDetailWidgetState createState() => _SiteDetailWidgetState();
}
GroupQuotationWidget groupquataionwidget = GroupQuotationWidget();


DateFormat dateRFormat = DateFormat("dd/MM/yyyy");
class _SiteDetailWidgetState extends State<SiteDetailWidget> {
  final ThemeApp themeApp = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                AppString.addSite,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * .022,
                  color: themeApp.purplecolor,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.addButtonEnable
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 0, top: 10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: Text(
                            '+ ADD',
                            style: TextStyle(
                                color: AppColors.defaultWhite, fontSize: 16),
                          ),
                          color: themeApp.purplecolor,
                          onPressed: widget.add,
                        ),
                      )
                    : Container(),
                widget.removeButtonEnable
                    ? InkWell(
                        onTap: widget.remove,
                        child: Container(
                          margin: widget.addButtonEnable
                              ? EdgeInsets.only(left: 10, top: 10)
                              : EdgeInsets.only(left: 10, top: 10, bottom: 5),
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          decoration: BoxDecoration(
            border: Border.all(
              color: themeApp.purplecolor,
              width: 2.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First Row
              Container(
                padding: EdgeInsets.all(10),
                child: AppTextField(
                  enabled: widget.fieldsEnabled,
                  title: AppString.businessName,
                  controller: widget.businessNameController,
                  autoValidation: widget.autoValidation,
                  textInputType: TextInputType.text,
                  hintText: AppString.businessName,
                  validator: (value) {
                    if (widget.businessNameController.text == '') {
                      return AppConstant.stringValidator(value,
                          'business name.');
                    }
                    return null;
                  },
                ),
              ),
              //Second Row
              Container(
                padding: EdgeInsets.all(10),
                child: AppTextField(
                  enabled: widget.fieldsEnabled,
                  title: AppString.mpanCore,
                  controller: widget.mpanCoreController,
                  autoValidation: widget.autoValidation,
                  textInputType: TextInputType.number,
                  hintText: AppString.mpanCore,
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                  ],
                  validator: (value) {

                    if (value.length>13) {
                      return
                          'valid upto 13 digits';
                    }
                    else if(value.length < 13 && value.length>0){
                      return "must enter 13 digits";
                    }
                    return null;
                  },
                ),
              ),
              //Third Row

              Container(
                padding: EdgeInsets.all(10),
                child: AppTextField(
                  enabled: widget.fieldsEnabled,
                  title: AppString.mprn10Digit,
                  controller: widget.mprnController,
                  autoValidation: widget.autoValidation,
                  textInputType: TextInputType.number,
                  hintText: AppString.mprn10Digit,
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                  ],

                  validator: (value) {
                    if (value.length>10) {
                      return
                        'valid upto 10 digits';
                    }

                    if(widget.mprnController.text == "" && widget.mpanCoreController.text == ""){
                      return "Please enter either MPAN Core or MPRN";
                    }
                    else if(value.length < 8 && value.length>0){
                      return "must enter 8 or 10 digits";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppString.preferredStartDate,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Color.fromRGBO(31, 33, 29, 1),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                         "*",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    DateTextFieldWidget(
                        autoValidate: true,
                        obscureText: false,
                        hintText: dateRFormat.format(DateTime.now()).toString(),
                        controller: widget.startDateController,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (widget.startDateController.text == "") {
                            return
                              'valid upto 10 digits';
                          }
                          return "please";
                        },
                        onTap: widget.selectDate),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
