import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_ele_viewmodel.dart';

class Electicity extends StatefulWidget { 
  final Function incrementTab;
  Electicity({this.incrementTab});
  @override
  _ElecticityState createState() => _ElecticityState();
}

class _ElecticityState extends State<Electicity> {
  // List fullMPNController = [];
  List mpancodelist = ["00", "01", "02", "03", "04", "05", "06", "07", "08"];

  String mpanError;
  String contractStartDate;
  String rhtMpanError;
  String chargeStandingError;
  String chargeDayError;
  String rhtStandingChargeError;
  String rhtUnitChargeError;
  String rhtEACChargeError;

  Widget mpancodeview(EleEleAddProspectViewModel model) {
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

  Widget rhtMpancodeview(EleEleAddProspectViewModel model) {
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

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  final _formKey = GlobalKey<FormState>();
  bool _autovalidation = false;
  bool _autovalidationRHT = false;

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); 
    return user.accountId != null
        ? BaseView<EleEleAddProspectViewModel>(
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
                      children: <Widget>[
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
                                      model.elempancodecontroller,
                                      false,
                                      model.autovalidation,
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
                                  digit: 3,
                                  controller: model.elebusinessnamecontroller1,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  //textInputAction: TextInputAction.next,
                                  hintText: '123',
                                  focusNode: f1,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      // TextSelection previousSelection = model
                                      //     .elebusinessnamecontroller2.selection;
                                      // FocusScope.of(context).nextFocus();
                                      f1.unfocus();
                                      FocusScope.of(context).requestFocus(f2);
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
                                    return '';
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
                                  controller: model.elebusinessnamecontroller2,
                                  digit: 3,
                                  autoValidation: _autovalidation,
                                  hintText: '123',
                                  focusNode: f2,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      f2.unfocus();
                                      FocusScope.of(context).requestFocus(f3);
                                      //   TextSelection previousSelection = model
                                      //       .elebusinessnamecontroller3.selection;
                                      //   // FocusScope.of(context).nextFocus();
                                      //   FocusScope.of(context).requestFocus();
                                    }
                                  },
                                  textInputType: TextInputType.number,
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
                                  digit: 2,
                                  controller: model.elebusinessnamecontroller3,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '12',
                                  focusNode: f3,
                                  onChange: (text) {
                                    if (text.length == 2) {
                                      f3.unfocus();
                                      FocusScope.of(context).requestFocus(f4);
                                      // TextSelection previousSelection = model
                                      //     .elebusinessnamecontroller4.selection;
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
                                  digit: 4,
                                  controller: model.elebusinessnamecontroller4,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  focusNode: f4,
                                  onChange: (text) {
                                    if (text.length == 4) {
                                      f4.unfocus();
                                      FocusScope.of(context).requestFocus(f5);
                                      // TextSelection previousSelection = model
                                      //     .elebusinessnamecontroller5.selection;
                                      // FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: '1234',
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
                                  digit: 4,
                                  controller: model.elebusinessnamecontroller5,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  focusNode: f5,
                                  onChange: (text) {
                                    setState(() {
                                      if (text.length == 4) {
                                        f5.unfocus();
                                        FocusScope.of(context).requestFocus(f6);
                                        // FocusScope.of(context).nextFocus();
                                        // TextSelection previousSelection = model
                                        //     .elebusinessnamecontroller6
                                        //     .selection;
                                      } else {}
                                    });
                                  },
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  hintText: '1234',
                                  validator: (value) {
                                    AppConstant.stringValidator(value, '');
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
                                width: MediaQuery.of(context).size.width * .23,
                                child: AppTextFieldWithOutBorder(
                                  digit: 3,
                                  controller: model.elebusinessnamecontroller6,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: '123',
                                  focusNode: f6,
                                  onChange: (text) {
                                    if (text.length == 3) {
                                      f6.unfocus();
                                      // TextSelection previousSelection = model
                                      //     .elebusinessnamecontroller2.selection;
                                      //FocusScope.of(context).nextFocus();
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
                            //height: MediaQuery.of(context).size.height * .062,
                            child: datetextfield(
                                model.contractstartdatecontroller,
                                false,
                                model.autovalidation = true,
                                TextInputType.datetime,
                                "Select date", (value) {
                              if (model
                                  .contractstartdatecontroller.text.isEmpty) {
                                return 'Choose Date';
                              }
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
                              _autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 1),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
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
                              _autovalidation = true,
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
                                /*children: <TextSpan>[
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
                          child: DecimalInnertextfield(
                              model.nightUnitCharge,
                              false,
                              model.autovalidation = true,
                              TextInputType.numberWithOptions(decimal: true),
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              // DecimalTextInputFormatter(decimalRange: 1),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
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
                                /* children: <TextSpan>[
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
                          child: DecimalInnertextfield(
                              model.eweUnitCharge,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 2),

                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ), //  FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "EWE Unit Charge", (value) {
                            String patttern = r'^([1-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            // if (value.isEmpty) {
                            //   return "Standing charge cant be empty";
                            // }
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
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "capacity Charge", (value) {
                            String patttern = r'^([1-9]\d{0,2})(\.\d{0,4})?$';

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
                          child: DecimalInnertextfield(
                              model.excessCapacityCharge,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 2),

                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ), // FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}(\.?\d{1,5})')),
                              "Excess Capacity Charge", (value) {
                            String patttern = r'^([1-9]\d{0,2})(\.\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);

                            if (value.isNotEmpty) {
                              if (value.length > 9) {
                                return 'Excess Capacity  charge not acceptable. Try Again';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Excess Capacity  unit charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.emrCharge,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              // DecimalTextInputFormatter(decimalRange: 2),
                              //FilteringTextInputFormatter.allow(RegExp(r'3|\b\d{0,9}\.?\d{1,5}')),
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                              "EMR Charge", (value) {
                            String patttern = r'^([1-9]\d{0,2})(\.\d{0,4})?$';

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
                                model.autovalidation,
                                TextInputType.text,
                                "Select Energization Status", (value) {
                              // if (value.isEmpty) {
                              //   return "Standing charge cant be empty";
                              // }

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
                          child: DecimalInnertextfield(
                              model.dayEAC,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "Day EAC Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'Day EAC charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.nightEAC,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "night EAC Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'Night EAC charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.eweEAC,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "EWE EAC Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'EWE EAC charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.siteCapacity,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "Site capacity Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'Site capacity charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.reactiveCharge,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "Reactive Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'Reactive charge not acceptable. Try Again';
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
                          child: DecimalInnertextfield(
                              model.fitCharge,
                              false,
                              model.autovalidation,
                              TextInputType.numberWithOptions(decimal: true),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                              "Fit Charge", (value) {
                            String patttern = r'\d{0,9}(\.?\d{1,5})';
                            RegExp regExp = new RegExp(patttern);

                            if (value.length > 9) {
                              return 'Fit charge not acceptable. Try Again';
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
                                model.autovalidation,
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
                                          : Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
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
                                                model.rhtElempancodecontroller,
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
                                                        child: rhtMpancodeview(
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
                                                .rhtElebusinessnamecontroller1,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            digit: 3,
                                            onChange: (text) {
                                              if (text.length == 3) {
                                                TextSelection
                                                    previousSelection = model
                                                        .elebusinessnamecontroller2
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
                                                .rhtElebusinessnamecontroller2,
                                            autoValidation: _autovalidationRHT,
                                            hintText: '123',
                                            digit: 3,
                                            onChange: (text) {
                                              if (text.length == 3) {
                                                TextSelection
                                                    previousSelection = model
                                                        .elebusinessnamecontroller3
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
                                                .rhtElebusinessnamecontroller3,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            hintText: '12',
                                            digit: 2,
                                            onChange: (text) {
                                              if (text.length == 2) {
                                                TextSelection
                                                    previousSelection = model
                                                        .rhtElebusinessnamecontroller4
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
                                                .rhtElebusinessnamecontroller4,
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
                                                        .elebusinessnamecontroller5
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
                                                .rhtElebusinessnamecontroller5,
                                            autoValidation: _autovalidationRHT,
                                            textInputType: TextInputType.number,
                                            digit: 4,
                                            onChange: (text) {
                                              if (text.length == 4) {
                                                TextSelection
                                                    previousSelection = model
                                                        .elebusinessnamecontroller6
                                                        .selection;
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            textInputFormatter: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp("[0-9]")),
                                            ],
                                            hintText: '1234',
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
                                                .rhtElebusinessnamecontroller6,
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
                                              return null;
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
                                    child: DecimalInnertextfield(
                                        model.rhtEstandingCharge,
                                        false,
                                        _autovalidationRHT,
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                        WhitelistingTextInputFormatter(
                                          RegExp(r'^\d+\.?\d{0,2}'),
                                        ),
                                        // DecimalTextInputFormatter(
                                        //     decimalRange: 1),
                                        "Standing Charge", (value) {
                                      String patttern = r'\d{0,2}(\.?\d{1,5})';
                                      RegExp regExp = new RegExp(patttern);

                                      if (model.rhtMeter != false) {
                                        if (value.length > 9) {
                                          return 'Standing charge not acceptable. Try Again';
                                        } else if (!regExp.hasMatch(value)) {
                                          return 'Standing unit charge not acceptable. Try Again';
                                        }
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
                                    //height: MediaQuery.of(context).size.height * .062,
                                    child: DecimalInnertextfield(
                                        model.rhtEnightUnitCharge,
                                        false,
                                        _autovalidationRHT,
                                        TextInputType.number,
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'9|\b\d{0,9}(\.?\d{1,5})')),
                                        "Night Unit Charge", (value) {
                                      String patttern = r'\d{0,2}(\.?\d{1,5})';

                                      // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                                      RegExp regExp = new RegExp(patttern);

                                      if (value.length > 9) {
                                        return 'Night unit charge not acceptable. Try Again';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Night unit charge not acceptable. Try Again';
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
                                      Text(
                                        "Night EAC",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .015,
                                            color:
                                                Color.fromRGBO(31, 33, 29, 1)),
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
                                    //height: MediaQuery.of(context).size.height * .062,
                                    child: innertextfield(
                                        model.rhtEnightEAC,
                                        false,
                                        _autovalidationRHT,
                                        TextInputType.number,
                                        "night EAC Charge", (value) {
                                      String patttern = r'\d{0,3}(\.?\d{1,5})';

                                      // String patttern = r'^[0-9]{0,2}.?[0-9]{0,4}$';   // r'^((\d{2})*|([1-9]\d{0,3}))(\.\d{0,2})?$';
                                      RegExp regExp = new RegExp(patttern);

                                      if (value.length > 9) {
                                        return 'night EAC charge not acceptable. Try Again';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'night EAC unit charge not acceptable. Try Again';
                                      }
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
                          height: MediaQuery.of(context).size.height * 0.001,
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
                                if (model.elebusinessnamecontroller1.text != null &&
                                    model.elebusinessnamecontroller2.text !=
                                        null &&
                                    model.elebusinessnamecontroller3.text !=
                                        null &&
                                    model.elebusinessnamecontroller4.text !=
                                        null &&
                                    model.elebusinessnamecontroller5.text !=
                                        null &&
                                    model.elebusinessnamecontroller6.text !=
                                        null &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.contractEndDateSelected != 0 &&
                                    model.standingCharge.text.isNotEmpty &&
                                    model.dayUnitCharge.text.isNotEmpty) {
                                  _formKey.currentState.validate();

                                  _formKey.currentState.save();
                                  model.onSaveAndNext();
                                 } else {
                                  AppConstant.showFailToast(
                                      context, "Please add required fields");

                                  if (model.elebusinessnamecontroller1.text.isEmpty ||
                                      model.elebusinessnamecontroller2.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller3.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller4.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller5.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller6.text
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
                                    });
                                  }
                                  if (model.standingCharge.text.isEmpty) {
                                    setState(() {
                                      chargeStandingError =
                                          'Enter a valid Standing charge';
                                    });
                                  }
                                  if (model.dayUnitCharge.text.isEmpty) {
                                    setState(
                                      () {
                                        chargeDayError =
                                            'Enter a valid Day Unit charge';
                                      },
                                    );
                                  }
                                }
                              }

/////////////////
                              if (model.rhtMeter == true) {
                                if (model.elebusinessnamecontroller1.text != null &&
                                    model.elebusinessnamecontroller2.text !=
                                        null &&
                                    model.elebusinessnamecontroller3.text !=
                                        null &&
                                    model.elebusinessnamecontroller4.text !=
                                        null &&
                                    model.elebusinessnamecontroller5.text !=
                                        null &&
                                    model.elebusinessnamecontroller6.text !=
                                        null &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller1.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller2.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller3.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller4.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller5.text
                                        .isNotEmpty &&
                                    model.rhtElebusinessnamecontroller6.text
                                        .isNotEmpty &&
                                    model.contractstartdatecontroller.text
                                        .isNotEmpty &&
                                    model.contractEndDateSelected != 0 &&
                                    model.standingCharge.text.isNotEmpty &&
                                    model.dayUnitCharge.text.isNotEmpty &&
                                    model.rhtEstandingCharge.text.isNotEmpty) {
                                  _formKey.currentState.validate();
                                  _formKey.currentState.save();
                                  model.onSaveAndNext();
                                } else {
                                  AppConstant.showFailToast(
                                      context, "Please add required fields");

                                  if (model.elebusinessnamecontroller1.text.isEmpty ||
                                      model.elebusinessnamecontroller2.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller3.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller4.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller5.text
                                          .isEmpty ||
                                      model.elebusinessnamecontroller6.text
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
                                      chargeStandingError =
                                          'Enter a valid start Date';
                                    });
                                  }
                                  if (model.standingCharge.text.isEmpty) {
                                    setState(() {
                                      chargeStandingError =
                                          'Enter a valid Standing charge';
                                    });
                                  }
                                  if (model.dayUnitCharge.text.isEmpty) {
                                    setState(() {
                                      chargeDayError =
                                          'Enter a valid Day Unit charge';
                                    });
                                  }
//rht Validation
                                  if (model.rhtElebusinessnamecontroller1.text.isEmpty ||
                                      model.rhtElebusinessnamecontroller2.text
                                          .isEmpty ||
                                      model.rhtElebusinessnamecontroller3.text
                                          .isEmpty ||
                                      model.rhtElebusinessnamecontroller4.text
                                          .isEmpty ||
                                      model.rhtElebusinessnamecontroller5.text
                                          .isEmpty ||
                                      model.rhtElebusinessnamecontroller6.text
                                          .isEmpty) {
                                    setState(() {
                                      rhtMpanError = 'Enter a valid RHT MPAN';
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");
                                    });
                                  }
                                  if (model.rhtEstandingCharge.text.isEmpty) {
                                    setState(() {
                                      rhtStandingChargeError =
                                          'Enter a valid Standing charge';
                                    });
                                  }
                                  if (model.rhtEnightUnitCharge.text.isEmpty) {
                                    setState(() {
                                      rhtUnitChargeError =
                                          'Enter a valid Night Unit charge';
                                    });
                                  }
                                  if (model.rhtEnightEAC.text.isEmpty) {
                                    setState(() {
                                      rhtEACChargeError =
                                          'Enter a valid Night EAC Unit charge';
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
