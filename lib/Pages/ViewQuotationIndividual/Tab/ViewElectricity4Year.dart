import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/electricity_one_year_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class ViewElectricity4Year extends StatefulWidget {
  final String quoteId;
  final RequestQuoteViewButtonModel requestQuote;
  final String title;
  //termType comes from individual tab

  const ViewElectricity4Year({this.quoteId, this.requestQuote, this.title});

  @override
  _ViewElectricity4YearState createState() => _ViewElectricity4YearState();
}

class _ViewElectricity4YearState extends State<ViewElectricity4Year> {
  bool _autovalidation = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool fieldsEnabled = true;
  bool requestedRequote = false;
  bool enableExportEmail = true;
  bool enableSaveValid = true;
  bool enableGenContract = true;
  bool enableAskForRequote = true;
  ThemeApp themeApp = ThemeApp();

  // double ele4YearDAYRequiredUpLift;
  // double ele4YearNightRequiredUpLift;
  double ele4YearDayAffiliateUpLift;
  double ele4YearNightAffiliateUpLift;

  @override
  void initState() {
    if (widget.title == 'Requested') {
      fieldsEnabled = false;
      enableExportEmail = false;
      enableSaveValid = false;
      enableGenContract = false;
      enableAskForRequote = false;
    }
    if (widget.title == 'Requested Requote') {
      fieldsEnabled = false;
      enableSaveValid = false;
      enableGenContract = false;
      enableAskForRequote = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return BaseView<ElectricityOneYearViewModel>(
        onModelReady: (model) => model.initializeData(widget.requestQuote, '4'),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: AppConstant.circularProgressIndicator(),
            );
          }
          return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          padding: EdgeInsets.all(10),
                          color: Color.fromRGBO(18, 122, 69, 1),
                          child: Text(
                            "Contract",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            // onTap: () {
                            //   model.selectDate(context, 'start');
                            // },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.47,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: new Border(
                                  left: new BorderSide(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  bottom: new BorderSide(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                )),

                                //color: Color.fromRGBO(18, 122, 69, 1),
                                child: Text(
                                  "Start Date : ${widget.requestQuote.contractstartdate}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          InkWell(
                            // onTap: () {
                            //   model.selectDate(context, 'end');
                            // },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.47,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: new Border(
                                  left: new BorderSide(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  bottom: new BorderSide(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                  right: new BorderSide(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                )),
                                //color: Color.fromRGBO(18, 122, 69, 1),
                                child: Text(
                                  "End Date : ${widget.requestQuote.contractenddate4}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          //padding: EdgeInsets.only(top :10,bottom: 10),
                          child: Text(
                            "Base Rate",
                            style: TextStyle(
                                color: Color.fromRGBO(18, 122, 69, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      new Divider(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: false,
                              title: AppString.day,
                              controller: model.dayController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              hintText: 'Day',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              validator: (value) => AppConstant.stringValidator(
                                  value, AppString.day),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: false,
                              title: AppString.night,
                              controller: model.nightController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.number,
                              hintText: 'night',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              validator: (value) => AppConstant.stringValidator(
                                  value, AppString.day),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: false,
                              title: AppString.eWE,
                              controller: model.eweController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.number,
                              hintText: 'EWE',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              // validator: (value) => AppConstant.stringValidator(
                              //     value, AppString.eWE),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: false,
                              title: AppString.sc,
                              controller: model.scController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.number,
                              hintText: 'SC',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              validator: (value) => AppConstant.stringValidator(
                                  value, AppString.sc),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          //padding: EdgeInsets.only(top :10,bottom: 10),
                          child: Text(
                            "Required Uplift",
                            style: TextStyle(
                                color: Color.fromRGBO(18, 122, 69, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      new Divider(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: fieldsEnabled,
                              title: AppString.day,
                              controller: model.requiredUpLiftDayController,
                              autoValidation: _autovalidation = true,
                              hintText: 'Day',
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  setState(() {
                                    model.finalDay = '0';
                                  });
                                } else {
                                  setState(() {
                                    model.finalDay = text;
                                    // eleDAYRequiredUpLift =
                                    //     double.tryParse(text.toString());
                                  });
                                }
                                setState(() {
                                  model.eleStandingVar =
                                      double.tryParse(text.toString());
                                });
                              },
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              textInputFormatter: [
                                DecimalTextInputFormatter(
                                  decimalRange: 4,
                                ),
                                WhitelistingTextInputFormatter(
                                  RegExp(r'^\d+.?\d{0,4}'),
                                ),
                              ],
                              validator: (value) {
                                String patttern =
                                    r'^([0-3]\d{0})(\.[0-5]\d{0,4})?$';

                                RegExp regExp = new RegExp(patttern);
                                if (value.isNotEmpty) {
                                  // if (value == 1 || value == 0) {
                                  //   if (!regExp.hasMatch(value)) {
                                  //     return 'enter valid value';
                                  //   }
                                  // }
                                  if (double.tryParse(value) > 3) {
                                    return 'max Uplift is 3';
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: fieldsEnabled,
                              title: AppString.night,
                              controller: model.requiredUpLiftNightController,
                              autoValidation: _autovalidation,
                              hintText: 'night',
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  setState(() {
                                    model.finalNight = '0';
                                  });
                                } else {
                                  setState(() {
                                    model.finalNight = text;

                                    model.eleStandingVar =
                                        double.tryParse(text.toString());
                                  });
                                }
                                setState(() {
                                  model.eleStandingVar =
                                      double.tryParse(text.toString());
                                });
                              },
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              textInputFormatter: [
                                DecimalTextInputFormatter(
                                  decimalRange: 4,
                                ),
                                WhitelistingTextInputFormatter(
                                  RegExp(r'^\d+.?\d{0,4}'),
                                ),
                              ],
                              validator: (value) {
                                String patttern =
                                    r'^([0-3]\d{0})(\.[0-5]\d{0,4})?$';

                                RegExp regExp = new RegExp(patttern);
                                if (value.isNotEmpty) {
                                  // if (value == 1 || value == 0) {
                                  //   if (!regExp.hasMatch(value)) {
                                  //     return 'enter valid value';
                                  //   }
                                  // }
                                  if (double.tryParse(value) > 3) {
                                    return 'max Uplift is 3';
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  setState(() {
                                    model.finalEwe = '0';
                                  });
                                } else {
                                  setState(() {
                                    model.finalEwe = text;
                                  });
                                }
                              },
                              enabled: fieldsEnabled,
                              title: AppString.eWE,
                              controller: model.requiredUpLiftEweController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.number,
                              hintText: 'EWE',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              // validator: (value) => AppConstant.stringValidator(
                              //     value, AppString.eWE),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                                onChanged: (text) {
                                  if (text.isEmpty) {
                                    setState(() {
                                      model.finalSc = '0';
                                    });
                                  } else {
                                    setState(() {
                                      model.finalSc = text;
                                    });
                                  }
                                },
                                enabled: fieldsEnabled,
                                title: AppString.sc,
                                controller: model.requiredUpLiftScController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.number,
                                hintText: 'SC',
                                textInputFormatter: [
                                  new WhitelistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (model.eleStandingVar != null) {
                                      if (model.eleStandingVar > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {
                                          if (double.tryParse(value) > 50) {
                                            return 'Max value is 50';
                                          }
                                        }
                                      }
                                      if (model.eleStandingVar == 0) {
                                        if (double.tryParse(value) > 100) {
                                          return 'Max value is 100';
                                        }
                                      }
                                    } else if (model.eleStandingVar != null) {
                                      if (model.eleStandingVar > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {
                                          return 'Max value is 100';
                                        }
                                      }
                                      if (model.eleStandingVar == 0) {
                                        if (double.tryParse(value) > 100) {
                                          return 'Max value is 100';
                                        }
                                      }
                                    } else {
                                      if (double.tryParse(value) > 100) {
                                        return 'Max value is 100';
                                      }
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          //padding: EdgeInsets.only(top :10,bottom: 10),
                          child: Text(
                            "Final Price",
                            style: TextStyle(
                                color: Color.fromRGBO(18, 122, 69, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      new Divider(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Day',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: themeApp.textfieldbordercolor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  (double.tryParse(
                                              model.dayController.text != ''
                                                  ? model.dayController.text
                                                  : '0'.toString()) +
                                          double.tryParse(model.finalDay != ''
                                              ? model.finalDay
                                              : '0'))
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Night',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: themeApp.textfieldbordercolor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  (double.tryParse(
                                              model.nightController.text != ''
                                                  ? model.nightController.text
                                                  : '0'.toString()) +
                                          double.tryParse(model.finalNight != ''
                                              ? model.finalNight
                                              : '0'))
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'EWE',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: themeApp.textfieldbordercolor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  (double.tryParse(
                                              model.eweController.text != ''
                                                  ? model.eweController.text
                                                  : '0'.toString()) +
                                          double.tryParse(model.finalEwe != ''
                                              ? model.finalEwe
                                              : '0'))
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'SC',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .015,
                                      color: Color.fromRGBO(31, 33, 29, 1)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: themeApp.textfieldbordercolor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  (double.tryParse(model.scController.text != ''
                                              ? model.scController.text
                                              : '0'.toString()) +
                                          double.tryParse(model.finalSc != ''
                                              ? model.finalSc
                                              : '0'))
                                      .toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          //padding: EdgeInsets.only(top :10,bottom: 10),
                          child: Text(
                            "Affiliate Uplift",
                            style: TextStyle(
                                color: Color.fromRGBO(18, 122, 69, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                      new Divider(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: fieldsEnabled,
                              title: AppString.day,
                              controller: model.affiliateUpLiftDayController,
                              autoValidation: _autovalidation,
                              hintText: 'Day',
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              textInputFormatter: [
                                DecimalTextInputFormatter(
                                  decimalRange: 4,
                                ),
                                WhitelistingTextInputFormatter(
                                  RegExp(r'^\d+.?\d{0,4}'),
                                ),
                              ],
                              onChanged: (text) {
                                setState(() {
                                  ele4YearDayAffiliateUpLift =
                                      double.tryParse(text.toString());
                                });
                              },
                              validator: (value) {
                                String patttern =
                                    r'^([0-3]\d{0})(\.[0-5]\d{0,4})?$';

                                RegExp regExp = new RegExp(patttern);

                                // if (value.isNotEmpty) {
                                //   if (value.length > 9) {
                                //     return 'enter valid value';
                                //   } else if (!regExp.hasMatch(value)) {
                                //     return 'enter valid value';
                                //   }
                                // }
                                if (value.isNotEmpty) {
                                  if (double.tryParse(value) > 3) {
                                    return 'max value 3';
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: fieldsEnabled,
                              title: AppString.night,
                              controller: model.affiliateUpLiftNightController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.numberWithOptions(
                                  decimal: true),
                              hintText: 'night',
                              onChanged: (text) {
                                setState(() {
                                  ele4YearNightAffiliateUpLift =
                                      double.tryParse(text.toString());
                                });
                              },
                              validator: (value) {
                                String patttern =
                                    r'^([0-3]\d{0})(\.[0-5]\d{0,4})?$';

                                RegExp regExp = new RegExp(patttern);

                                if (value.isNotEmpty) {
                                  // if (value.length > 9) {
                                  //   return 'enter valid value';
                                  // } else if (!regExp.hasMatch(value)) {
                                  //   return 'enter valid value';
                                  // }
                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 3) {
                                      return 'max value 3';
                                    }
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            // padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                              enabled: fieldsEnabled,
                              title: AppString.eWE,
                              controller: model.affiliateUpLiftEweController,
                              autoValidation: _autovalidation,
                              textInputType: TextInputType.number,
                              hintText: 'EWE',
                              textInputFormatter: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[0-9]")),
                              ],
                              // validator: (value) =>
                              //     AppConstant.stringValidator(
                              //         value, AppString.eWE),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .44,
                            //  height: MediaQuery.of(context).size.height*0.062,
                            //padding: EdgeInsets.all(10),
                            //height: 500,
                            child: AppTextField(
                                enabled: fieldsEnabled,
                                title: AppString.sc,
                                controller: model.affiliateUpLiftScController,
                                autoValidation: _autovalidation,
                                hintText: 'SC',
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                textInputFormatter: [
                                  DecimalTextInputFormatter(
                                    decimalRange: 4,
                                  ),
                                  WhitelistingTextInputFormatter(
                                    RegExp(r'^\d+.?\d{0,4}'),
                                  ),
                                ],
                                validator: (value) {
                                  String patttern =
                                      r'^([0-3]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (ele4YearNightAffiliateUpLift != null) {
                                      if (ele4YearNightAffiliateUpLift > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {}
                                      }
                                      if (ele4YearNightAffiliateUpLift == 0) {
                                        if (double.tryParse(value) > 100) {
                                          return 'Max value is 100';
                                        }
                                      }
                                    } else if (ele4YearDayAffiliateUpLift !=
                                        null) {
                                      if (ele4YearDayAffiliateUpLift > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {}
                                      }
                                      if (ele4YearDayAffiliateUpLift == 0) {
                                        if (double.tryParse(value) > 100) {
                                          return 'Max value is 100';
                                        }
                                      }
                                    } else {
                                      if (double.tryParse(value) > 100) {
                                        return 'Max value is 100';
                                      }
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                      AppTextField(
                        enabled: fieldsEnabled,
                        title: AppString.kva,
                        controller: model.supplyCapacityController,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(
                            RegExp(r'^\d+.?\d{0,4}'),
                          ),
                        ],
                        validator: (value) {
                          // if (value.isNotEmpty) {
                          //   if (value.length > 9) {
                          //     return 'enter valid value';
                          //   }
                          // }
                          if (value.isNotEmpty) {
                            if (double.tryParse(value) > 3) {
                              return 'max value 3';
                            }
                          }
                        },
                        // validator: (value) => AppConstant.stringValidator(
                        //     value, AppString.kva),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      AppTextField(
                        enabled: fieldsEnabled,
                        title: AppString.emrCFD,
                        controller: model.emrCFDController,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(
                            RegExp(r'^\d+.?\d{0,4}'),
                          ),
                        ],
                        validator: (value) {
                          // if (value.isNotEmpty) {
                          //   if (value.length > 9) {
                          //     return 'enter valid value';
                          //   }
                          // }
                          if (value.isNotEmpty) {
                            if (double.tryParse(value) > 3) {
                              return 'max value 3';
                            }
                          }
                        },
                        // validator: (value) => AppConstant.stringValidator(
                        //     value, AppString.emrCFD),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      AppTextField(
                        enabled: fieldsEnabled,
                        title: AppString.excess_capacityCharge,
                        controller: model.excessCapacityController,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(
                            RegExp(r'^\d+.?\d{0,4}'),
                          ),
                        ],
                        validator: (value) {
                          // if (value.isNotEmpty) {
                          //   if (value.length > 9) {
                          //     return 'enter valid value';
                          //   }
                          // }
                          if (value.isNotEmpty) {
                            if (double.tryParse(value) > 3) {
                              return 'max value 3';
                            }
                          }
                        },
                        // validator: (value) => AppConstant.stringValidator(
                        //     value, AppString.excess_capacityCharge),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      AppTextField(
                        enabled: fieldsEnabled,
                        title: AppString.reactiveCharge,
                        controller: model.reactiveController,
                        autoValidation: _autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(
                            RegExp(r'^\d+.?\d{0,4}'),
                          ),
                        ],
                        validator: (value) {
                          // if (value.isNotEmpty) {
                          //   if (value.length > 9) {
                          //     return 'enter valid value';
                          //   }
                          // }
                          if (value.isNotEmpty) {
                            if (double.tryParse(value) > 3) {
                              return 'max value 3';
                            }
                          }
                        },
                        // validator: (value) => AppConstant.stringValidator(
                        //     value, AppString.reactiveCharge),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      enableExportEmail
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Export Tender Price",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    model.onClickTenderPrice(
                                        true,
                                        user.accountId,
                                        widget.quoteId,
                                        context);
                                  },
                                ),
                                InkWell(
                                  onTap: () {
                                    model.onClickTenderPrice(
                                        false,
                                        user.accountId,
                                        widget.quoteId,
                                        context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Email Tender Price",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      enableSaveValid
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            )
                          : SizedBox(),
                      enableSaveValid
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .45,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.058,
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(95, 183, 97, 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    onTap: () {
                                      if (model.requiredUpLiftDayController
                                                  .text !=
                                              '' &&
                                          model.requiredUpLiftNightController
                                                  .text !=
                                              '' &&
                                          model.requiredUpLiftScController
                                                  .text !=
                                              '') {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          model.savePartnerPriceUpLift(
                                              user.accountId,
                                              widget.quoteId,
                                              widget.requestQuote,
                                              '4',
                                              context,
                                              false);
                                        }
                                      } else {
                                        setState(() {
                                          FocusScope.of(context).unfocus();
                                          AppConstant.popUp(context,
                                              'Required Uplift must be greater than or equal to zero');
                                        });
                                      }
                                    }),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Valid",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(67, 140, 200, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      enableGenContract
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            )
                          : SizedBox(),
                      enableGenContract
                          ? InkWell(
                              onTap: () {
                                if (model.requiredUpLiftDayController.text !=
                                        '' &&
                                    model.requiredUpLiftNightController.text !=
                                        '' &&
                                    model.requiredUpLiftScController.text !=
                                        '' &&
                                    model.eleStandingVar != null) {
                                  if (widget.quoteId != null) {
                                    if (model.eleStandingVar == 0 &&
                                        double.tryParse(model
                                                .requiredUpLiftScController
                                                .text) <
                                            100) {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        model.generateIndividualContractView(
                                            '4',
                                            user.accountId,
                                            widget.quoteId,
                                            widget.requestQuote,
                                            context,
                                            widget
                                                .requestQuote.baserateDayUnit3,
                                            widget.requestQuote
                                                .baserateNightUnit3);
                                      } else {
                                        setState(() {
                                          FocusScope.of(context).unfocus();
                                          AppConstant.popUp(context,
                                              'Required Uplift must be greater than or equal to zero');
                                          _autovalidation = true;
                                        });
                                      }
                                    }
                                    if (model.eleStandingVar != 0) {
                                      if (model.eleStandingVar < 3) {
                                        if (double.tryParse(model
                                                .requiredUpLiftScController
                                                .text) <
                                            100) {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();

                                            model
                                                .generateIndividualContractView(
                                                    '4',
                                                    user.accountId,
                                                    widget.quoteId,
                                                    widget.requestQuote,
                                                    context,
                                                    widget.requestQuote
                                                        .baserateDayUnit3,
                                                    widget.requestQuote
                                                        .baserateNightUnit3);
                                          } else {
                                            setState(() {
                                              FocusScope.of(context).unfocus();
                                              AppConstant.popUp(context,
                                                  'Invalid Unit Charge');
                                              _autovalidation = true;
                                            });
                                          }
                                        }
                                      } else {
                                        FocusScope.of(context).unfocus();
                                        AppConstant.popUp(
                                            context, 'Invalid Unit Charge');
                                      }
                                    }
                                  }
                                } else if (model
                                            .requiredUpLiftDayController.text !=
                                        '' &&
                                    model.requiredUpLiftNightController.text !=
                                        '' &&
                                    model.requiredUpLiftScController.text !=
                                        '' &&
                                    model.eleStandingVar == null) {
                                  if (double.tryParse(model
                                              .requiredUpLiftDayController
                                              .text) ==
                                          0 ||
                                      double.tryParse(model
                                              .requiredUpLiftNightController
                                              .text) ==
                                          0) {
                                    if (!(double.tryParse(model
                                            .requiredUpLiftScController.text) >
                                        1000)) {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        model.generateIndividualContractView(
                                            '4',
                                            user.accountId,
                                            widget.quoteId,
                                            widget.requestQuote,
                                            context,
                                            widget
                                                .requestQuote.baserateDayUnit3,
                                            widget.requestQuote
                                                .baserateNightUnit3);
                                      }
                                    } else {
                                      FocusScope.of(context).unfocus();
                                      AppConstant.popUp(
                                          context, 'Invalid Standing Charge');
                                    }
                                  }
                                  if (!(((double.tryParse(model
                                              .requiredUpLiftDayController
                                              .text)) ==
                                          0) ||
                                      (double.tryParse(model
                                              .requiredUpLiftNightController
                                              .text)) ==
                                          0)) {
                                    if (!((double.tryParse(model
                                                .requiredUpLiftDayController
                                                .text) >
                                            3) ||
                                        (double.tryParse(model
                                                .requiredUpLiftNightController
                                                .text) >
                                            3))) {
                                      if (!(double.tryParse(model
                                              .requiredUpLiftScController
                                              .text) >
                                          50)) {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();

                                          model.generateIndividualContractView(
                                              '4',
                                              user.accountId,
                                              widget.quoteId,
                                              widget.requestQuote,
                                              context,
                                              widget.requestQuote
                                                  .baserateDayUnit3,
                                              widget.requestQuote
                                                  .baserateNightUnit3);
                                        }
                                      } else {
                                        FocusScope.of(context).unfocus();
                                        AppConstant.popUp(
                                            context, 'Invalid Standing Charge');
                                      }
                                    }
                                  }
                                } else {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    AppConstant.popUp(context,
                                        'Required Uplift must be greater than or equal to zero');
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.058,
                                child: Center(
                                  child: Text(
                                    "Generate Contract",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )
                          : Container(),
                      enableAskForRequote
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            )
                          : SizedBox(),
                      enableAskForRequote
                          ? InkWell(
                              onTap: () {
                                if (widget.quoteId != null) {
                                  print('object');
                                  model.askForReQuoteView(
                                      user.accountId, widget.quoteId, context);
                                } else {
//    If all data are not valid then start auto validation.
                                  setState(() {
                                    _autovalidation = true;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.058,
                                child: Center(
                                  child: Text(
                                    "Ask for Requote",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )
                          : Container(),
                      fieldsEnabled
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            )
                          : SizedBox(),
                      (!fieldsEnabled)
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            )
                          : SizedBox(),
                      InkWell(
                        onTap: () {
                          if (fieldsEnabled) {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              model.savePartnerPriceUpLift(
                                  user.accountId,
                                  widget.quoteId,
                                  widget.requestQuote,
                                  '4',
                                  context,
                                  false);
                            }
                          } else {
                            int tabIndex = globals.tabController3.index;
                            int tabLength = globals.tabController3.length;
                            if (tabIndex + 1 < tabLength) {
                              globals.tabController3.animateTo(tabIndex + 1);
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.062,
                          child: Center(
                            child: Text(
                              "Save And Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 119, 217, 1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028,
                      ),
                    ],
                  ),
                ),
              ));
        });
    /*: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );*/
  }
}
