import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/gas_price_one_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';

class GasPricePerYear extends StatefulWidget {
  /* final String accountId;*/
  final String quoteId;
  final RequestQuoteViewButtonModel requestQuote;

  //termType comes from individual tab

  const GasPricePerYear({this.quoteId, this.requestQuote});

  @override
  _GasPricePerYearState createState() => _GasPricePerYearState();
}

class _GasPricePerYearState extends State<GasPricePerYear> {
  bool _autovalidation = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null
        // return widget.quoteId
        ? BaseView<GasPriceOneViewModel>(
            onModelReady: (model) =>
                model.initializeData(widget.requestQuote, '1'),
            builder: (context, model, child) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: model.state == ViewState.BUSY
                      ? AppConstant.circularProgressIndicator()
                      : Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.03),
                          child: ListView(children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                padding: EdgeInsets.all(10),
                                color: Color.fromRGBO(18, 122, 69, 1),
                                child: Text(
                                  "Contract",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    model.selectDate(context, 'start');
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: new Border(
                                        left: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        bottom: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                      )),

                                      //color: Color.fromRGBO(18, 122, 69, 1),
                                      child: Text(
                                        "Start Date : ${model.startDate}",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    model.selectDate(context, 'end');
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: new Border(
                                        left: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        bottom: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        right: new BorderSide(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                      )),
                                      //color: Color.fromRGBO(18, 122, 69, 1),
                                      child: Text(
                                        'End Date : ${model.endDate}',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(18, 122, 69, 1),
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                //padding: EdgeInsets.only(top :10,bottom: 10),
                                child: Text(
                                  "Base Rate",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                            new Divider(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              thickness: 1.5,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  // padding: EdgeInsets.all(10),
                                  //height: 500,
                                  child: AppTextField(
                                    title: AppString.standingCharge,
                                    controller:
                                        model.baseStandingChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.standingCharge),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  child: AppTextField(
                                    title: AppString.unitCharge,
                                    controller: model.baseUniteChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.unitCharge),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                child: Text(
                                  "Required Uplift",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                            new Divider(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              thickness: 1.5,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  child: AppTextField(
                                    title: AppString.standingCharge,
                                    controller:
                                        model.requiredStandingChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.standingCharge),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  //  height: MediaQuery.of(context).size.height*0.062,
                                  //padding: EdgeInsets.all(10),
                                  //height: 500,
                                  child: AppTextField(
                                    title: AppString.unitCharge,
                                    controller:
                                        model.requiredBaseUniteChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.unitCharge),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                //padding: EdgeInsets.only(top :10,bottom: 10),
                                child: Text(
                                  "Final Price",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                            new Divider(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              thickness: 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  child: AppTextField(
                                    title: AppString.standingCharge,
                                    controller:
                                        model.finalStandingChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.standingCharge),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .44,
                                  child: AppTextField(
                                    title: AppString.unitCharge,
                                    controller:
                                        model.finalBaseUniteChargeController,
                                    autoValidation: _autovalidation,
                                    textInputType: TextInputType.number,
                                    hintText: '',
                                    textInputFormatter: [
                                      new WhitelistingTextInputFormatter(
                                          RegExp("[0-9]")),
                                    ],
                                    validator: (value) =>
                                        AppConstant.stringValidator(
                                            value, AppString.unitCharge),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                //padding: EdgeInsets.only(top :10,bottom: 10),
                                child: Text(
                                  "Affiliate Uplift",
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 122, 69, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                            new Divider(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              thickness: 1.5,
                            ),
                            Form(
                              key: _formKey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    //  height: MediaQuery.of(context).size.height*0.062,
                                    // padding: EdgeInsets.all(10),
                                    //height: 500,
                                    child: AppTextField(
                                      title: AppString.standingCharge,
                                      controller: model
                                          .affiliateStandingChargeController,
                                      autoValidation: _autovalidation,
                                      textInputType: TextInputType.number,
                                      hintText: '',
                                      textInputFormatter: [
                                        new WhitelistingTextInputFormatter(
                                            RegExp("[0-9]")),
                                      ],
                                      validator: (value) =>
                                          AppConstant.stringValidator(
                                              value, AppString.standingCharge),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .44,
                                    //  height: MediaQuery.of(context).size.height*0.062,
                                    //padding: EdgeInsets.all(10),
                                    //height: 500,
                                    child: AppTextField(
                                      title: AppString.unitCharge,
                                      controller: model
                                          .affiliateBaseUniteChargeController,
                                      autoValidation: _autovalidation,
                                      textInputType: TextInputType.number,
                                      hintText: '',
                                      textInputFormatter: [
                                        new WhitelistingTextInputFormatter(
                                            RegExp("[0-9.]")),
                                      ],
                                      validator: (value) =>
                                          AppConstant.stringValidator(
                                              value, AppString.unitCharge),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Export Tender Price",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    model.onClickTenderPrice(
                                        true,
                                        user.accountId,
                                        widget.quoteId,
                                        context);
                                  },
                                ),
                                InkWell(
                                  onTap: () {
                                    model.onClickTenderPrice(
                                        false,
                                        user.accountId,
                                        widget.quoteId,
                                        context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Email Tender Price",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(95, 183, 97, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      model.onSaved(
                                          user.accountId,
                                          widget.quoteId,
                                          widget.requestQuote,
                                          '1',
                                          context);
                                    }
                                  },
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        0.058,
                                    child: Center(
                                      child: Text(
                                        "Valid",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(67, 140, 200, 1),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            InkWell(
                              onTap: () {
                                if (widget.quoteId != null) {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

//                                    model.generateIndividualContractView(
//                                        user.accountId,
//                                        widget.quoteId,
//                                        context);
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.058,
                                child: Center(
                                  child: Text(
                                    "Generate Contract",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            ),
                            InkWell(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus &&
                                    currentFocus.focusedChild != null) {
                                  currentFocus.focusedChild.unfocus();
                                }
                                if (widget.quoteId != null) {
                                  model.onAskQuote(
                                      user.accountId, widget.quoteId, context);
                                } else {
//    If all data are not valid then start auto validation.
                                  setState(() {
                                    _autovalidation = true;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.058,
                                child: Center(
                                  child: Text(
                                    "Ask for Requote",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.019,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                            ),
                          ]),
                        ));
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
