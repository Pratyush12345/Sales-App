import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/DualFuelAddProspect-viewModel/DualFuelBusiness-ViewModel.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/AppConstact/app_data.dart';

class BusinessDetailsTab extends StatefulWidget {
  Function incrementTab;
  BusinessDetailsTab({this.incrementTab});

  @override
  _BusinessDetailsTabState createState() => _BusinessDetailsTabState();
}

class _BusinessDetailsTabState extends State<BusinessDetailsTab>
    with SingleTickerProviderStateMixin {
  bool isBusinessSelected = false;
  final _formKey = GlobalKey<FormState>();
  bool isvalid = false;
  DualFuelAddProspectBusinessViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<DualFuelAddProspectBusinessViewModel>(
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
                          child: innertextfield(
                              model.businessnamecontroller,
                              false,
                              model.autovalidation,
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
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());

                            showDialog(
                                context: context,
                                builder: (context)=> Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                          child: model.businessTypeView(),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          },
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
                          child: innerMobilefield(
                              15,
                              model.landline,
                              true,
                              TextInputType.phone,
                              "Enter landline no.", (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

                            if (value.length > 15) {
                              return 'Please enter valid phone number ';
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
                          child: innertextfieldEmail(
                              model.email,
                              false,
                              isvalid,
                              TextInputType.emailAddress,
                              "Email Address", (email) {
                            if (email.isEmpty) {
                              return 'Invalid email address';
                            }

                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (email.isNotEmpty) if (!(regex.hasMatch(email)))
                              return "Invalid Email";
                          }, context),
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
                          height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.nameOnBill,
                              false,
                              model.autovalidation,
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
                          height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.supplyName,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Supply Name", (value) {
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
                          //  height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.companyRegNo,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Company Reg. No.", (value) {
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
                          child: innerMobilefield(
                              10,
                              model.mobile,
                              true,
                              TextInputType.phone,
                              "Enter 10 digit no.", (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            RegExp regExp = new RegExp(patttern);

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
                          height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.companyName,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Registered Company Name", (value) {
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
                          height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.customerRefId,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Customer Ref Id", (value) {
                            /*  if (value.isEmpty) {
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
                            isvalid = EmailValidator.validate(model.email.text);

                            if ((_formKey.currentState.validate()) &&
                                model.businessnamecontroller.text.isNotEmpty &&
                                model.businessTypeController.text.isNotEmpty &&
                                model.landline.text.isNotEmpty &&
                                model.email.text.isNotEmpty && 
                                isvalid) {
                              _formKey.currentState.save();

                              if (model.businessTypeController.text != '') {
                                setState(() {
                                  // globals.tabController =
                                  //     TabController(length: 10, vsync: this);
                                  if (globals.tabController2.length == 10) {
                                    widget.incrementTab();
                                  }
                                });
                              }
                              model.onSaveAndNext();

                              // int index = globals.tabController2.index;
                              //globals.tabController2.animateTo(index + 1);
                              globals.tabController2.animateTo(3);
                            } else { 
                              setState(() {
                                model.autovalidation = true;
                                isvalid = true;
                                AppConstant.showFailToast(
                                    context, "Please add required fields");
                              });
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
