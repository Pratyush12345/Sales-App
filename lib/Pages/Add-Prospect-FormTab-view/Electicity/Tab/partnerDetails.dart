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

class PartnerDetailsTab extends StatefulWidget {
  @override
  _PartnerDetailsTabState createState() => _PartnerDetailsTabState();
}

class _PartnerDetailsTabState extends State<PartnerDetailsTab> {
  final _formKey = GlobalKey<FormState>();

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
                                // child: innertextfield(
                                //     model.partnerName,
                                //     false,
                                //     model.autovalidation,
                                //     TextInputType.text,
                                //     "Partner Name", (value) {
                                //   if (value.isEmpty) {
                                //     return 'Please enter partner name';
                                //   }
                                //   return null;
                                // }, context),
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
                                    return null;
                                  }, context),
                                ),
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
                                child: DisableAppTextField(
                                  controller:
                                      model.commonelectricityDayFixedCommision,
                                  autoValidation: model.autovalidation,
                                  enabled: true,
                                  hintText: "Electricity Day Fixed Commission",
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    /*if(int.parse(value) > 3){
                                  return 'Invalid';
                                }*/

                                    return null;
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
                              DisableAppTextField(
                                controller:
                                    model.commonelectricityNightFixedCommision,
                                // autoValidation: true,
                                textInputType: TextInputType.number,
                                enabled: false,
                                hintText: "Electricity Night Fixed Commission",
                                validator: (value) {
                                  return null;
                                },
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Disableinnertextfield(
                                    model.commonelectricityEWEFixedCommision,
                                    false,
                                    model.autovalidation,
                                    false,
                                    TextInputType.number,
                                    "Electricity EWE Fixed Commission",
                                    (value) {
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Disableinnertextfield(
                                    model.electricitySCFixedCommision,
                                    false,
                                    model.autovalidation,
                                    false,
                                    TextInputType.number,
                                    "SC Fixed Commission", (value) {
                                  return null;
                                }, context),
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
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: dropdowntextfield(
                                      model.emailForNotification,
                                      false,
                                      model.autovalidation,
                                      TextInputType.text,
                                      "Select", (value) {
                                    if (value.isEmpty) {
                                      return 'Please select Affiliates';
                                    }
                                    return null;
                                  }, context),
                                ),
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
                                child: DisableAppTextField(
                                  controller:
                                      model.electricityDayFixedCommision,
                                  autoValidation: model.autovalidation,
                                  enabled: true,
                                  hintText: "Electricity Day Fixed Commission",
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    /*if(int.parse(value) > 3){
                                  return 'Invalid';
                                }*/

                                    return null;
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
                              DisableAppTextField(
                                controller:
                                    model.electricityNightFixedCommision,
                                // autoValidation: true,
                                textInputType: TextInputType.number,
                                enabled: false,
                                hintText: "Electricity Night Fixed Commission",
                                validator: (value) {
                                  return null;
                                },
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Disableinnertextfield(
                                    model.electricityEWEFixedCommision,
                                    false,
                                    model.autovalidation,
                                    false,
                                    TextInputType.number,
                                    "Electricity EWE Fixed Commission",
                                    (value) {
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Disableinnertextfield(
                                    model.electricitySCFixedCommision,
                                    false,
                                    model.autovalidation,
                                    false,
                                    TextInputType.number,
                                    "SC Fixed Commission", (value) {
                                  return null;
                                }, context),
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
                                      "Go to Next",
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
                                  int index = globals.tabController1.index;
                                  globals.tabController1.animateTo(index + 1);
                                },
                              ),

                              // InkWell(
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     height: MediaQuery.of(context).size.height *
                              //         0.062,
                              //     child: Center(
                              //       child: Text(
                              //         "Save And Next",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: MediaQuery.of(context)
                              //                     .size
                              //                     .height *
                              //                 0.017,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ),
                              //     decoration: BoxDecoration(
                              //         color: ThemeApp().purplecolor,
                              //         borderRadius: BorderRadius.circular(30)),
                              //   ),
                              //   onTap: () {
                              //     if (model.electricityDayFixedCommision.text
                              //         .isNotEmpty) {
                              //       _formKey.currentState.save();
                              //       model.onSaveAndNext();
                              //       if (_formKey != null) {
                              //         int index = globals.tabController1.index;
                              //         globals.tabController1
                              //             .animateTo(index + 1);
                              //         //globals.tabController1.animateTo(9);
                              //       }
                              //     } else {
                              //       setState(() {
                              //         AppConstant.showFailToast(context,
                              //             "Please add required fields");

                              //         model.autovalidation = true;
                              //       });
                              //     }
                              //   },
                              // ),
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
