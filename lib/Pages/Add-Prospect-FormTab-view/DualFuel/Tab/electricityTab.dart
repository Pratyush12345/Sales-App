import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/InsertAddProspect-viewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Core/Services/AuthService.dart';

class Electicity extends StatelessWidget {
  final Function incrementTab;
  Electicity({this.incrementTab});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<DualFuelELECTRICITYCredential>.value(
      value: AutService().dualFuel,
      initialData: DualFuelELECTRICITYCredential(),
      child: ElecticityData(),
    );
  }
}

class ElecticityData extends StatefulWidget {
  final String accountId;
  bool fieldsDisable;

  ElecticityData({this.accountId, this.fieldsDisable});

  @override
  _ElecticityDataState createState() => _ElecticityDataState();
}

class _ElecticityDataState extends State<ElecticityData> {
  bool _autovalidation = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  ThemeApp themeApp = ThemeApp();
  List fullMPNController = [];
  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null
        ? BaseView<DualFuelAddProspectViewModel>(
            onModelReady: (model) => model.initialData(() {}),
            builder: (context, model, child) {
              return Scaffold(
                key: _scaffoldKey,
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Full MPAN Textfield
                        RichText(
                          text: TextSpan(
                            text: 'Full Mpan',
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
                          height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Disablewithoutboderdropdowntextfield(
                                      model.mpancodecontroller,
                                      false,
                                      _autovalidation,
                                      false,
                                      TextInputType.text,
                                      "", (value) {
                                    if (value.isEmpty) {
                                      return 'Please Select Partner';
                                    }
                                    return null;
                                  }, context),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Color.fromRGBO(
                                                  128, 189, 40, 1)))),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller1,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      TextSelection previousSelection = model
                                          .businessnamecontroller2.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 3) {
                                      return 'Invalid mpan';
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .32,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller2,
                                  autoValidation: model.autovalidation = true,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      TextSelection previousSelection = model
                                          .businessnamecontroller3.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: '123',
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 3) {
                                      return 'Invalid mpan';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: themeApp.textfieldbordercolor,
                                  width: 2),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller3,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  onChange: (text) {
                                    if (text.length == 2) {
                                      TextSelection previousSelection = model
                                          .businessnamecontroller4.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 2) {
                                      return 'Invalid mpan';
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller4,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      TextSelection previousSelection = model
                                          .businessnamecontroller5.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 4) {
                                      return 'Invalid mpan';
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2))),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .23,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller5,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      TextSelection previousSelection = model
                                          .businessnamecontroller6.selection;
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 4) {
                                      return 'Invalid mpan';
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 189, 40, 1)))),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .23,
                                child: DisableAppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller6,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  enabled: false,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
                                    if (value.length != 3) {
                                      return 'Invalid mpan';
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: themeApp.textfieldbordercolor,
                                  width: 2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Contract Start Date

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
                            height: MediaQuery.of(context).size.height * .062,
                            child: Disabledatetextfield(
                                model.contractstartdatecontroller,
                                false,
                                _autovalidation,
                                false,
                                TextInputType.text,
                                "Select date", (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  return 'Please Select date';
                                } else {
                                  return value.text;
                                }
                              });

                              // return null;
                              return model.contractstartdatecontroller = value;
                            }, context),
                          ),
                          // onTap: () {
                          //   model.selectDate(context, "Required");
                          // },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Contract End Date

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
                                            //(a>c)?((a>d)?a:d):c):(b>c)

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
                                                      );

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
                                        setState(() {
                                          model.endContractselectDate(context);

                                          model.contractEndDateSelected = 4;
                                        });
                                      },
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                    right: MediaQuery.of(context).size.width *
                                        0.03),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    //  height: MediaQuery.of(context).size.height * .062,
                                    width:
                                        MediaQuery.of(context).size.width * .25,

                                    child: model.contractEndDateSelected == 4
                                        ? datetextfieldWithoutBorder(
                                            model.contractEndDateOther,
                                            false,
                                            model.autovalidation = true,
                                            TextInputType.text,
                                            "Select date", (value) {
                                            if (model.contractEndDateOther.text
                                                .isEmpty) {
                                              return 'Choose Date';
                                            }
                                            return model.contractEndDateOther =
                                                value;
                                          }, context)
                                        : Container(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.020,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Standing Charge',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' \*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            Text(
                              "(p/Day)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          // height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.standingCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 1),
                              //FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Standing Charge", (value) {
                            if (value.isEmpty) {
                              return 'Please enter standing charge';
                            } else if (value.length > 9) {
                              return ' please enter valid Standing Charge';
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Day Unit Charge',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' \*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            Text(
                              "(p/KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.dayUnitCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 1),

                              //FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Day Unit Charge", (value) {
                            String patttern = r'^([1-9]\d{0,9})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,3}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isEmpty) {
                              return "Standing charge cant be empty";
                            }
                            if (value.length > 9) {
                              return 'Standing charge not acceptable. Try Again';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Standing unit charge not acceptable. Try Again';
                            }
                            // if (value.isEmpty) {
                            //   return 'Please enter day unit';
                            // } else if (value.length > 10) {}

                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Night Unit Charge',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                                /*      children: <TextSpan>[
                                  TextSpan(
                                      text: ' \*',
                                      style: TextStyle(color: Colors.red)),
                                ],*/
                              ),
                            ),
                            Text(
                              "(p/KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.nightUnitCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),

                              //   FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Night Unit Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Night charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Night unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //EWE Unit Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'EWE Unit Charge',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                                /*  children: <TextSpan>[
                                  TextSpan(
                                      text: ' \*',
                                      style: TextStyle(color: Colors.red)),
                                ],*/
                              ),
                            ),
                            Text(
                              "(p/KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.eweUnitCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),

                              //  FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "EWE Unit Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'EWE charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'EWE unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Capacity Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Capacity Charge",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(p/KVA)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.capacityCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),

                              // FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Capacity Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Capacity charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'capacity unit charge not acceptable. Try Again';
                              }
                            }

                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Excess Capacity Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Excess Capacity Charge",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(p/KVA)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.excessCapacityCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),

                              // FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Excess Capacity Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Excess charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Excess unit charge not acceptable. Try Again';
                              }
                            }

                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //EMR Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "EMR Charge",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(p/KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.emrCharge,
                              false,
                              _autovalidation = true,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              //FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}\.?\d{1,5}')),

                              "EMR Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'EMR charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'EMR unit charge not acceptable. Try Again';
                              }
                            }

                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Energization Status Dropdown

                        Text(
                          "Energization Status",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .062,
                            child: dropdowntextfield(
                                model.energizationcontroller,
                                false,
                                _autovalidation,
                                TextInputType.text,
                                "Select Energization Status", (value) {
                              if (value.isEmpty) {
                                return 'Please select energization status';
                              }

                              return null;
                            }, context),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Day EAC Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Day EAC",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.dayEAC,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Day EAC Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Day EAC charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Day EAC unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Night EAC Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Night EAC",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.nightEAC,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Night EAC Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Night EAC charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Night EAC unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //EWE EAC Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "EWE EAC",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(KWH)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.eweEAC,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "EWE EAC Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'EWE EAC charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'EWE EAC unit charge not acceptable. Try Again';
                              }
                            }

                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Site Capacity Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Site Capacity",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(KVA)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.siteCapacity,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Site Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'site charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'site unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //Reactive Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Reactive Charge",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(kVArh)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.reactiveCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Reactive Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Reactive charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Reactive unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //FIT Charge Textfield

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "FIT Charge",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            Text(
                              "(p/KVA)",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .062,
                          child: DisableDecimalInnertextfield(
                              model.fitCharge,
                              false,
                              _autovalidation,
                              false,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "FIT Charges", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'FIT charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Fit unit charge not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //New Connection Dropdown

                        Text(
                          "New Connection",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .062,
                            child: dropdowntextfield(
                                model.newConnection,
                                false,
                                _autovalidation,
                                TextInputType.text,
                                "Select New Connection", (value) {
                              // if (value.isEmpty) {
                              //   return 'Please select new connection';
                              // }

                              return null;
                            }, context),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        //RHT Meter Checkbox

                        Container(
                          height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.rhtMeter
                                          ? Icon(
                                              Icons.check_box,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                            )
                                          : InkWell(
                                              child: Icon(
                                                Icons.check_box_outline_blank,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.rhtMeter =
                                                      !model.rhtMeter;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      Text(
                                        "RHT Meter",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                            color: Color.fromRGBO(0, 0, 0, .8)),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    model.rhtMeter = !model.rhtMeter;
                                  });
                                },
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
                        model.rhtMeter
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
//rht fullMpan
                                  RichText(
                                    text: TextSpan(
                                      text: 'Full Mpan',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' \*',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .062,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child:
                                                Disablewithoutboderdropdowntextfield(
                                                    model
                                                        .rhtDFMpancodecontroller,
                                                    false,
                                                    model.autovalidation,
                                                    false,
                                                    TextInputType.text,
                                                    "", (value) {
                                              if (value.isEmpty) {
                                                return 'Please Select Code';
                                              }
                                              return null;
                                            }, context),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        color: Color.fromRGBO(
                                                            128, 189, 40, 1)))),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller1,
                                            autoValidation: _autovalidation,
                                            textInputType: TextInputType.number,
                                            enabled: false,
                                            onChange: (text) {
                                              if (text.length == 3) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtDFBusinessnamecontroller2
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            hintText: '123',
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');
                                              if (value.length != 3) {
                                                return 'Invalid mpan';
                                              }
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color.fromRGBO(
                                                          128, 189, 40, 1)))),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .32,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller2,
                                            autoValidation: _autovalidation,
                                            hintText: '123',
                                            enabled: false,
                                            onChange: (text) {
                                              if (text.length == 3) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtDFBusinessnamecontroller3
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            textInputType: TextInputType.number,
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');
                                              if (value.length != 3) {
                                                return 'Invalid mpan';
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .062,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .23,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller3,
                                            autoValidation: _autovalidation,
                                            textInputType: TextInputType.number,
                                            hintText: '12',
                                            enabled: false,
                                            onChange: (text) {
                                              if (text.length == 2) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtDFBusinessnamecontroller4
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');
                                              if (value.length != 2) {
                                                return 'Invalid mpan';
                                              }
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: themeApp
                                                          .textfieldbordercolor,
                                                      width: 2))),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .23,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller4,
                                            autoValidation: _autovalidation,
                                            enabled: false,
                                            textInputType: TextInputType.number,
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            hintText: '1234',
                                            onChange: (text) {
                                              if (text.length == 4) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtDFBusinessnamecontroller5
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');

                                              if (value.length != 4) {
                                                return 'Invalid mpan';
                                              }
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: themeApp
                                                          .textfieldbordercolor,
                                                      width: 2))),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .23,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller5,
                                            enabled: false,
                                            autoValidation: _autovalidation,
                                            textInputType: TextInputType.number,
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            hintText: '1234',
                                            onChange: (text) {
                                              if (text.length == 4) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtDFBusinessnamecontroller6
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');
                                              if (value.length != 4) {
                                                return 'Invalid mpan';
                                              }
                                              return null;
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Color.fromRGBO(
                                                          128, 189, 40, 1)))),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .23,
                                          child:
                                              DisableAppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller6,
                                            autoValidation: _autovalidation,
                                            textInputType: TextInputType.number,
                                            hintText: '123',
                                            enabled: false,
                                            onChange: (text) {
                                              if (text.length == 3) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            validator: (value) {
                                              AppConstant.stringValidator(
                                                  value, '');
                                              if (value.length != 3) {
                                                return 'Invalid mpan';
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                themeApp.textfieldbordercolor,
                                            width: 2),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.022,
                                  ),
                                  //rht standing charge
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'Standing Charge',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' \*',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "(p/Day)",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height * .062,
                                    child: DisableDecimalInnertextfield(
                                        model.rhtDFstandingCharge,
                                        false,
                                        _autovalidation,
                                        false,
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                        DecimalTextInputFormatter(
                                            decimalRange: 2),

                                        //FilteringTextInputFormatter.allow(RegExp(r'9|\b\d{0,9}(\.?\d{0,5})')),
                                        "Standing Charge", (value) {
                                      return null;
                                    }, context),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
// rht night unit
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'Night Unit Charge',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' \*',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "(p/KWH)",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height * .062,
                                    child: DisableDecimalInnertextfield(
                                        model.rhtDFnightUnitCharge,
                                        false,
                                        _autovalidation,
                                        false,
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                                        "Night Unit Charge", (value) {
                                      String patttern = r'\d{0,9}(\.?\d{1,5})';
                                      RegExp regExp = new RegExp(patttern);
                                      RegExp _numeric = RegExp(r'^-?[0-9]+$');

                                      return null;
                                    }, context),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),

