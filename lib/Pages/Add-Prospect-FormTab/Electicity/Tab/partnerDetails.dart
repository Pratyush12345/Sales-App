import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/diabledFieldsTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_partner_viewmodel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/services.dart';

class PartnerDetailsTab extends StatefulWidget {
  @override
  _PartnerDetailsTabState createState() => _PartnerDetailsTabState();
}

class _PartnerDetailsTabState extends State<PartnerDetailsTab> {
  final _formKey = GlobalKey<FormState>();

  double eleDAYRequiredUpLift;
  double eleAffiliateLift;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<ElePartnerAddProspectViewModel>(
            // onModelReady: (model) => model.initialData(user.accountId),
            onModelReady: (model) => model.getGroupDetails(
                ProspectGetAddCredential(
                    accountID: user.accountId,
                    companyId: "1",
                    customerId: "0")),
            builder: (context, model, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: model.state == ViewState.BUSY
                    ? AppConstant.circularProgressIndicator()
                    : Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03,
                            right: MediaQuery.of(context).size.width * 0.03),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Partner Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                //     height: MediaQuery.of(context).size.height * .062,
                                child: DisableFieldTextField(
                                  initialValue:
                                      model.addPartnerModel.strBrokerName,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Additional Email for Notifications",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: dropdowntextfield(
                                      model.emailForNotification,
                                      false,
                                      model.autovalidation,
                                      TextInputType.text,
                                      "Select", (value) {
                                    if (value.isEmpty) {
                                      return 'Please select notifications';
                                    }
                                    return null;
                                  }, context),
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
                                              "Select Notifications",
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
                                            Flexible(
                                              child: Container(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: model
                                                        .addPartnerModel
                                                        .lStGetPartnerDetailForEmail
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        child: ListTile(
                                                          title: Text(
                                                            model
                                                                .addPartnerModel
                                                                .lStGetPartnerDetailForEmail[
                                                                    index]
                                                                .text,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onTap: () {
                                                            model.emailForNotification
                                                                    .text =
                                                                model
                                                                    .addPartnerModel
                                                                    .lStGetPartnerDetailForEmail[
                                                                        index]
                                                                    .text;

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Commission Type",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .02,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .062,
                                        child: Row(
                                          children: <Widget>[
                                            !model.commissionType
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
                                                        model.commissionType =
                                                            !model
                                                                .commissionType;
                                                      });
                                                    },
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .005,
                                            ),
                                            Text(
                                              "Fixed Uplift",
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
                                          model.commissionType =
                                              !model.commissionType;
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
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity Day Fixed Commission(Uplift per Unit)',
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
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                child: AppTextField(
                                  controller:
                                      model.commonelectricityDayFixedCommision,
                                  autoValidation: model.autovalidation = true,
                                  hintText: 'Day',
                                  onChanged: (text) {
                                    setState(() {
                                      eleDAYRequiredUpLift =
                                          double.tryParse(text.toString());
                                      if (double.tryParse(text) > 3) {
                                        return 'max value 3';
                                      }
                                    });
                                  },
                                  textInputType:
                                      TextInputType.numberWithOptions(
                                          decimal: true),
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value.isNotEmpty) {
                                      if (double.tryParse(value) > 3) {
                                        return 'max value 3';
                                      }
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity Night Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                // height:                                    MediaQuery.of(context).size.height * .062,
                                child: DecimalInnertextfield(
                                    model.commonelectricityNightFixedCommision,
                                    false,
                                    model.autovalidation = true,
                                    TextInputType.numberWithOptions(
                                        decimal: true),
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                    "Electricity Night Fixed Commission",
                                    (value) {
                                  String patttern =
                                      r'^([0-3]\d{0})(\.\d{0,4})?$';
                                  RegExp regExp = new RegExp(patttern);

                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 3) {
                                      return 'max value 3';
                                    }
                                  }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity EWE Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                // height:                                    MediaQuery.of(context).size.height * .062,
                                child: DecimalInnertextfield(
                                    model.commonelectricityEWEFixedCommision,
                                    false,
                                    model.autovalidation = true,
                                    TextInputType.numberWithOptions(
                                        decimal: true),
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                    "Electricity EWE Fixed Commission",
                                    (value) {
                                  String patttern =
                                      r'^([0-3]\d{0})(\.\d{0,4})?$';
                                  RegExp regExp = new RegExp(patttern);

                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 3) {
                                      return 'max value 3';
                                    }
                                  }

                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Electricity SC Fixed Commission(Uplift per Day)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                  Text(
                                    "(p/Day)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                child: AppTextField(
                                  // title: AppString.commonUpLiftElectricity,
                                  controller:
                                      model.commonelectricitySCFixedCommision,
                                  autoValidation: model.autovalidation = true,
                                  textInputType:
                                      TextInputType.numberWithOptions(
                                          decimal: true),
                                  hintText: 'SC Uplift',
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                  ],

                                  validator: (value) {
                                    String patttern =
                                        r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                    RegExp regExp = new RegExp(patttern);
                                    if (value.length != 0) {
                                      if (eleDAYRequiredUpLift != null) {
                                        if (eleDAYRequiredUpLift > 0) {
                                          if (double.tryParse(value) > 50) {
                                            return 'Max value is 50';
                                          } else {}
                                        }
                                        if (eleDAYRequiredUpLift == 0) {
                                          if (double.tryParse(value) > 100) {
                                            return 'Max value is 100';
                                          }
                                        }
                                      } else {}
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Affiliate Detail",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .015,
                                    color: Color.fromRGBO(31, 33, 29, 1)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height:MediaQuery.of(context).size.height * .062,
                                  child: dropdowntextfield(
                                      model.affiliateDetails,
                                      false,
                                      model.autovalidation,
                                      TextInputType.text,
                                      "Select", (value) {
                                    // if (value.isEmpty) {
                                    //  // return 'Please select Affiliates';
                                    // }
                                    return null;
                                  }, context),
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
                                              "Select Affiliate",
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
                                            Flexible(
                                              child: Container(
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: model
                                                        .addPartnerModel
                                                        .subUserList
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        child: ListTile(
                                                          title: Text(
                                                            model
                                                                .addPartnerModel
                                                                .subUserList[
                                                                    index]
                                                                .text,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onTap: () {
                                                            model.affiliateDetails
                                                                    .text =
                                                                model
                                                                    .addPartnerModel
                                                                    .subUserList[
                                                                        index]
                                                                    .text;

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity Day Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[],
                                    ),
                                  ),
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                child: AppTextField(
                                  controller:
                                      model.electricityDayFixedCommision,
                                  autoValidation: model.autovalidation = true,
                                  hintText: 'Day',
                                  onChanged: (text) {
                                    setState(() {
                                      eleAffiliateLift =
                                          double.tryParse(text.toString());
                                    });
                                  },
                                  textInputType:
                                      TextInputType.numberWithOptions(
                                          decimal: true),
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                  ],
                                  validator: (value) {
                                    String patttern =
                                        r'^([0-3]\d{0})(\.[0-5]\d{0,4})?$';

                                    RegExp regExp = new RegExp(patttern);
                                    if (value.isNotEmpty) {
                                      if (double.tryParse(value) > 3) {
                                        return 'max Uplift is 3';
                                      }
                                    }
                                    return null;
                                  },
                                  // validator: (value) => AppConstant.stringValidator(
                                  //     value, AppString.day),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity Night Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                //height:MediaQuery.of(context).size.height * .062,
                                child: DecimalInnertextfield(
                                    model.electricityNightFixedCommision,
                                    false,
                                    model.autovalidation = true,
                                    TextInputType.numberWithOptions(
                                        decimal: true),
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                    "Electricity Night Fixed Commission",
                                    (value) {
                                  String patttern =
                                      r'^([0-3]\d{0})(\.\d{0,4})?$';
                                  RegExp regExp = new RegExp(patttern);

                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 3) {
                                      return 'max value 3';
                                    }
                                  }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'Electricity EWE Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "(p/KWH)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                // /height:MediaQuery.of(context).size.height * .062,
                                child: DecimalInnertextfield(
                                    model.electricityEWEFixedCommision,
                                    false,
                                    model.autovalidation = true,
                                    TextInputType.numberWithOptions(
                                        decimal: true),
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                    "Electricity EWE Fixed Commission",
                                    (value) {
                                  String patttern =
                                      r'^([0-3]\d{0})(\.\d{0,4})?$';
                                  RegExp regExp = new RegExp(patttern);
                                  if (value.isNotEmpty) {
                                    // if (!regExp.hasMatch(value)) {
                                    //   return 'Electricity EWE Fixed Commission not acceptable. Try Again';
                                    // } else
                                    if (double.tryParse(value) > 3) {
                                      return 'max uplift is 3';
                                    }
                                  }

                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Electricity SC Fixed Commission(Uplift per Day)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                  Text(
                                    "(p/Day)",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .015,
                                        color: Color.fromRGBO(31, 33, 29, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                child: AppTextField(
                                  // title: AppString.commonUpLiftElectricity,
                                  controller: model.electricitySCFixedCommision,
                                  autoValidation: model.autovalidation = true,
                                  textInputType:
                                      TextInputType.numberWithOptions(
                                          decimal: true),
                                  hintText: 'SC Uplift',
                                  textInputFormatter: [
                                    WhitelistingTextInputFormatter(
                                      RegExp(r'^\d+.?\d{0,4}'),
                                    ),
                                  ],

                                  validator: (value) {
                                    String patttern =
                                        r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                    RegExp regExp = new RegExp(patttern);
                                    if (value.length != 0) {
                                      if (eleAffiliateLift != null) {
                                        if (eleAffiliateLift > 0) {
                                          if (double.tryParse(value) > 50) {
                                            return 'Max value is 50';
                                          } else {}
                                        }
                                        if (eleAffiliateLift == 0) {
                                          if (double.tryParse(value) > 100) {
                                            return 'Max value is 200';
                                          }
                                        }
                                      } else {}
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      0.062,
                                  child: Center(
                                    child: Text(
                                      "Save And Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                  if (_formKey.currentState.validate() &&
                                      model.commonelectricityDayFixedCommision
                                          .text.isNotEmpty) {
                                    if (double.tryParse(model
                                            .commonelectricityDayFixedCommision
                                            .text) <=
                                        3) {
                                      _formKey.currentState.save();
                                      model.onSaveAndNext();

                                      int index = globals.tabController1.index;
                                      globals.tabController1
                                          .animateTo(index + 1);
                                    }
                                  } else {
                                    setState(() {
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");

                                      model.autovalidation = true;
                                    });
                                  }
                                  //   if (eleDAYRequiredUpLift != null) {
                                  //     if (_formKey.currentState.validate() &&
                                  //         eleDAYRequiredUpLift <= 3) {
                                  //       _formKey.currentState.save();
                                  //       model.onSaveAndNext();
                                  //       if (_formKey != null) {
                                  //         int index =
                                  //             globals.tabController1.index;
                                  //         globals.tabController1
                                  //             .animateTo(index + 1);
                                  //         //globals.tabController1.animateTo(9);
                                  //       } else {
                                  //         setState(() {
                                  //           AppConstant.showFailToast(context,
                                  //               "Please add required fields");

                                  //           model.autovalidation = true;
                                  //         });
                                  //       }
                                  //     } else {
                                  //       setState(() {
                                  //         AppConstant.showFailToast(context,
                                  //             "Please add required fields");

                                  //         model.autovalidation = true;
                                  //       });
                                  //     }
                                  //   } else {
                                  //     setState(() {
                                  //       AppConstant.showFailToast(context,
                                  //           "Please add required fields");

                                  //       model.autovalidation = true;
                                  //     });
                                  //   }
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.028,
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
