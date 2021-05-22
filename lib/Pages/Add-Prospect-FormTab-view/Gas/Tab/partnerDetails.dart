import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/diabledFieldsTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasPartnerViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';
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
        ? BaseView<GasPartnerAddProspectViewModel>(
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
                                    MediaQuery.of(context).size.height * 0.00,
                              ),
                              SizedBox(
                                // height: MediaQuery.of(context).size.height * .062,
                                child: DisableFieldTextField(
                                  initialValue:
                                      model.addPartnerModel.strBrokerName,
                                ),
                              ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height * .062,
                              //   child: innertextfield(
                              //       model.partnerName,
                              //       false,
                              //       model.autovalidation,
                              //       TextInputType.text,
                              //       "Partnergjh Name", (value) {
                              //     if (value.isEmpty) {
                              //       return 'Please enter partner name';
                              //     }
                              //     return null;
                              //   }, context),
                              // ),
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
                                      TextInputType.emailAddress,
                                      "Select", (value) {
                                    if (value.isEmpty) {
                                      return 'Please select notifications';
                                    }
                                    return null;
                                  }, context),
                                ),
                                // onTap: () {
                                //   FocusScope.of(context)
                                //       .requestFocus(FocusNode());
                                //   showDialog(
                                //       context: context,
                                //       child: Dialog(
                                //         child: Column(
                                //           mainAxisSize: MainAxisSize.min,
                                //           children: <Widget>[
                                //             SizedBox(
                                //               height: MediaQuery.of(context)
                                //                       .size
                                //                       .height *
                                //                   0.03,
                                //             ),
                                //             Text(
                                //               "Select Notifications",
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.bold,
                                //                   fontSize:
                                //                       MediaQuery.of(context)
                                //                               .size
                                //                               .height *
                                //                           0.03),
                                //             ),
                                //             SizedBox(
                                //               height: MediaQuery.of(context)
                                //                       .size
                                //                       .height *
                                //                   0.02,
                                //             ),
                                //             Container(
                                //               width: MediaQuery.of(context)
                                //                   .size
                                //                   .width,
                                //               height: 1,
                                //               color:
                                //                   Colors.grey.withOpacity(.2),
                                //             ),
                                //             Flexible(
                                //               child: Container(
                                //                 child: ListView.builder(
                                //                     shrinkWrap: true,
                                //                     itemCount: model
                                //                         .addPartnerModel
                                //                         .lStGetPartnerDetailForEmail
                                //                         .length,
                                //                     itemBuilder:
                                //                         (BuildContext context,
                                //                             int index) {
                                //                       return Container(
                                //                         child: ListTile(
                                //                           title: Text(
                                //                             model
                                //                                 .addPartnerModel
                                //                                 .lStGetPartnerDetailForEmail[
                                //                                     index]
                                //                                 .text,
                                //                             style: TextStyle(
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .bold),
                                //                           ),
                                //                           // onTap: () {
                                //                           //   model.emailForNotification
                                //                           //           .text =
                                //                           //       model
                                //                           //           .addPartnerModel
                                //                           //           .lStGetPartnerDetailForEmail[
                                //                           //               index]
                                //                           //           .text;

                                //                           //   Navigator.pop(
                                //                           //       context);
                                //                           // },
                                //                         ),
                                //                       );
                                //                     }),
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //       ));
                                // },
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
                                        /*
                                  setState(() {
                                    model.commissionType =
                                        !model.commissionType;
                                  });*/
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
                                          'Gas Fixed Commission(Uplift per Unit)',
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

                              DisableAppTextField(
                                controller: model.commongasFixedCommision,
                                textInputType: TextInputType.number,
                                enabled: false,
                                validator: (value) {
                                  // if(int.parse(value) > 3){
                                  //   return 'Invalid';
                                  // }
                                  if (value.isEmpty) {
                                    return 'Gas Fixed Commission not acceptable. Cant be blank';
                                  }
                                  if (double.tryParse(value) > 1.50) {
                                    return 'Gas Fixed Commission not acceptable. Try Again';
                                  }
                                  return null;
                                },
                              ),

                              //  ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Gas SC Fixed Commission(Uplift per Day)",
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
                                    MediaQuery.of(context).size.height * 0.001,
                              ),

                              DisableAppTextField(
                                controller: model.commongasSCFixedCommision,
                                autoValidation: model.autovalidation,
                                textInputType: TextInputType.number,
                                // autoValidation: true,

                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 1.50) {
                                      return 'Gas Fixed Commission not acceptable. Try Again';
                                    }
                                  } else {
                                    return null;
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),

//affiliate
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
                                          'Gas Fixed Commission(Uplift per Unit)',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                          color: Color.fromRGBO(31, 33, 29, 1)),
                                      children: <TextSpan>[
                                        // TextSpan(
                                        //     text: ' \*',
                                        //     style:
                                        //         TextStyle(color: Colors.red)),
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

                              DisableAppTextField(
                                controller: model.gasFixedCommision,
                                textInputType: TextInputType.number,
                                enabled: false,
                                validator: (value) {
                                  // if(int.parse(value) > 3){
                                  //   return 'Invalid';
                                  // }
                                  if (value.isEmpty) {
                                    return 'Gas Fixed Commission not acceptable. Cant be blank';
                                  }
                                  if (double.tryParse(value) > 1.50) {
                                    return 'Gas Fixed Commission not acceptable. Try Again';
                                  }
                                  return null;
                                },
                              ),

                              //  ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Gas SC Fixed Commission(Uplift per Day)",
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
                                    MediaQuery.of(context).size.height * 0.001,
                              ),

                              DisableAppTextField(
                                controller: model.gasSCFixedCommision,
                                autoValidation: model.autovalidation,
                                textInputType: TextInputType.number,
                                // autoValidation: true,

                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 1.50) {
                                      return 'Gas Fixed Commission not acceptable. Try Again';
                                    }
                                  } else {
                                    return null;
                                  }

                                  return null;
                                },
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
                                  int index = globals.tabController.index;
                                  globals.tabController.animateTo(index + 1);
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
