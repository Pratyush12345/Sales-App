import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasGasViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';

class GasTab extends StatefulWidget {
  final Function incrementTab;
  GasTab({this.incrementTab});
  @override
  _GasTabState createState() => _GasTabState();
}

class _GasTabState extends State<GasTab> {
  final _formKey = GlobalKey<FormState>();
  //String contractStartDate;
  String standingError;
  String unitError;
  String aqError;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasGasAddProspectViewModel>(
            onModelReady: (model) => model.initialData(widget.incrementTab),
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        AppTextField(
                          //mandatory: true,
                          title: AppString.mPRN,
                          controller: model.mprnController,
                          autoValidation: model.autovalidation,
                          hintText: AppString.mPRN,
                          validator: (value) {
                            AppConstant.stringValidator(value, AppString.mPRN);
                            if (value.isNotEmpty) {
                              if (value.length < 7) {
                                return "please enter valid MPRN";
                              }
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Contract Start Date',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color.fromRGBO(31, 33, 29, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \*',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InkWell(
                          child: SizedBox(
                            // height: MediaQuery.of(context).size.height * .062,
                            child: datetextfield(
                                model.contractStartDateController,
                                false,
                                model.autovalidation,
                                TextInputType.text,
                                "Select date", (value) {
                              if (value.isNotEmpty) {
                                model.contractStartDate = "";
                              }
                              return null;
                            }, context),
                          ),
                          onTap: () {
                            model.selectDateContractStart(
                                context, "Contract Start Date");
                          },
                        ),
                        model.contractStartDate != null
                            ? Text(
                                model.contractStartDate,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Contract End Date',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color.fromRGBO(31, 33, 29, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \*',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          //height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .062,
                                        child: Row(
                                          children: <Widget>[
                                            model.contractEndDateSelected == 1
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  )
                                                : InkWell(
                                                    child: Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      color: Color.fromRGBO(
                                                          155, 119, 217, 1),
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        model.contractEndDateSelected =
                                                            1;
                                                      });
                                                    },
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .0015,
                                            ),
                                            Text(
                                              "12 Month",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .02,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          model.contractEndDateSelected = 1;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .062,
                                        child: Row(
                                          children: <Widget>[
                                            model.contractEndDateSelected == 2
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1))
                                                : InkWell(
                                                    child: Icon(
                                                        Icons
                                                            .radio_button_unchecked,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .023,
                                                        color: Color.fromRGBO(
                                                            155, 119, 217, 1)),
                                                    onTap: () {
                                                      setState(() {
                                                        model.contractEndDateSelected =
                                                            2;
                                                      });
                                                    },
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .0015,
                                            ),
                                            Text(
                                              "24 Month",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .02,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          model.contractEndDateSelected = 2;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .062,
                                        child: Row(
                                          children: <Widget>[
                                            model.contractEndDateSelected == 3
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  )
                                                : InkWell(
                                                    child: Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                      color: Color.fromRGBO(
                                                          155, 119, 217, 1),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        model.contractEndDateSelected =
                                                            3;
                                                      });
                                                    },
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .0015,
                                            ),
                                            Text(
                                              "36 Month",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .02,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          model.contractEndDateSelected = 3;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .062,
                                        child: Row(
                                          children: <Widget>[
                                            (model.contractEndDateSelected == 4)
                                                ? Icon(
                                                    Icons.radio_button_checked,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  )
                                                : InkWell(
                                                    child: Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                      color: Color.fromRGBO(
                                                          155, 119, 217, 1),
                                                    ),
                                                    onTap: () {
                                                      model
                                                          .endContractselectDate(
                                                              context,
                                                              'fromfield');

                                                      setState(() {
                                                        model.contractEndDateSelected =
                                                            4;
                                                      });
                                                    },
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .0015,
                                            ),
                                            Text(
                                              "Other",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          .02,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .8)),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        model.endContractselectDate(
                                            context, 'fromfield');

                                        setState(() {
                                          model.contractEndDateSelected = 4;
                                        });
                                      },
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    //  height: MediaQuery.of(context).size.height * .062,
                                    width:
                                        MediaQuery.of(context).size.width * .25,

                                    child: model.contractEndDateSelected == 4
                                        ? datetextfieldWithoutBorder(
                                            model.contractEndDate,
                                            false,
                                            model.autovalidation = true,
                                            TextInputType.text,
                                            "Select date", (value) {
                                            if (model
                                                .contractEndDate.text.isEmpty) {
                                              return 'Choose Date';
                                            }
                                            return model.contractEndDate =
                                                value;
                                          }, context)
                                        : Container(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: ThemeApp().textfieldbordercolor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Standing Charge',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color.fromRGBO(31, 33, 29, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \*',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.standingCharge,
                              false,
                              model.autovalidation = true,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 1),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                              "Standing Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Standing charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Standing charge not acceptable. Try Again';
                              }
                              standingError = "";
                            }
                            return null;
                          }, context),
                        ),
                        standingError != null
                            ? Text(
                                standingError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Unit Charge',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color.fromRGBO(31, 33, 29, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \*',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.unitCharge,
                              false,
                              model.autovalidation = true,
                              TextInputType.numberWithOptions(decimal: true),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                              // DecimalTextInputFormatter(decimalRange: 2),
                              "Unit Charge", (value) {
                            // String patttern = r'\d{0,2}(\.?\d{1,5})';
                            String patttern = r'^([0-9]\d{0,3})(\.\d{0,4})?$';
                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Day Unit not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Day Unit not acceptable. Try Again';
                              }
                              unitError = "";
                            }
                            return null;
                          }, context),
                        ),
                        unitError != null
                            ? Text(
                                unitError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'AQ',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color.fromRGBO(31, 33, 29, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \*',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.aq,
                              false,
                              model.autovalidation = true,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 1),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                              "AQ Charge", (value) {
                            String patttern = r'\d{0,2}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Day Unit not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Day Unit not acceptable. Try Again';
                              }
                              aqError = "";
                            }
                            return null;
                          }, context),
                        ),
                        aqError != null
                            ? Text(
                                aqError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.062,
                            child: Center(
                              child: Text(
                                "Save And Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 119, 217, 1),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus &&
                                currentFocus.focusedChild != null) {
                              currentFocus.focusedChild.unfocus();
                            }
                            if (model.mprnController.text.length >= 7 &&
                                model.contractStartDateController.text
                                    .isNotEmpty &&
                                model.contractEndDateSelected != 0 &&
                                model.standingCharge.text.isNotEmpty &&
                                model.unitCharge.text.isNotEmpty &&
                                model.aq.text.isNotEmpty) {
                              _formKey.currentState.save();
                              model.onSaveAndNextFinal();
                              int index = globals.tabController.index;
                              globals.tabController.animateTo(index + 1);
                              // globals.tabController.animateTo(1);
                            } else {
                              setState(() {
                                AppConstant.showFailToast(
                                    context, "Please add required fields");
                                model.autovalidation = true;
                              });
                              if (model
                                  .contractStartDateController.text.isEmpty) {
                                setState(() {
                                  model.contractStartDate =
                                      'Enter a valid start Date';
                                });
                              }
                              if (model.standingCharge.text.isEmpty) {
                                standingError = 'Enter a valid Standing Charge';
                              }
                              if (model.unitCharge.text.isEmpty) {
                                unitError = 'Enter a valid Unit Charge';
                              }
                              if (model.aq.text.isEmpty) {
                                aqError = 'Enter a valid AQ Charge';
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
