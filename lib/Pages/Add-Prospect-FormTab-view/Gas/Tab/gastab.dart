import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
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
  @override
  _GasTabState createState() => _GasTabState();
}

class _GasTabState extends State<GasTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasGasAddProspectViewModel>(
            onModelReady: (model) => model.initialData(() {}),
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
                        DisableAppTextField(
                          enabled: false,
                          //mandatory: true,
                          title: AppString.mPRN,
                          controller: model.mprnController,
                          autoValidation: model.autovalidation,
                          hintText: AppString.mPRN,
                          validator: (value) {
                            AppConstant.stringValidator(value, AppString.mPRN);
                            // if(value.length <7){
                            //   return "please enter valid MPRN";
                            //
                            // }
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
                            child: Disabledatetextfield(
                                model.contractStartDateController,
                                false,
                                model.autovalidation,
                                false,
                                TextInputType.text,
                                "Select date",
                                (value) => AppConstant.stringValidator(
                                    value, AppString.selectDate),
                                /* (value) {
                              if (value.isEmpty) {
                                return 'Choose Date';
                              }
                              return null;
                            }*/
                                context),
                          ),
                          // onTap: () {
                          //   model.selectDateContractStart(
                          //       context, "Contract Start Date");
                          // },
                        ),
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
                          child: DisableDecimalInnertextfield(
                              model.standingCharge,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 1),
                              "Standing Charge", (value) {
                            String patttern = r'\d{0,2}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            // if (value.isEmpty) {
                            //   return 'Please enter standing charge';
                            // } else
                            if (value.length > 9) {
                              return ' please enter valid Standing Charge';
                            }
                            return null;
                          }, context),
                        ),
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
                          child: DisableDecimalInnertextfield(
                              model.unitCharge,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Unit Charge", (value) {
                            String patttern = r'\d{0,2}(\.?\d{1,5})';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isEmpty) {
                              return "Unit Chargecant be null";
                            }
                            if (value.length > 9) {
                              return 'Unit charge not acceptable. Try Again';
                            } else if (!regExp.hasMatch(value)) {
                              return 'unit charge not acceptable. Try Again';
                            }
                            return null;
                          }, context),
                        ),
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
                          child: DisableDecimalInnertextfield(
                              model.aq,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 1),
                              "AQ Charge", (value) {
                            String patttern = r'\d{0,2}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isEmpty) {
                              return 'Please enter AQ charge';
                            } else if (value.length > 9) {
                              return ' please enter valid AQ Charge';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.062,
                            child: Center(
                              child: Text(
                                "Go to Next",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: ThemeApp().purplecolor,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onTap: () {
                            globals.tabController.animateTo(1);
                          },
                        ),
                        // InkWell(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: MediaQuery.of(context).size.height * 0.062,
                        //     child: Center(
                        //       child: Text(
                        //         "Save And Next",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize:
                        //                 MediaQuery.of(context).size.height *
                        //                     0.017,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //     decoration: BoxDecoration(
                        //         color: Color.fromRGBO(155, 119, 217, 1),
                        //         borderRadius: BorderRadius.circular(30)),
                        //   ),
                        //   onTap: () {
                        //     if (model.mprnController.text.length >= 7 &&
                        //         model.contractStartDateController.text
                        //             .isNotEmpty &&
                        //         model.contractEndDateSelected != 0 &&
                        //         model.standingCharge.text.isNotEmpty &&
                        //         model.unitCharge.text.isNotEmpty &&
                        //         model.aq.text.isNotEmpty) {
                        //       _formKey.currentState.save();
                        //       model.onSaveAndNextFinal();
                        //       globals.tabController.animateTo(1);
                        //     } else {
                        //       setState(() {
                        //         AppConstant.showFailToast(
                        //             context, "Please add required fields");
                        //         model.autovalidation = true;
                        //       });
                        //     }
                        //   },
                        // ),
                        //
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
