import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/app_data.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_business_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';

class BusinessDetailsTab extends StatefulWidget {
  Function increment;
  BusinessDetailsTab({this.increment});
  @override
  _BusinessDetailsTabState createState() => _BusinessDetailsTabState();
}

class _BusinessDetailsTabState extends State<BusinessDetailsTab>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  int businessTypeInt;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBusAddProspectViewModel>(
            onModelReady: (model) => model.initialData(widget.increment),
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
                        RichText(
                          text: TextSpan(
                            text: 'Business Name',
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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.businessnamecontroller,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Business Name", (value) {
                            if (value.isEmpty) {
                              return 'Please enter business name';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Business Type',
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
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .062,
                            child: dropdowntextfield(
                                model.businessTypeController,
                                false,
                                model.autovalidation,
                                TextInputType.text,
                                "Select Business Type", (value) {
                              if (value.isEmpty) {
                                return 'Please Select Partner';
                              }
                              return null;
                            }, context),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Landline No.',
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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.landline,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.number,
                              "079-89898989", (value) {
                            String patttern =
                                r'^(?:(?:\(?(?:07|\+)([1-4]{1}\d\d|[1-9]{1}\d?)\)?)?[\-\.\ \\\/]?)?((?:[+0]9)?[0-9]{8}$)?$';
                            RegExp regExp = new RegExp(patttern);
                            if (value.length == 0) {
                              return 'Please enter phone number';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Email',
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
                          // height: MediaQuery.of(context).size.height * .062,
                          child: DisableinnertextfieldEmail(
                              model.email,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.emailAddress,
                              "Email Address",
                              (email) => EmailValidator.validate(email)
                                  ? null
                                  : "Invalid email address",
                              context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Name On Bill",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          //  height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.nameOnBill,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Name On Bill", (value) {
                            /* if (value.isEmpty) {
                              return 'Please enter Name On Bill';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Supply Name",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          // height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.supplyName,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Supply Name", (value) {
                            /*if (value.isEmpty) {
                              return 'Please enter Supply Name';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Company Reg. No.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.companyRegNo,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Company Reg. No.", (value) {
                            /* if (value.isEmpty) {
                              return 'Please enter Company Reg. No.';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Mobile No.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * .062,
                          child: DisableinnerMobilefield(
                              10,
                              model.mobile,
                              true,
                              false,
                              TextInputType.phone,
                              "Enter 10 digit no.", (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = new RegExp(patttern);
                            /*if (value.length == 0) {
                                  return 'Please enter mobile number';
                                }
                                else if (!regExp.hasMatch(value)) {
                                  return 'Please enter valid mobile number';
                                }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Registered Company Name",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.companyName,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Registered Company Name", (value) {
                            /*if (value.isEmpty) {
                              return 'Please enter Registered Company Name';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Paper Bill",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
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
                                      model.payperbill == 1
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
                                                Icons.radio_button_unchecked,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.payperbill = 1;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "Yes",
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
                                    model.payperbill = 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.payperbill == 2
                                          ? Icon(Icons.radio_button_checked,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1))
                                          : InkWell(
                                              child: Icon(
                                                  Icons.radio_button_unchecked,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .023,
                                                  color: Color.fromRGBO(
                                                      155, 119, 217, 1)),
                                              onTap: () {
                                                setState(() {
                                                  model.payperbill = 2;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "No",
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
                                    model.payperbill = 2;
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
                        Text(
                          "Micro business",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
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
                                      model.microbusiness == 1
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
                                                Icons.radio_button_unchecked,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.microbusiness = 1;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "Yes",
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
                                    model.microbusiness = 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.microbusiness == 2
                                          ? Icon(Icons.radio_button_checked,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1))
                                          : InkWell(
                                              child: Icon(
                                                  Icons.radio_button_unchecked,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .023,
                                                  color: Color.fromRGBO(
                                                      155, 119, 217, 1)),
                                              onTap: () {
                                                setState(() {
                                                  model.microbusiness = 2;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "No",
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
                                    model.microbusiness = 2;
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
                        Text(
                          "Property Ownership",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
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
                                      model.propetyOwnership == 1
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
                                                Icons.radio_button_unchecked,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1),
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  model.propetyOwnership = 1;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "Freehold",
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
                                    model.propetyOwnership = 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              InkWell(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .062,
                                  child: Row(
                                    children: <Widget>[
                                      model.propetyOwnership == 2
                                          ? Icon(Icons.radio_button_checked,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1))
                                          : InkWell(
                                              child: Icon(
                                                  Icons.radio_button_unchecked,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .023,
                                                  color: Color.fromRGBO(
                                                      155, 119, 217, 1)),
                                              onTap: () {
                                                setState(() {
                                                  model.propetyOwnership = 2;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .0035,
                                      ),
                                      Text(
                                        "Lease",
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
                                    model.propetyOwnership = 2;
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
                        Text(
                          "Customer Ref Id",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          //height: MediaQuery.of(context).size.height * .062,
                          child: Disableinnertextfield(
                              model.customerRefId,
                              false,
                              model.autovalidation,
                              false,
                              TextInputType.text,
                              "Customer Ref Id", (value) {
                            /* if (value.isEmpty) {
                              return 'Please enter Customer Ref Id';
                            }*/
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
                            // if (model.businessTypeController.text != '') {
                            //   setState(() {
                            //     globals.tabController1 =
                            //         TabController(length: 10, vsync: this);
                            //     widget.increment();
                            //   });
                            // }
                            if (model.businessTypeController.text != '') {
                              setState(
                                () {
                                  globals.tabController1 =
                                      TabController(length: 10, vsync: this);
                                  if (globals.tabController1.length == 9) {
                                    widget.increment();
                                  }
                                },
                              );
                            }
                            globals.tabController1.animateTo(2);
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
