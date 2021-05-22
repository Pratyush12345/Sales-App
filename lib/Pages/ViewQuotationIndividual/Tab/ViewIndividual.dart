import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model_Rq.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/Quotation/addAndViewList.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/commonWidget/diabledFieldsTextField.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';
import 'package:pozitive/Core/ViewModel/ViewRequestQuoteViewModels/ViewRequestQuoteIndividualViewmodel.dart';

class ViewIndividual extends StatefulWidget {
  String quoteID;
  String businessNameController;
  // TextEditingController businessNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController requireByDateController = TextEditingController();
  TextEditingController preferredDateController = TextEditingController();
  TextEditingController mprn = TextEditingController();
  TextEditingController aqCharge = TextEditingController();
  bool oneYear = false;
  bool twoYear = false;
  bool threeYear = false;
  bool fourYear = false;
  bool fiveYear = false;
  bool other = false;
  bool all = false;
  bool customerThirdPartyMop = false;
  bool dcDA = false;
  bool starkDcDa = false;
  bool singleRate = false;
  final String title;
  final String otherString;
  ViewIndividual({
    this.quoteID,
    this.businessNameController,
    this.postCodeController,
    this.requireByDateController,
    this.preferredDateController,
    this.mprn,
    this.aqCharge,
    this.oneYear,
    this.twoYear,
    this.threeYear,
    this.fourYear,
    this.fiveYear,
    this.other,
    this.customerThirdPartyMop,
    this.dcDA,
    this.starkDcDa,
    this.singleRate,
    this.title,
    this.otherString,
  });

  @override
  _ViewIndividualState createState() => _ViewIndividualState();
}

class _ViewIndividualState extends State<ViewIndividual> {
  ThemeApp themeApp = ThemeApp();
  final _formKey = GlobalKey<FormState>();
  bool autovalidation = false;
  bool requestedQuote = false;
  bool individualFieldsEnabled = false;
  //..RQ..//
  TextEditingController bNameRq = TextEditingController();
  TextEditingController pCodeRq = TextEditingController();
  TextEditingController rByDateRq = TextEditingController();
  TextEditingController pByDateRq = TextEditingController();
  TextEditingController pEndDateRq = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  bool customerThirdPartyMopRq;
  bool dcDARq = false;
  bool starkDcDaRq = false;
  bool singleRateRq = false;
  String otherStringRq;
  bool isTermSelected = false;
  bool oneYearRq = false;
  bool twoYearRq = false;
  bool threeYearRq = false;
  bool fourYearRq = false;
  bool fiveYearRq = false;
  bool otherRq = false;
  bool allRq = false;
  String errorMsg;

  void initState() {
    if (widget.title == 'Requested') {
      individualFieldsEnabled = true;
      bNameRq.text = widget.businessNameController;
      pCodeRq.text = widget.postCodeController.text;
      rByDateRq.text = widget.requireByDateController.text;
      pByDateRq.text = widget.preferredDateController.text;
      pEndDateRq.text = widget.otherString.toString();
      otherStringRq = widget.other.toString();
      dcDARq = widget.dcDA;
      starkDcDaRq = widget.starkDcDa;
      singleRateRq = widget.singleRate;
      customerThirdPartyMopRq = widget.customerThirdPartyMop;
      oneYearRq = widget.oneYear;
      twoYearRq = widget.twoYear;
      threeYearRq = widget.threeYear;
      fourYearRq = widget.fourYear;
      fiveYearRq = widget.fiveYear;
      allRq = widget.all;
      otherRq = widget.other;
    }

    super.initState();
  }

  void toggleThirdPartyMop() {
    setState(() {
      customerThirdPartyMopRq = !customerThirdPartyMopRq;
    });
  }

  void toggleDcDa() {
    setState(() {
      dcDARq = !dcDARq;
    });
  }

  void toggleStarkDcDa() {
    setState(() {
      starkDcDaRq = !starkDcDaRq;
    });
  }

