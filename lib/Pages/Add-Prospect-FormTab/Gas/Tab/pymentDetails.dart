import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/ViewModel/GasAddProspectViewModel/GasPaymentViewModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/enums/view_state.dart';

class PaymentDetailsTab extends StatefulWidget {
  @override
  _PaymentDetailsTabState createState() => _PaymentDetailsTabState();
}

class _PaymentDetailsTabState extends State<PaymentDetailsTab> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<GasPaymentAddProspectViewModel>(
            onModelReady: (model) => model.initialData(user.accountId),

            // onModelReady: (model) => model.getGroupDetails(
            //     ProspectGetAddCredential(
            //         accountID: user.accountId,
            //         companyId: "1",
            //         customerId: "0")),
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
                                "Payment Method",
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
                                    MediaQuery.of(context).size.height * .106,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .02,
                                          ),
                                          InkWell(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .016),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .038,
                                              child: Row(
                                                children: <Widget>[
                                                  model.paymentMethodSelected ==
                                                          1
                                                      ? Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Color.fromRGBO(
                                                              155, 119, 217, 1),
                                                          size: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .023,
                                                        )
                                                      : InkWell(
                                                          child: Icon(
                                                            Icons
                                                                .radio_button_unchecked,
                                                            color:
                                                                Color.fromRGBO(
                                                                    155,
                                                                    119,
                                                                    217,
                                                                    1),
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .023,
                                                          ),
                                                          onTap: () {
                                                            setState(() {
                                                              model.paymentMethodSelected =
                                                                  1;
                                                            });
                                                          },
                                                        ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .0015,
                                                  ),
                                                  Text(
                                                    "BACS",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
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
                                                model.paymentMethodSelected = 1;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                          ),
                                          InkWell(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .038,
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .016),
                                              child: Row(
                                                children: <Widget>[
                                                  model.paymentMethodSelected ==
                                                          2
                                                      ? Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          size: MediaQuery.of(
                                                                      context)
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      155,
                                                                      119,
                                                                      217,
                                                                      1)),
                                                          onTap: () {
                                                            setState(() {
                                                              model.paymentMethodSelected =
                                                                  2;
                                                            });
                                                          },
                                                        ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .0015,
                                                  ),
                                                  Text(
                                                    "Variable Direct Debit",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
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
                                                model.paymentMethodSelected = 2;
                                              });
                                            },
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .02,
                                          ),
                                          InkWell(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .062,
                                              child: Row(
                                                children: <Widget>[
                                                  model.paymentMethodSelected ==
                                                          3
                                                      ? Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          size: MediaQuery.of(
                                                                      context)
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
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .023,
                                                            color:
                                                                Color.fromRGBO(
                                                                    155,
                                                                    119,
                                                                    217,
                                                                    1),
                                                          ),
                                                          onTap: () {
                                                            setState(() {
                                                              model.paymentMethodSelected =
                                                                  3;
                                                            });
                                                          },
                                                        ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .0015,
                                                  ),
                                                  Text(
                                                    "Card",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
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
                                                model.paymentMethodSelected = 3;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .095,
                                          ),
                                          InkWell(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .062,
                                              child: Row(
                                                children: <Widget>[
                                                  model.paymentMethodSelected ==
                                                          4
                                                      ? Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          size: MediaQuery.of(
                                                                      context)
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
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .023,
                                                            color:
                                                                Color.fromRGBO(
                                                                    155,
                                                                    119,
                                                                    217,
                                                                    1),
                                                          ),
                                                          onTap: () {
                                                            setState(() {
                                                              model.paymentMethodSelected =
                                                                  4;
                                                            });
                                                          },
                                                        ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .0015,
                                                  ),
                                                  Text(
                                                    "Fixed Direct Debit",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .02,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, .8)),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .02,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                model.paymentMethodSelected = 4;
                                              });
                                            },
                                          ),
                                        ]),
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
                              Text(
                                "Account Name",
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: innertextfield(
                                    model.accountName,
                                    false,
                                    model.autovalidation,
                                    TextInputType.text,
                                    "Account Name", (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter account name';
                                  // }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Account Number",
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: innertextfield(
                                    model.accountNumber,
                                    false,
                                    model.autovalidation,
                                    TextInputType.number,
                                    "Account Number", (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter account number';
                                  // }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Sort Code",
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: innertextfield(
                                    model.sortCode,
                                    false,
                                    model.autovalidation,
                                    TextInputType.number,
                                    "Sort Code", (value) {
                                  // if (value.isEmpty) {
                                  //   return 'Please enter sort code';
                                  // }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Text(
                                "Bank Name",
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
                                      model.banklistController,
                                      false,
                                      model.autovalidation,
                                      TextInputType.text,
                                      "Select Bank", (value) {
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
                                              "Select Bank",
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
                                                        .lSTBankList
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        child: ListTile(
                                                          title: Text(
                                                            model
                                                                .addPartnerModel
                                                                .lSTBankList[
                                                                    index]
                                                                .text,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onTap: () {
                                                            model.banklistController
                                                                    .text =
                                                                model
                                                                    .addPartnerModel
                                                                    .lSTBankList[
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
                              model.paymentMethodSelected == 3
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Card No",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .062,
                                          child: innertextfield(
                                              model.cardNo,
                                              false,
                                              model.autovalidation = true,
                                              TextInputType.number,
                                              "Card No", (value) {
                                            return null;
                                          }, context),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Text(
                                "Payment Term Days",
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
                                height:
                                    MediaQuery.of(context).size.height * .062,
                                child: innertextfield(
                                    model.termDays,
                                    false,
                                    model.autovalidation = true,
                                    TextInputType.text,
                                    "Payment Term Days", (value) {
                                  // if (value.isNotEmpty) {
                                  //   if (value.length < 100) {
                                  //   } else {
                                  //     return 'Please enter payment term days';
                                  //   }
                                  // }
                                  return null;
                                }, context),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              model.paymentMethodSelected == 4
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Fixed DD Amount",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .062,
                                          child: innertextfield(
                                              model.ddAmount,
                                              false,
                                              model.autovalidation = true,
                                              TextInputType.text,
                                              "Fixed DD Amount", (value) {
                                            return null;
                                          }, context),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                        ),
                                        Text(
                                          "Fixed DD Amount",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .015,
                                              color: Color.fromRGBO(
                                                  31, 33, 29, 1)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        InkWell(
                                          child: Container(
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width *
                                            //     .40,
                                            //  height: MediaQuery.of(context).size.height * .062,
                                            child: dropdowntextfield(
                                                model.ddDays,
                                                false,
                                                model.autovalidation,
                                                TextInputType.text,
                                                "--Select Fixed DD Days--",
                                                (value) {
                                              if (value.isEmpty) {
                                                return 'Please Select Day';
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
                                                        "--Select Fixed DD Days--",
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
                                                      Flexible(
                                                        child: Container(
                                                          child: model
                                                              .fixeDDDays(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          },
                                        ),
                                      ],
                                    )
                                  : Container(),
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
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    model.onSaveAndNextFinal();

                                    int index = globals.tabController.index;
                                    globals.tabController.animateTo(index + 1);
                                  } else {
                                    setState(() {
                                      AppConstant.showFailToast(context,
                                          "Please add required fields");
                                      model.autovalidation = true;
                                    });
                                  }
                                  // globals.tabController.animateTo(8);
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
