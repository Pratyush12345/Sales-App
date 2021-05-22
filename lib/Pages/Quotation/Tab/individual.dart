import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/quotation_invidual_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/Quotation/addAndViewList.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/date_text_field_widget.dart';
import 'package:provider/provider.dart';

class Individual extends StatefulWidget {
  final String quoteID;
  Individual({this.quoteID});

  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  bool enableFields = true;
  bool _autovalidation = false;
  ThemeApp themeApp = ThemeApp();
  bool isTermSelected = false;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: BaseView<QuotationIndividualViewModel>(
        onModelReady: (model) => model.initializeData(),
        builder: (context, model, child) {
          // if (model.state == ViewState.BUSY) {
          //   return AppConstant.circularProgressIndicator();
          // }
          return Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  AppTextField(
                    enabled: enableFields ? true : false,
                    title: AppString.businessName,
                    controller: model.businessNameController,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.businessName,
                    validator: (value) => AppConstant.stringValidator(
                        value, AppString.businessName),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                      title: AppString.postCode,
                      controller: model.postCodeController,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.text,
                      hintText: AppString.postCode,
                      validator: (value) {
                        String patttern =
                            r'^[A-Z]{1,2}[0-9][A-Z0-9]? ?[0-9][A-Z]{2}$';
                        RegExp regExp = new RegExp(patttern);

                        if (value.isEmpty) {
                          return 'Please enter PostCode';
                        }
                        if (value.isNotEmpty) if (!regExp.hasMatch(value)) {
                          return 'Please enter valid Post code';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    model.oneYear
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
                                              model.toggleOneYear();
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "1 Year",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleOneYear();
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
                                    model.twoYear
                                        ? Icon(Icons.check_box,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1))
                                        : InkWell(
                                            child: Icon(
                                                Icons.check_box_outline_blank,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .023,
                                                color: Color.fromRGBO(
                                                    155, 119, 217, 1)),
                                            onTap: () {
                                              model.toggleTwoYear();
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "2 Year",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleTwoYear();
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Row(
                                  children: <Widget>[
                                    model.threeYear
                                        ? Icon(
                                            Icons.check_box,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                          )
                                        : InkWell(
                                            child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (!isTermSelected) {
                                                  isTermSelected =
                                                      !isTermSelected;
                                                }
                                                model.toggleThreeYear();
                                              });
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "3 Year",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleThreeYear();
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
                                    model.fourYear
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
                                                if (!isTermSelected) {
                                                  isTermSelected =
                                                      !isTermSelected;
                                                }
                                                model.toggleFourYear();
                                              });
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "4 Year",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleFourYear();
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .045,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Row(
                                  children: <Widget>[
                                    model.fiveYear
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
                                                if (!isTermSelected) {
                                                  isTermSelected =
                                                      !isTermSelected;
                                                }
                                                model.toggleFiveYear();
                                              });
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "5 Year",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleFiveYear();
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .043,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Row(
                                  children: <Widget>[
                                    model.other
                                        ? Icon(
                                            Icons.check_box,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                          )
                                        : InkWell(
                                            child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                            ),
                                            onTap: () {
                                              //  model.toggleOther(context);
                                              setState(() {
                                                if (!isTermSelected) {
                                                  isTermSelected =
                                                      !isTermSelected;
                                                }
                                                model.toggleOther(context);
                                              });
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "Other",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleOther(context);
                                });
                                // model.toggleOther(context);
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .045,
                            ),
                            InkWell(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: Row(
                                  children: <Widget>[
                                    model.all
                                        ? Icon(
                                            Icons.check_box,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .023,
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                          )
                                        : InkWell(
                                            child: Icon(
                                              Icons.check_box_outline_blank,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .023,
                                              color: Color.fromRGBO(
                                                  155, 119, 217, 1),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (!isTermSelected) {
                                                  isTermSelected =
                                                      !isTermSelected;
                                                }
                                                model.toggleAll();
                                              });
                                            },
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .01,
                                    ),
                                    Text(
                                      "All",
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
                                  if (!isTermSelected) {
                                    isTermSelected = !isTermSelected;
                                  }
                                  model.toggleAll();
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .01,
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: themeApp.textfieldbordercolor, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  model.errorMsg != null && !model.checkTerms()
                      ? Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text('   ' + model.errorMsg,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text('   ',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                            ],
                          ),
                        ),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.022,
                  // ),
                  model.other
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Preferred End Date",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .015,
                                  color: Color.fromRGBO(31, 33, 29, 1)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            DateTextFieldWidget(
                              obscureText: false,
                              //  initialValue: model.otherString,

                              controller: model.otherDateController,
                              autoValidate: _autovalidation,
                              textInputType: TextInputType.text,
                              hintText: dateRFormat.format(DateTime.now()),
                              // validator: (value) =>
                              //     AppConstant.stringValidator(value, 'Select date'),

                              onTap: () {
                                model.selectDate(context, "others");
                              },
                            )
                          ],
                        )

                      ///
                      //  AppTextField(
                      //     enabled: false,
                      //     title: 'Preferred End Date',
                      //     initialValue: model.otherString,
                      //     hintText: model.otherString,

                      //     )
                      : Container(),
                  model.other
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Text(
                    "Required by Date",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  DateTextFieldWidget(
                    obscureText: false,
                    //initialValue: currentDateTime.toString(),
                    controller: model.requireByDateController,
                    autoValidate: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: dateRFormat.format(DateTime.now()),
                    // validator: (value) =>
                    //     AppConstant.stringValidator(value, 'Select date'),

                    onTap: () {
                      model.selectDate(context, "Required");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Text(
                    "Preferred by Date",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  DateTextFieldWidget(
                    controller: model.preferredDateController,
                    autoValidate: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: dateFormat.format(DateTime.now()),
                    obscureText: false,
                    onTap: () {
                      model.selectDate(context, "Preferred");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          model.customerThirdPartyMop
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    model.toggleThirdPartyMop();
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Customer Third Party MOP Contract?",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: themeApp.textfieldbordercolor, width: 2),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    onTap: () {
                      model.toggleThirdPartyMop();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          model.dcDA
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    model.toggleDcDa();
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Customer Third Party DA/DC Contract?",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: themeApp.textfieldbordercolor, width: 2),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    onTap: () {
                      model.toggleDcDa();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      width: MediaQuery.of(context).size.width * .40,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          model.starkDcDa
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    model.toggleStarkDcDa();
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Expanded(
                              child: Text(
                            "Pozitive Energy to Nominate Stark as DA/DC?",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: themeApp.textfieldbordercolor, width: 2),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    onTap: () {
                      model.toggleStarkDcDa();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          model.singleRate
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    model.toggleSingleRate();
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Single Rate?",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: themeApp.textfieldbordercolor, width: 2),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    onTap: () {
                      model.toggleSingleRate();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .38,
                          height: MediaQuery.of(context).size.height * 0.062,
                          child: Center(
                            child: Text(
                              "NOTES",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 119, 217, 1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showDialog(
                              context: context,
                              builder: (context)=> Dialog(
                                child: AddAndViewNote(),
                              ));
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .52,
                        height: MediaQuery.of(context).size.height * 0.062,
                        child: Center(
                          child: Text(
                            "SUPPLY POINT DETAIL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(155, 119, 217, 1),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ],
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
                                  MediaQuery.of(context).size.height * 0.019,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onTap: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild.unfocus();
                      }
                      if (_formKey.currentState.validate() &&
                          model.checkTerms()) {
                        model.onSaveAnNext(user.accountId.toString(),
                            widget.quoteID.toString(), context);
                      } else {
                        // !model.checkTerms()
                        //     ? model.errorMsg =
                        //         'Please select at least one term type.'

                        //     : model.errorMsg = '';

                        setState(() {
                          AppConstant.showFailToast(
                              context, "Please add required fields");
                          _autovalidation = true;
                          !model.checkTerms()
                              ? model.errorMsg =
                                  'Please select at least one term type.'
                              : model.errorMsg = '';
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
          );
        },
      ),
    );
  }
}
