import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/InsertAddProspect-viewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';

class ElecticityData extends StatefulWidget { 
  final Function incrementTab;
  ElecticityData({this.incrementTab}); 
  @override
  _ElecticityDataState createState() => _ElecticityDataState();
}

class _ElecticityDataState extends State<ElecticityData> {
  bool _autovalidation = false;
  bool _autovalidationRHT = false;
  bool _autovalidationCharge = false;
  final focus = FocusNode();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  ThemeApp themeApp = ThemeApp();
  String mpanError;
  String contractStartDate;
  String rhtMpanError;
  String chargeStandingError;
  String chargeDayError;
  String rhtStandingChargeError;
  String rhtUnitChargeError;
  String rhtEACChargeError;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  List fullMPNController = [];
  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  Widget mpancodeview(DualFuelAddProspectViewModel model) {
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
                model.onChangeMPanCode(mpancodelist[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  Widget rhtDFMpancodeview(DualFuelAddProspectViewModel model) {
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
                model.onChangeRHTMPanCode(mpancodelist[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

//  User user = await Prefs.getUser();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null 
        ? BaseView<DualFuelAddProspectViewModel>(
            onModelReady: (model) => model.initialData(widget.incrementTab),
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
                                  child: withoutboderdropdowntextfield(
                                      model.mpancodecontroller,
                                      false,
                                      _autovalidation,
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
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showDialog(
                                      context: context,
                                      builder: (context)=> Dialog(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                            Text(
                                              "Select Profile Class",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 1,
                                              color:
                                                  Colors.grey.withOpacity(.2),
                                            ),
                                            Container(
                                              child: mpancodeview(model),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller1,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '123',
                                  digit: 3,
                                  focusNode: f1,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      f1.unfocus();
                                      FocusScope.of(context).requestFocus(f2);

                                      // TextSelection previousSelection = model
                                      //     .businessnamecontroller2.selection;
                                      // FocusScope.of(context).nextFocus();
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
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller2,
                                  autoValidation: model.autovalidation = true,
                                  textInputType: TextInputType.number,
                                  digit: 3,
                                  focusNode: f2,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      f2.unfocus();
                                      FocusScope.of(context).requestFocus(f3);
                                      // TextSelection previousSelection = model
                                      //     .businessnamecontroller3.selection;
                                      // FocusScope.of(context).nextFocus();
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
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller3,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '12',
                                  digit: 2,
                                  focusNode: f3,
                                  onChange: (text) {
                                    if (text.length == 2) {
                                      f3.unfocus();
                                      FocusScope.of(context).requestFocus(f4);

                                      // TextSelection previousSelection = model
                                      //     .businessnamecontroller4.selection;
                                      // FocusScope.of(context).nextFocus();
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
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller4,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '1234',
                                  digit: 4,
                                  focusNode: f4,
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      f4.unfocus();
                                      FocusScope.of(context).requestFocus(f5);

                                      // TextSelection previousSelection = model
                                      //     .businessnamecontroller5.selection;
                                      // FocusScope.of(context).nextFocus();
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
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller5,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: '1234',
                                  focusNode: f5,
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      f5.unfocus();
                                      FocusScope.of(context).requestFocus(f6);

                                      // TextSelection previousSelection = model
                                      //     .businessnamecontroller6.selection;
                                      // FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  digit: 4,
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
                                child: AppTextFieldWithOutBorder(
                                  controller: model.businessnamecontroller6,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '123',
                                  digit: 3,
                                  focusNode: f6,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      f6.unfocus();
                                      // FocusScope.of(context).requestFocus(f2);

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
                        mpanError != null
                            ? Text(
                                mpanError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
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
                            child: datetextfield(
                                model.contractstartdatecontroller,
                                false,
                                _autovalidation,
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
                          onTap: () {
                            model.selectDate(context, "Required");
                          },
                        ),
                        contractStartDate != null
                            ? Text(
                                contractStartDate,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
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
                                          model.endContractselectDate(
                                            context,
                                          );
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

                                    // model.contractEndDateSelected == 4
                                    //     ? datetextfieldWithoutBorder(
                                    //         model.contractEndDate,
                                    //         false,
                                    //         model.autovalidation = true,
                                    //         TextInputType.text,
                                    //         "Select date", (value) {
                                    //         if (model
                                    //             .contractEndDate.text.isEmpty) {
                                    //           return 'Choose Date';
                                    //         }
                                    //         return model.contractEndDate =
                                    //             value;
                                    //       }, context)
                                    //     : Container(),
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
                          child: DecimalInnertextfield(
                              model.standingCharge,
                              false,
                              _autovalidationCharge,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Standing Charge", (value) {
                            String patttern = r'^([0-9]\d{0,9})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Standing charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Standing charge not acceptable. Try Again';
                              }
                            }

                            return null;
                          }, context),
                        ),
                        chargeStandingError != null
                            ? Text(
                                chargeStandingError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.dayUnitCharge,
                              false,
                              _autovalidationCharge = true,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^([0-9]\d{0,2}).?([0-9]{0,4})$')),
                              "Day Unit Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Day Unit not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Day Unit not acceptable. Try Again';
                              }
                            }
                            return null;
                          }, context),
                        ),
                        chargeDayError != null
                            ? Text(
                                chargeDayError,
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          //height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.nightUnitCharge,
                              false,
                              _autovalidation,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^([0-9]\d{0,2}).?([0-9]{0,4})$')),
                              "Night Unit Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.eweUnitCharge,
                              false,
                              _autovalidation = true,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),

                              //  FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "EWE Unit Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

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
                          child: DecimalInnertextfield(
                              model.capacityCharge,
                              false,
                              _autovalidation = true,
                              TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Capacity Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Capacity charge not acceptable. Try Again';
                              }
                              // else if (!regExp.hasMatch(value)) {
                              //   return 'capacity unit charge not acceptable. Try Again';
                              // }
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
                          //height: MediaQuery.of(context).size.height * .062,
                          child: DecimalInnertextfield(
                              model.excessCapacityCharge,
                              false,
                              _autovalidation = true,
                              TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "Excess Capacity Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Excess charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.emrCharge,
                              false,
                              _autovalidation = true,
                              TextInputType.numberWithOptions(decimal: true),
                              DecimalTextInputFormatter(decimalRange: 2),
                              "EMR Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'EMR charge not acceptable. Try Again';
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
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      Text(
                                        "Select Energization Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 1,
                                        color: Colors.grey.withOpacity(.2),
                                      ),
                                      Container(
                                        child: model.EnergizationView(),
                                      )
                                    ],
                                  ),
                                ));
                          },
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
                          child: innertextfield(
                              model.dayEAC,
                              false,
                              _autovalidation = true,
                              TextInputType.number,
                              "Day EAC Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Day EAC charge not acceptable. Try Again';
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
                          child: innertextfield(
                              model.nightEAC,
                              false,
                              _autovalidation = true,
                              TextInputType.number,
                              "Night EAC Charge", (value) {
                            String patttern = r'^([0-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Night EAC charge not acceptable. Try Again';
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
                          child: innertextfield(
                              model.eweEAC,
                              false,
                              _autovalidation,
                              TextInputType.number,
                              "EWE EAC Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'EWE EAC charge not acceptable. Try Again';
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
                          child: innertextfield(
                              model.siteCapacity,
                              false,
                              _autovalidation = true,
                              TextInputType.number,
                              "Site Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'site charge not acceptable. Try Again';
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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.reactiveCharge,
                              false,
                              _autovalidation,
                              TextInputType.number,
                              "Reactive Charge", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Reactive charge not acceptable. Try Again';
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
                          child: innertextfield(
                              model.fitCharge,
                              false,
                              _autovalidation,
                              TextInputType.number,
                              "FIT Charges", (value) {
                            String patttern = r'^([1-9]\d{0,3})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'FIT charge not acceptable. Try Again';
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
                              return null;
                            }, context),
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
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      Text(
                                        "Select New Connection",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 1,
                                        color: Colors.grey.withOpacity(.2),
                                      ),
                                      Container(
                                        child: model.NotificationView(),
                                      )
                                    ],
                                  ),
                                ));
                          },
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
                                            child: withoutboderdropdowntextfield(
                                                model.rhtDFMpancodecontroller,
                                                false,
                                                _autovalidationRHT,
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
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            showDialog(
                                                context: context,
                                                builder: (context)=> Dialog(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "Select Profile Class",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 1,
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                      ),
                                                      Container(
                                                        child:
                                                            rhtDFMpancodeview(
                                                                model),
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          },
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller1,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            digit: 3,
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
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller2,
                                            autoValidation: _autovalidationRHT,
                                            hintText: '123',
                                            digit: 3,
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
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller3,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            hintText: '12',
                                            digit: 2,
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
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller4,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            hintText: '1234',
                                            digit: 4,
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
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller5,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            hintText: '1234',
                                            digit: 4,
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
                                          child: AppTextFieldWithOutBorder(
                                            controller: model
                                                .rhtDFBusinessnamecontroller6,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            hintText: '123',
                                            digit: 3,
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
                                  rhtMpanError != null
                                      ? Text(
                                          rhtMpanError,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container(),
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
                                    child: DecimalInnertextfield(
                                        model.rhtDFstandingCharge,
                                        false,
                                        _autovalidationRHT = true,
                                        TextInputType.number,
                                        DecimalTextInputFormatter(
                                            decimalRange: 2),
                                        "Standing Charge", (value) {
                                      String patttern =
                                          r'^([1-9]\d{0,2})(\.\d{0,4})?$';

                                      if (value.length > 9) {
                                        return 'Standing charge not acceptable. Try Again';
                                      }

                                      return null;
                                    }, context),
                                  ),
                                  rhtStandingChargeError != null
                                      ? Text(
                                          rhtStandingChargeError,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container(),

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
                                    child: DecimalInnertextfield(
                                        model.rhtDFnightUnitCharge,
                                        false,
                                        _autovalidationRHT = false,
                                        TextInputType.number,
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                                        "Night Unit Charge", (value) {
                                      String patttern = r'\d{0,9}(\.?\d{1,5})';
                                      RegExp regExp = new RegExp(patttern);
                                      RegExp _numeric = RegExp(r'^-?[0-9]+$');

                                      if (value.length > 9) {
                                        return 'Night unit charge not acceptable. Try Again';
                                      }
                                      if (value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    }, context),
                                  ),
                                  rhtUnitChargeError != null
                                      ? Text(
                                          rhtUnitChargeError,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container(),
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
                                    child: DecimalInnertextfield(
                                        model.rhtDFnightEAC,
                                        false,
                                        _autovalidationRHT,
                                        TextInputType.number,
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                                        "night EAC Charge", (value) {
                                      String patttern = r'\d{0,9}(\.?\d{1,5})';
                                      RegExp regExp = new RegExp(patttern);

                                      if (value.length > 9) {
                                        return 'Night EAC charge not acceptable. Try Again';
                                      }
                                      //  else if (!regExp.hasMatch(value)) {
                                      //   return 'Night EAC charge not acceptable.... Try Again';
                                      // }
                                      return null;
                                    }, context),
                                  ),
                                  rhtEACChargeError != null
                                      ? Text(
                                          rhtEACChargeError,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Container(),
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
                                  color: ThemeApp().purplecolor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                currentFocus.focusedChild.unfocus();
                              }
                              if (model.rhtMeter == false) {
                                if (model.businessnamecontroller1.text != null &&
                                    model.businessnamecontroller2.text !=
                                        null &&
                                    model.businessnamecontroller3.text !=
                                        null &&
                                    model.businessnamecontroller4.text !=
                                        null &&
                                    model.businessnamecontroller5.text !=
                                        null &&
                                    model.businessnamecontroller6.text !=
                                        null &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.contractEndDateSelected != 0 &&
                                    model.standingCharge.text.isNotEmpty &&
                                    model.dayUnitCharge.text.isNotEmpty) {
                                  _formKey.currentState.validate();

                                  _formKey.currentState.save();
                                  model.onSaveAndNext(context);
                                } else {
                                  AppConstant.showFailToast(
                                      context, "Please add required fields");

                                  if (model.businessnamecontroller1.text.isEmpty ||
                                      model.businessnamecontroller2.text
                                          .isEmpty ||
                                      model.businessnamecontroller3.text
                                          .isEmpty ||
                                      model.businessnamecontroller4.text
                                          .isEmpty ||
                                      model.businessnamecontroller5.text
                                          .isEmpty ||
                                      model.businessnamecontroller6.text
                                          .isEmpty) {
                                    setState(() {
                                      mpanError = 'Enter a valid MPAN';
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");

                                      _autovalidation = true;
                                    });
                                  }
                                  if (model.contractstartdatecontroller.text
                                      .isEmpty) {
                                    setState(() {
                                      contractStartDate =
                                          'Enter a valid start Date';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
                                  if (model.standingCharge.text.isEmpty) {
                                    setState(() {
                                      chargeStandingError =
                                          'Enter a valid Standing charge';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
                                  if (model.dayUnitCharge.text.isEmpty) {
                                    setState(() {
                                      chargeDayError =
                                          'Enter a valid Day Unit charge';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
                                }
                              }

/////////////////
                              if (model.rhtMeter == true) {
                                if (model.businessnamecontroller1.text != null &&
                                    model.businessnamecontroller2.text !=
                                        null &&
                                    model.businessnamecontroller3.text !=
                                        null &&
                                    model.businessnamecontroller4.text !=
                                        null &&
                                    model.businessnamecontroller5.text !=
                                        null &&
                                    model.businessnamecontroller6.text !=
                                        null &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller1.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller2.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller3.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller4.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller5.text
                                        .isNotEmpty &&
                                    model.rhtDFBusinessnamecontroller6.text
                                        .isNotEmpty &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.contractEndDateSelected != 0 &&
                                    model.standingCharge.text.isNotEmpty &&
                                    model.dayUnitCharge.text.isNotEmpty &&
                                    model.rhtDFstandingCharge.text.isNotEmpty) {
                                  _formKey.currentState.validate();
                                  _formKey.currentState.save();
                                  model.onSaveAndNext(context);
                                } else {
                                  AppConstant.showFailToast(
                                      context, "Please add required fields");

                                  if (model.businessnamecontroller1.text.isEmpty ||
                                      model.businessnamecontroller2.text
                                          .isEmpty ||
                                      model.businessnamecontroller3.text
                                          .isEmpty ||
                                      model.businessnamecontroller4.text
                                          .isEmpty ||
                                      model.businessnamecontroller5.text
                                          .isEmpty ||
                                      model.businessnamecontroller6.text
                                          .isEmpty) {
                                    setState(() {
                                      mpanError = 'Enter a valid MPAN';
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");

                                      _autovalidation = true;
                                      //_autovalidationCharge = true;
                                      //_autovalidationRHT = true;
                                    });
                                  }
                                  if (model.contractstartdatecontroller.text
                                      .isEmpty) {
                                    setState(() {
                                      chargeStandingError =
                                          'Enter a valid start Date';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
                                  if (model.standingCharge.text.isEmpty) {
                                    setState(() {
                                      chargeStandingError =
                                          'Enter a valid Standing charge';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
                                  if (model.dayUnitCharge.text.isEmpty) {
                                    setState(() {
                                      chargeDayError =
                                          'Enter a valid Day Unit charge';

                                      //_autovalidation = true;
                                      _autovalidationCharge = true;
                                    });
                                  }
//rht Validation
                                  if (model.rhtDFBusinessnamecontroller1.text.isEmpty ||
                                      model.rhtDFBusinessnamecontroller2.text
                                          .isEmpty ||
                                      model.rhtDFBusinessnamecontroller3.text
                                          .isEmpty ||
                                      model.rhtDFBusinessnamecontroller4.text
                                          .isEmpty ||
                                      model.rhtDFBusinessnamecontroller5.text
                                          .isEmpty ||
                                      model.rhtDFBusinessnamecontroller6.text
                                          .isEmpty) {
                                    setState(() {
                                      rhtMpanError = 'Enter a valid RHT MPAN';
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");

                                      _autovalidationRHT = true;
                                    });
                                  }
                                  if (model.rhtDFstandingCharge.text.isEmpty) {
                                    setState(() {
                                      rhtStandingChargeError =
                                          'Enter a valid Standing charge';

                                      _autovalidationRHT = true;
                                    });
                                  }
                                  if (model.rhtDFnightUnitCharge.text.isEmpty) {
                                    setState(() {
                                      rhtUnitChargeError =
                                          'Enter a valid Night Unit charge';

                                      _autovalidationRHT = true;
                                    });
                                  }
                                  if (model.rhtDFnightEAC.text.isEmpty) {
                                    setState(() {
                                      rhtEACChargeError =
                                          'Enter a valid Night EAC Unit charge';

                                      _autovalidationRHT = true;
                                    });
                                  }
                                }
                              }
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
