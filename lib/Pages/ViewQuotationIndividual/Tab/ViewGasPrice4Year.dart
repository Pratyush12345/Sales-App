import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/gas_price_one_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class ViewGasPrice4Year extends StatefulWidget {
  /* final String accountId;*/
  final String quoteId;
  final RequestQuoteViewButtonModel requestQuote;
  final String title;
  //termType comes from individual tab

  const ViewGasPrice4Year({this.quoteId, this.requestQuote, this.title});

  @override
  _ViewGasPrice4YearState createState() => _ViewGasPrice4YearState();
}

class _ViewGasPrice4YearState extends State<ViewGasPrice4Year> {
  bool _autovalidation = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  bool fieldsEnabled = true;
  bool requestedRequote = false;
  bool enableExportEmail = true;
  bool enableSaveValid = true;
  bool enableGenContract = true;
  bool enableAskForRequote = true;

  //double gas4YearStandingVar;
  double gas4YearAffiliateUnitVar;
  List<String> contractEndDate;
  ThemeApp themeApp = ThemeApp();

  void initState() {
    contractEndDate = DateTime.parse(
            widget.requestQuote.contractstartdate.split('/').reversed.join())
        .add(new Duration(days: 1460))
        .toString()
        .substring(0, 10)
        .split('-');
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
    return widget.quoteId != null
        ? BaseView<GasPriceOneViewModel>(
            onModelReady: (model) =>
                model.initializeData(widget.requestQuote, '4'),
            builder: (context, model, child) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: model.state == ViewState.BUSY
                      ? AppConstant.circularProgressIndicator()
                      : Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.03),
                          child: ListView(children: [
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
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: new Border(
                                        left: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        bottom: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                      )),

                                      //color: Color.fromRGBO(18, 122, 69, 1),
                                      child: Text(
                                        "Start Date : ${widget.requestQuote.contractstartdate}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                                InkWell(
                                  // onTap: () {
                                  //   model.selectDate(context, 'end');
                                  // },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
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
                                      'End Date : ${contractEndDate[2]}/${contractEndDate[1]}/${contractEndDate[0]}',
                                      style: TextStyle(
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                    ),
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  // padding: EdgeInsets.all(10),
                                  //height: 500,
                                  child: AppTextField(
                                    enabled: false,
                                    title: AppString.standingCharge,
                                    controller:
                                        model.baseStandingChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      DecimalTextInputFormatter(
                                          decimalRange: 4),
                                      WhitelistingTextInputFormatter(
                                        RegExp(r'^\d+.?\d{0,4}'),
                                      ),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.standingCharge),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  //padding: EdgeInsets.all(10),
                                  //height: 500,
                                  child: AppTextField(
                                    enabled: false,
                                    title: AppString.unitCharge,
                                    controller: model.baseUniteChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      DecimalTextInputFormatter(
                                          decimalRange: 4),
                                      WhitelistingTextInputFormatter(
                                        RegExp(r'^\d+.?\d{0,4}'),
                                      ),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.unitCharge),
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  // padding: EdgeInsets.all(10),
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
                                      title: AppString.standingCharge,
                                      controller: model
                                          .requiredStandingChargeController,
                                      autoValidation: _autovalidation = true,
                                      textInputType: TextInputType.number,
                                      hintText: '',
                                      textInputFormatter: [
                                        DecimalTextInputFormatter(
                                            decimalRange: 4),
                                        WhitelistingTextInputFormatter(
                                          RegExp(r'^\d+.?\d{0,4}'),
                                        ),
                                      ],
                                      validator: (value) {
                                        String patttern =
                                            r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                        RegExp regExp = new RegExp(patttern);
                                        if (value.length != 0) {
                                          if (model.gasStandingVar != null) {
                                            if (model.gasStandingVar > 0) {
                                              if (double.tryParse(value) > 25) {
                                                return 'Max value is 25';
                                              } else {}
                                            }
                                            if (model.gasStandingVar == 0) {
                                              if (double.tryParse(value) > 50) {
                                                return 'Max value is 50';
                                              }
                                            }
                                          } else {
                                            if (double.tryParse(value) > 50) {
                                              return 'Max value is 50';
                                            }
                                          }
                                        }
                                      }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  //padding: EdgeInsets.all(10),
                                  //height: 500,
                                  child: AppTextField(
                                    onChanged: (text) {
                                      if (text.isEmpty) {
                                        setState(() {
                                          model.finalBase = '0';
                                        });
                                      } else {
                                        setState(() {
                                          model.finalBase = text;
                                          model.gasStandingVar =
                                              double.tryParse(text.toString());
                                        });
                                      }
                                    },
                                    enabled: fieldsEnabled,
                                    title: AppString.unitCharge,
                                    controller:
                                        model.requiredBaseUniteChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      DecimalTextInputFormatter(
                                          decimalRange: 4),
                                      WhitelistingTextInputFormatter(
                                        RegExp(r'^\d+.?\d{0,4}'),
                                      ),
                                    ],
                                    validator: (value) {
                                      String patttern =
                                          r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';

                                      RegExp regExp = new RegExp(patttern);
                                      if (value.isNotEmpty) {
                                        // if (value.length > 9) {
                                        //   return 'Please enter 0 or 1';
                                        // } else if (!regExp.hasMatch(value)) {
                                        //   return 'Please enter 0 or 1';
                                        // }
                                        if (value.isNotEmpty) {
                                          if (double.tryParse(value) > 1.5) {
                                            return 'max value 1.5';
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
                              height: 15,
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
                                        text: 'Standing Charge',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .44,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.057,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color:
                                                  themeApp.textfieldbordercolor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Text(
                                        (double.tryParse(model
                                                            .baseStandingChargeController
                                                            .text !=
                                                        ''
                                                    ? model
                                                        .baseStandingChargeController
                                                        .text
                                                    : '0'.toString()) +
                                                double.tryParse(
                                                    model.finalSc != ''
                                                        ? model.finalSc
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
                                        text: 'Unit Charge',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .44,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.057,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color:
                                                  themeApp.textfieldbordercolor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Text(
                                        (double.tryParse(model
                                                            .baseUniteChargeController
                                                            .text !=
                                                        ''
                                                    ? model
                                                        .baseUniteChargeController
                                                        .text
                                                    : '0'.toString()) +
                                                double.tryParse(
                                                    model.finalBase != ''
                                                        ? model.finalBase
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
                              height: 15,
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
                            Form(
                              key: _formKey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    child: AppTextField(
                                        enabled: fieldsEnabled,
                                        title: AppString.standingCharge,
                                        autoValidation: true,
                                        controller: model
                                            .affiliateStandingChargeController,
                                        textInputFormatter: [
                                          DecimalTextInputFormatter(
                                              decimalRange: 4),
                                          WhitelistingTextInputFormatter(
                                            RegExp(r'^\d+.?\d{0,4}'),
                                          ),
                                        ],
                                        validator: (value) {
                                          String patttern =
                                              r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                          RegExp regExp = new RegExp(patttern);
                                          if (value.length != 0) {
                                            if (gas4YearAffiliateUnitVar !=
                                                null) {
                                              if (gas4YearAffiliateUnitVar >
                                                  0) {
                                                if (double.tryParse(value) >
                                                    25) {
                                                  return 'Max value is 25';
                                                } else {}
                                              }
                                              if (gas4YearAffiliateUnitVar ==
                                                  0) {
                                                if (double.tryParse(value) >
                                                    50) {
                                                  return 'Max value is 50';
                                                }
                                              }
                                            } else {
                                              if (double.tryParse(value) > 50) {
                                                return 'Max value is 50';
                                              }
                                            }
                                          }
                                        }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    //  height: MediaQuery.of(context).size.height*0.062,
                                    //padding: EdgeInsets.all(10),
                                    //height: 500,
                                    child: AppTextField(
                                      enabled: fieldsEnabled,
                                      title: AppString.unitCharge,
                                      controller: model
                                          .affiliateBaseUniteChargeController,
                                      autoValidation: _autovalidation,
                                      textInputType: TextInputType.number,
                                      hintText: '',
                                      onChanged: (text) {
                                        setState(() {
                                          gas4YearAffiliateUnitVar =
                                              double.tryParse(text.toString());
                                        });
                                      },
                                      textInputFormatter: [
                                        DecimalTextInputFormatter(
                                            decimalRange: 4),
                                        WhitelistingTextInputFormatter(
                                          RegExp(r'^\d+.?\d{0,4}'),
                                        ),
                                      ],
                                      validator: (value) {
                                        String patttern =
                                            r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';

                                        RegExp regExp = new RegExp(patttern);
                                        if (value.isNotEmpty) {
                                          if (value.isNotEmpty) {
                                            if (double.tryParse(value) > 1.5) {
                                              return 'max value 1.5';
                                            }
                                          }
                                        }
                                        return null;
                                      },
                                      /*  validator: (value) =>
                                          AppConstant.stringValidator(
                                              value, AppString.unitCharge),*/
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            enableExportEmail
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.058,
                                          child: Center(
                                            child: Text(
                                              "Export Tender Price",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.058,
                                          child: Center(
                                            child: Text(
                                              "Email Tender Price",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            enableSaveValid
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  )
                                : SizedBox(),
                            enableSaveValid
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.058,
                                          child: Center(
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  95, 183, 97, 1),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                        onTap: () {
                                          if (model.requiredStandingChargeController
                                                      .text !=
                                                  '' &&
                                              model.requiredBaseUniteChargeController
                                                      .text !=
                                                  '') {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();
                                              model.onSaved(
                                                  user.accountId,
                                                  widget.quoteId,
                                                  widget.requestQuote,
                                                  '4',
                                                  context);
                                            }
                                          } else {
                                            setState(() {
                                              FocusScope.of(context).unfocus();
                                              AppConstant.popUp(context,
                                                  'Required Uplift must be greater than or equal to zero');
                                            });
                                          }
                                        },
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.058,
                                          child: Center(
                                            child: Text(
                                              "Valid",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.018,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  67, 140, 200, 1),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            enableGenContract
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  )
                                : SizedBox(),
                            enableGenContract
                                ? InkWell(
                                    onTap: () {
                                      if (model.requiredStandingChargeController.text != '' &&
                                          model.requiredBaseUniteChargeController
                                                  .text !=
                                              '' &&
                                          model.gasStandingVar != null) {
                                        if (widget.quoteId != null) {
                                          if (model.gasStandingVar == 0 &&
                                              double.tryParse(model
                                                      .requiredStandingChargeController
                                                      .text) <
                                                  50) {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();

                                              model
                                                  .generateIndividualContractView(
                                                      user.accountId,
                                                      widget.quoteId,
                                                      widget.requestQuote,
                                                      '4',
                                                      context);
                                            } else {
                                              setState(() {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                AppConstant.popUp(context,
                                                    'Required Uplift must be greater than or equal to zero');
                                                _autovalidation = true;
                                              });
                                            }
                                          }
                                          if (model.gasStandingVar != 0) {
                                            if (model.gasStandingVar < 1.5) {
                                              if (double.tryParse(model
                                                      .requiredStandingChargeController
                                                      .text) <
                                                  25) {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  _formKey.currentState.save();

                                                  model
                                                      .generateIndividualContractView(
                                                          user.accountId,
                                                          widget.quoteId,
                                                          widget.requestQuote,
                                                          '4',
                                                          context);
                                                } else {
                                                  setState(() {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    AppConstant.popUp(context,
                                                        'Required Uplift must be greater than or equal to zero');
                                                    _autovalidation = true;
                                                  });
                                                }
                                              }
                                            } else {
                                              FocusScope.of(context).unfocus();
                                              AppConstant.popUp(context,
                                                  'Invalid Unit Charge');
                                            }
                                          }
                                        }
                                      } else if (model
                                                  .requiredStandingChargeController
                                                  .text !=
                                              '' &&
                                          model.requiredBaseUniteChargeController
                                                  .text !=
                                              '' &&
                                          model.gasStandingVar == null) {
                                        if (double.tryParse(model
                                                .requiredBaseUniteChargeController
                                                .text) ==
                                            0) {
                                          if (!(double.tryParse(model
                                                  .requiredStandingChargeController
                                                  .text) >
                                              50)) {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();

                                              model
                                                  .generateIndividualContractView(
                                                      user.accountId,
                                                      widget.quoteId,
                                                      widget.requestQuote,
                                                      '4',
                                                      context);
                                            }
                                          } else {
                                            FocusScope.of(context).unfocus();
                                            AppConstant.popUp(context,
                                                'Invalid Standing Charge');
                                          }
                                        }
                                        if (!(double.tryParse(model
                                                .requiredBaseUniteChargeController
                                                .text) ==
                                            0)) {
                                          if (!(double.tryParse(model
                                                  .requiredBaseUniteChargeController
                                                  .text) >
                                              1.5)) {
                                            if (!(double.tryParse(model
                                                    .requiredStandingChargeController
                                                    .text) >
                                                25)) {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();

                                                model
                                                    .generateIndividualContractView(
                                                        user.accountId,
                                                        widget.quoteId,
                                                        widget.requestQuote,
                                                        '4',
                                                        context);
                                              }
                                            } else {
                                              FocusScope.of(context).unfocus();
                                              AppConstant.popUp(context,
                                                  'Invalid Standing Charge');
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
                                          MediaQuery.of(context).size.height *
                                              0.058,
                                      child: Center(
                                        child: Text(
                                          "Generate Contract",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.019,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )
                                : Container(),
                            enableAskForRequote
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.028,
                                  )
                                : Container(),
                            enableAskForRequote
                                ? InkWell(
                                    onTap: () {
                                      if (widget.quoteId != null) {
                                        model.onAskQuote(user.accountId,
                                            widget.quoteId, context);
                                      } else {
                                        setState(() {
                                          _autovalidation = true;
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.058,
                                      child: Center(
                                        child: Text(
                                          "Ask for Requote",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.019,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )
                                : Container(),
                            (!fieldsEnabled)
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.028,
                                  )
                                : SizedBox(),
                            (!fieldsEnabled)
                                ? InkWell(
                                    onTap: () {
                                      int tabIndex =
                                          globals.tabController3.index;
                                      int tabLength =
                                          globals.tabController3.length;
                                      if (tabIndex + 1 < tabLength) {
                                        globals.tabController3
                                            .animateTo(tabIndex + 1);
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.062,
                                      child: Center(
                                        child: Text(
                                          "Save And Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.019,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            ),
                          ]),
                        ));
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
