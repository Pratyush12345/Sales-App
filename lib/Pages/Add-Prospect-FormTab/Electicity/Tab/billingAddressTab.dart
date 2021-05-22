import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/EleAddProspectViewModels/ele_billAddress_viewmodel.dart';

class BillingAddressTab extends StatefulWidget {
  @override
  _BillingAddressTabState createState() => _BillingAddressTabState();
}

class _BillingAddressTabState extends State<BillingAddressTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<EleBillAddressAddProspectViewModel>(
            onModelReady: (model) => model.initialData(),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
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
                                      model.sameAddress
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
                                                model.onToggleSameAddress();
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      Text(
                                        "Same As Site Address",
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
                                  model.onToggleSameAddress();
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
                        RichText(
                          text: TextSpan(
                            text: 'Address 1',
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
//              height: MediaQuery.of(context).size.height*.062,
                          child: innerLongtextfield(
                              5,
                              model.address1Controller,
                              model.autovalidation,
                              TextInputType.text,
                              "Billing Address 1", (value) {
                            if (value.isEmpty) {
                              return 'Please enter Site Address 1';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'City',
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
                          //  height: MediaQuery.of(context).size.height * .062,
                          child: innertextfield(
                              model.cityController,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Billing City", (value) {
                            if (value.isEmpty) {
                              return 'Please enter City';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Address 2",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
                          child: innerLongtextfield(
                              5,
                              model.address2Controller,
                              model.autovalidation,
                              TextInputType.text,
                              "Billing Address 2", (value) {
                            /* if (value.isEmpty) {
                              return 'Please enter Site Address 2';
                            }*/
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'PostCode',
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
                              model.postcode,
                              false,
                              model.autovalidation,
                              TextInputType.text,
                              "Billing Post Code", (value) {
                            String patttern =
                                r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$';
                            RegExp regExp = new RegExp(patttern);

                            if (value.isEmpty) {
                              return 'Please enter PostCode';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Please enter valid Post code';
                            }
                            return null;
                          }, context),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        ),
                        Text(
                          "Billing Term Type",
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
                                      model.billingtermType == 1
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
                                                  model.billingtermType = 1;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .002,
                                      ),
                                      Text(
                                        "Monthly",
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
                                    model.billingtermType = 1;
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
                                      model.billingtermType == 2
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
                                                  model.billingtermType = 2;
                                                });
                                              },
                                            ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .002,
                                      ),
                                      Text(
                                        "Quarterly",
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
                                    model.billingtermType = 2;
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
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              model.onSaveAndNext();
                              model.onSaveAndNext();
                              globals.tabController1.animateTo(4);
                            } else {
                              setState(() {
                                AppConstant.showFailToast(
                                    context, "Please add required fields");

                                model.autovalidation = true;
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