  void toggleSingleRate() {
    setState(() {
      singleRateRq = !singleRateRq;
    });
  }

  void toggleOneYear() {
    setState(() {
      oneYearRq = !oneYearRq;
    });
  }

  void toggleTwoYear() {
    setState(() {
      twoYearRq = !twoYearRq;
    });
  }

  void toggleThreeYear() {
    setState(() {
      threeYearRq = !threeYearRq;
    });
  }

  void toggleFourYear() {
    setState(() {
      fourYearRq = !fourYearRq;
    });
  }

  void toggleFiveYear() {
    setState(() {
      fiveYearRq = !fiveYearRq;
    });
  }

  void toggleOther(BuildContext context) {
    setState(() {
      otherRq = !otherRq;
    });

    if (otherRq) {
      selectDate(context, 'others');
    }
  }

  bool checkTermsRq() {
    if (oneYearRq ||
        twoYearRq ||
        threeYearRq ||
        fourYearRq ||
        fiveYearRq ||
        otherRq ||
        allRq) {
      return true;
    } else {
      return false;
    }
  }

  Future selectDate(BuildContext context, String fromfield) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        rByDateRq.text = dateRFormat.format(picked);
      }
      if (fromfield == "Preferred") {
        pByDateRq.text = dateFormat.format(picked);
      }
      if (fromfield == 'others') {
        otherStringRq = dateFormat.format(picked);
      }
    }
  }

  void toggleAll() {
    setState(() {
      allRq = !allRq;
      if (allRq) {
        oneYearRq = true;
        twoYearRq = true;
        threeYearRq = true;
        fourYearRq = true;
        fiveYearRq = true;
      }
      if (!allRq) {
        oneYearRq = false;
        twoYearRq = false;
        threeYearRq = false;
        fourYearRq = false;
        fiveYearRq = false;
      }
    });
  }

  String get getYearRq {
    if (oneYearRq) {
      return 'One year';
    }
    if (twoYearRq) {
      return 'Two year';
    }
    if (threeYearRq) {
      return 'Three';
    }
    if (fourYearRq) {
      return 'Four';
    }
    if (fiveYearRq) {
      return 'Five';
    }
    if (otherRq) {
      return 'Others';
    }
    if (allRq) {
      return 'all';
    }
    return '';
  }

  void onSaveAnNextRq() async {
    setState(() {
      if (rByDateRq.text == '') {
        rByDateRq.text = dateRFormat.format(DateTime.now()).toString();
      }
      if (pByDateRq.text.isEmpty) {
        pByDateRq.text = dateFormat.format(DateTime.now()).toString();
      }

      Prefs.setQuotationInvidualDetailsRq(
        QuotationIndividualModelRq(
          businessNameRq: bNameRq.text,
          postCodeRq: pCodeRq.text,
          preferredByDateRq: pByDateRq.text,
          requireByDateRq: rByDateRq.text,
          termsRq: getYearRq,
          isforFirstyearRq: oneYearRq.toString(),
          isforSecondyearRq: twoYearRq.toString(),
          isforThirdyearRq: threeYearRq.toString(),
          isforFourthyearRq: fourYearRq.toString(),
          isForFifthyearRq: fiveYearRq.toString(),
          isforOtheryearRq: otherRq ? otherStringRq : 'false',
          singleRateRq: singleRateRq.toString(),
          isStarkDADCRq: starkDcDaRq.toString(),
          intDADCIdRq: dcDARq ? '1' : '0',
          thirdPartyMOPRq: customerThirdPartyMopRq.toString(),
          thirdPartyDADCRq: dcDARq.toString(),
          preferredEndDateRq: otherStringRq.toString(),
        ),
      );
      globals.tabController3.animateTo(1);
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: BaseView<ViewRequestQuoteIndividualViewModel>(
        //  onModelReady: (model) => model.getViewQuoteViewButtonDetails(
        // user.accountId, AppString.indvidual, '54550', context),

        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }

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
                  individualFieldsEnabled
                      ? AppTextField(
                          title: AppString.businessName,
                          controller: bNameRq,
                          //initialValue: widget.businessNameController,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.text,
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.businessName),
                        )
                      : DisableFieldTextField(
                          title: AppString.businessName,
                          enabled: false,
                          initialValue: widget.businessNameController,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.businessName,
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.businessName),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? AppTextField(
                          title: AppString.postCode,
                          controller: pCodeRq,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.postCode,
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.postCode),
                        )
                      : DisableFieldTextField(
                          title: AppString.postCode,
                          enabled: false,
                          initialValue: widget.postCodeController.text,
                          autoValidation: autovalidation,
                          textInputType: TextInputType.number,
                          hintText: AppString.postCode,
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.postCode),
                        ),
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
                  individualFieldsEnabled
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          oneYearRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      toggleOneYear();
                                                    });
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "1 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                        if (!isTermSelected) {
                                          isTermSelected = !isTermSelected;
                                        }
                                        toggleOneYear();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          twoYearRq
                                              ? Icon(Icons.check_box,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .023,
                                                  color: Color.fromRGBO(
                                                      155, 119, 217, 1))
                                              : InkWell(
                                                  child: Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                      color: Color.fromRGBO(
                                                          155, 119, 217, 1)),
                                                  onTap: () {
                                                    setState(() {
                                                      toggleTwoYear();
                                                    });
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "2 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                        if (!isTermSelected) {
                                          isTermSelected = !isTermSelected;
                                        }
                                        toggleTwoYear();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          threeYearRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                  onTap: () {
                                                    if (!isTermSelected) {
                                                      isTermSelected =
                                                          !isTermSelected;
                                                    }
                                                    toggleThreeYear();
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "3 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                      if (!isTermSelected) {
                                        isTermSelected = !isTermSelected;
                                      }
                                      toggleThreeYear();
                                    },
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          fourYearRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                  onTap: () {
                                                    if (!isTermSelected) {
                                                      isTermSelected =
                                                          !isTermSelected;
                                                    }
                                                    toggleFourYear();
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "4 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                      if (!isTermSelected) {
                                        isTermSelected = !isTermSelected;
                                      }
                                      toggleFourYear();
                                    },
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .045,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          fiveYearRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                  onTap: () {
                                                    if (!isTermSelected) {
                                                      isTermSelected =
                                                          !isTermSelected;
                                                    }
                                                    toggleFiveYear();
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "5 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                      if (!isTermSelected) {
                                        isTermSelected = !isTermSelected;
                                      }
                                      toggleFiveYear();
                                    },
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .043,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          otherRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                  onTap: () {
                                                    toggleOther(context);
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "Other",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                      toggleOther(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .045,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          allRq
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                  onTap: () {
                                                    toggleAll();
                                                  },
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "All",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
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
                                      if (!isTermSelected) {
                                        isTermSelected = !isTermSelected;
                                      }
                                      toggleAll();
                                    },
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: themeApp.textfieldbordercolor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(3)),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.oneYear
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "1 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.twoYear
                                              ? Icon(Icons.check_box,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .023,
                                                  color: Color.fromRGBO(
                                                      155, 119, 217, 1))
                                              : InkWell(
                                                  child: Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                      color: Color.fromRGBO(
                                                          155, 119, 217, 1)),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "2 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.threeYear
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "3 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.fourYear
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "4 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .045,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.fiveYear
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "5 Year",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .043,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.other
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "Other",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        .045,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .062,
                                      child: Row(
                                        children: <Widget>[
                                          widget.all
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
                                                    Icons
                                                        .check_box_outline_blank,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .023,
                                                    color: Color.fromRGBO(
                                                        155, 119, 217, 1),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01,
                                          ),
                                          Text(
                                            "All",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .02,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, .8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .01,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(
                                  color: themeApp.textfieldbordercolor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(3)),
                        ),
                  individualFieldsEnabled
                      ? (errorMsg != null
                          ? Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text('   ' + errorMsg,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12))
                                ],
                              ),
                            )
                          : Container())
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? (otherRq
                          ? AppTextField(
                              enabled: false,
                              title: 'Preferred End Date',
                              initialValue: otherStringRq,
                              hintText: widget.otherString)
                          : Container())
                      : Container(),
                  individualFieldsEnabled
                      ? (otherRq
                          ? SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.022,
                            )
                          : SizedBox(
                              height: 0,
                            ))
                      : Container(),
                  individualFieldsEnabled
                      ? Text(
                          "Required by Date",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        )
                      : Container(),
                  individualFieldsEnabled
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        )
                      : SizedBox(),
                  individualFieldsEnabled
                      ? DateTextFieldWidget(
                          obscureText: false,
                          title: "Required by Date",
                          //initialValue: currentDateTime.toString(),
                          controller: rByDateRq,
                          autoValidate: autovalidation,
                          textInputType: TextInputType.text,
                          hintText: dateFormat.format(DateTime.now()),
                          // validator: (value) =>
                          //     AppConstant.stringValidator(value, 'Select date'),

                          onTap: () {
                            selectDate(context, "Required");
                          },
                        )
                      : DisableFieldTextField(
                          enabled: false,
                          title: "Required by Date",
                          initialValue: widget.requireByDateController.text,
                          //autoValidate: model.autovalidation,
                          textInputType: TextInputType.text,
                          hintText: 'Select date',
                          obscureText: false,
                          validator: (value) =>
                              AppConstant.stringValidator(value, 'Select date'),
                          // onTap: () {
                          //   model.selectDate(context, "Required");
                          // },
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? Text(
                          "Preferred by Date",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .015,
                              color: Color.fromRGBO(31, 33, 29, 1)),
                        )
                      : Container(),
                  individualFieldsEnabled
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        )
                      : Container(),
                  individualFieldsEnabled
                      ? DateTextFieldWidget(
                          title: "Preferred by Date",
                          controller: pByDateRq,
                          autoValidate: autovalidation,
                          textInputType: TextInputType.text,
                          hintText: dateFormat.format(DateTime.now()),
                          obscureText: false,
                          onTap: () {
                            selectDate(context, "Preferred");
                          },
                        )
                      : DisableFieldTextField(
                          title: "Preferred by Date",
                          enabled: false,
                          initialValue: widget.preferredDateController.text,
                          textInputType: TextInputType.text,
                          hintText: 'Select date',
                          obscureText: false,
                          validator: (value) =>
                              AppConstant.stringValidator(value, 'Select date'),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                customerThirdPartyMopRq
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        onTap: () {
                                          if (individualFieldsEnabled) {
                                            setState(() {
                                              toggleThirdPartyMop();
                                            });
                                          }
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Customer Third Party MOP Contract?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          onTap: () {
                            if (individualFieldsEnabled) {
                              setState(() {
                                toggleThirdPartyMop();
                              });
                            }
                          },
                        )
                      : InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                widget.customerThirdPartyMop
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        // onTap: () {
                                        //   if (individualFieldsEnabled) {
                                        //     setState(() {
                                        //       toggleThirdPartyMop();
                                        //     });
                                        //   }
                                        // },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Customer Third Party MOP Contract?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          // onTap: () {
                          //   if (individualFieldsEnabled) {
                          //     setState(() {
                          //       toggleThirdPartyMop();
                          //     });
                          //   }
                          // },
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                dcDARq
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        onTap: () {
                                          if (individualFieldsEnabled) {
                                            setState(() {
                                              toggleDcDa();
                                            });
                                          }
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Customer Third Party DA/DC Contract?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          onTap: () {
                            if (individualFieldsEnabled) {
                              setState(() {
                                toggleDcDa();
                              });
                            }
                          },
                        )
                      : InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                widget.dcDA
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        // onTap: () {
                                        //   if (individualFieldsEnabled) {
                                        //     setState(() {
                                        //       toggleDcDa();
                                        //     });
                                        //   }
                                        // },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Customer Third Party DA/DC Contract?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          // onTap: () {
                          //   if (individualFieldsEnabled) {
                          //     setState(() {
                          //       toggleDcDa();
                          //     });
                          //   }
                          // },
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .40,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                starkDcDaRq
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        onTap: () {
                                          if (individualFieldsEnabled) {
                                            setState(() {
                                              toggleStarkDcDa();
                                            });
                                          }
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Expanded(
                                    child: Text(
                                  "Pozitive Energy to Nominate Stark as DA/DC?",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                )),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          onTap: () {
                            if (individualFieldsEnabled) {
                              setState(() {
                                toggleStarkDcDa();
                              });
                            }
                          },
                        )
                      : InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .40,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                widget.starkDcDa
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        // onTap: () {
                                        //   if (individualFieldsEnabled) {
                                        //     setState(() {
                                        //       toggleStarkDcDa();
                                        //     });
                                        //   }
                                        // },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Expanded(
                                    child: Text(
                                  "Pozitive Energy to Nominate Stark as DA/DC?",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                )),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          // onTap: () {
                          //   if (individualFieldsEnabled) {
                          //     setState(() {
                          //       toggleStarkDcDa();
                          //     });
                          //   }
                          // },
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  individualFieldsEnabled
                      ? InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                singleRateRq
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        onTap: () {
                                          if (individualFieldsEnabled) {
                                            setState(() {
                                              toggleSingleRate();
                                            });
                                          }
                                        },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Single Rate?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          onTap: () {
                            if (individualFieldsEnabled) {
                              setState(
                                () {
                                  toggleSingleRate();
                                },
                              );
                            }
                          },
                        )
                      : InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .062,
                            width: MediaQuery.of(context).size.width * .45,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                widget.singleRate
                                    ? Icon(
                                        Icons.check_box,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      )
                                    : InkWell(
                                        child: Icon(
                                          Icons.check_box_outline_blank,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                        ),
                                        // onTap: () {
                                        //   if (individualFieldsEnabled) {
                                        //     setState(() {
                                        //       toggleSingleRate();
                                        //     });
                                        //   }
                                        // },
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                Text(
                                  "Single Rate?",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      color: Color.fromRGBO(0, 0, 0, .8)),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: individualFieldsEnabled
                                    ? Colors.white
                                    : Colors.grey[300],
                                border: Border.all(
                                    color: themeApp.textfieldbordercolor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          // onTap: () {
                          //   if (individualFieldsEnabled) {
                          //     setState(
                          //       () {
                          //         toggleSingleRate();
                          //       },
                          //     );
                          //   }
                          // },
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
                      InkWell(
                        onTap: () async {
                          User _user = await Prefs.getUser();
                          model.onClickSupplyPointDetails(
                              _user.accountId, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .52,
                          height: MediaQuery.of(context).size.height * 0.062,
                          child: Center(
                            child: Text(
                              "SUPPLY POINT DETAIL",
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
                          "Go to Next",
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
                    // onTap: () {
                    //   model.getViewQuoteViewButtonDetails(
                    //       '7257', 'individual', '54550', context);
                    //   // model.onSaveAnNext(user.accountId, widget.quoteID);
                    //   //  globals.tabController3.animateTo(1);
                    // },
                    onTap: () {
                      if (individualFieldsEnabled) {
                        if (_formKey.currentState.validate() &&
                            checkTermsRq()) {
                          onSaveAnNextRq();
                        } else {
                          setState(() {
                            errorMsg = 'Please select at least one term type.';
                          });
                        }
                      } else {
                        globals.tabController3.animateTo(1);
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