//rht night EAC
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'Night EAC',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' \*',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "(KWH)",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height * .062,
                                    child: DisableDecimalInnertextfield(
                                        model.rhtDFnightEAC,
                                        false,
                                        _autovalidation,
                                        false,
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                                        "night EAC Charge", (value) {
                                      String patttern = r'\d{0,9}(\.?\d{1,5})';
                                      RegExp regExp = new RegExp(patttern);

                                      return null;
                                    }, context),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                ],
                              )
                            : Container(),
                        // (model.rhtError != '')
                        //     ? Text(model.rhtError,
                        //         style: TextStyle(color: Colors.red))
                        //     : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                        //MOP Contract Checkbox

                        Container(
                          height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.mopContract
                                          ? Icon(
                                              Icons.check_box,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                            )
                                          : InkWell(
                                              child: Icon(
                                                Icons.check_box_outline_blank,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.mopContract =
                                                      !model.mopContract;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      Text(
                                        "Customer Third Party MOP Contract",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                            color: Color.fromRGBO(0, 0, 0, .8)),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    model.mopContract = !model.mopContract;
                                  });
                                },
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

                        //DA/DC Contract Checkbox

                        Container(
                          height: MediaQuery.of(context).size.height * .062,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.da_dc_contract
                                          ? Icon(
                                              Icons.check_box,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                            )
                                          : InkWell(
                                              child: Icon(
                                                Icons.check_box_outline_blank,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.da_dc_contract =
                                                      !model.da_dc_contract;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      Text(
                                        "Customer Third Party DA/DC Contract",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                            color: Color.fromRGBO(0, 0, 0, .8)),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    model.da_dc_contract =
                                        !model.da_dc_contract;
                                  });
                                },
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
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),

                        //Save And Next Button

                        InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.062,
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
                              globals.tabController2.animateTo(1);
                            }),
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
