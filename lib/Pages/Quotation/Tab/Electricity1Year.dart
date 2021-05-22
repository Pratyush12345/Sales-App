import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/electricity_one_year_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';

class ElectricityPricePerYear extends StatefulWidget {
  final String quoteId;

  //termType comes from individual tab
  final RequestQuoteViewButtonModel requestQuote;

  const ElectricityPricePerYear({this.quoteId, this.requestQuote});

  @override
  _ElectricityPricePerYearState createState() =>
      _ElectricityPricePerYearState();
}

class _ElectricityPricePerYearState extends State<ElectricityPricePerYear> {
  bool _autovalidation = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user.accountId != null
        ? BaseView<ElectricityOneYearViewModel>(
            onModelReady: (model) =>
                model.initializeData(widget.requestQuote, '1'),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: AppConstant.circularProgressIndicator(),
                );
              }
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
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
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      bottom: new BorderSide(
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                    )),

                                    //color: Color.fromRGBO(18, 122, 69, 1),
                                    child: Text(
                                      "Start Date : ${model.startDate}",
                                      style: TextStyle(
                                          color: Color.fromRGBO(18, 122, 69, 1),
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
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      bottom: new BorderSide(
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                      right: new BorderSide(
                                          color: Color.fromRGBO(18, 122, 69, 1),
                                          width: 2.0,
                                          style: BorderStyle.solid),
                                    )),
                                    //color: Color.fromRGBO(18, 122, 69, 1),
                                    child: Text(
                                      "End Date : ${model.endDate}",
                                      style: TextStyle(
                                          color: Color.fromRGBO(18, 122, 69, 1),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.day,
                                  controller: model.dayController,
                                  autoValidation: _autovalidation,
                                  textInputType:
                                      TextInputType.numberWithOptions(
                                          decimal: true),
                                  hintText: 'Day',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.night,
                                  controller: model.nightController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'night',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.eWE,
                                  controller: model.eweController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'EWE',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.eWE),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.sc,
                                  controller: model.scController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'SC',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.sc),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.day,
                                  controller: model.requiredUpLiftDayController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'Day',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.night,
                                  controller:
                                      model.requiredUpLiftNightController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'night',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.eWE,
                                  controller: model.requiredUpLiftEweController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'EWE',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.eWE),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.sc,
                                  controller: model.requiredUpLiftScController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'SC',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.sc),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
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
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.day,
                                  controller: model.finalUpLiftDayController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'Day',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.night,
                                  controller: model.finalUpLiftNightController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'night',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.eWE,
                                  controller: model.finalUpLiftEweController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'EWE',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.eWE),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.sc,
                                  controller: model.finalUpLiftScController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'SC',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.sc),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.day,
                                  controller:
                                      model.affiliateUpLiftDayController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'Day',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.night,
                                  controller:
                                      model.affiliateUpLiftNightController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'night',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.day),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                // padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.eWE,
                                  controller:
                                      model.affiliateUpLiftEweController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'EWE',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.eWE),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .44,
                                //  height: MediaQuery.of(context).size.height*0.062,
                                //padding: EdgeInsets.all(10),
                                //height: 500,
                                child: AppTextField(
                                  title: AppString.sc,
                                  controller: model.affiliateUpLiftScController,
                                  autoValidation: _autovalidation,
                                  textInputType: TextInputType.number,
                                  hintText: 'SC',
                                  textInputFormatter: [
                                    new WhitelistingTextInputFormatter(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) =>
                                      AppConstant.stringValidator(
                                          value, AppString.sc),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018,
                          ),
                          AppTextField(
                            title: AppString.kva,
                            controller: model.supplyCapacityController,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            hintText: '',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.kva),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          AppTextField(
                            title: AppString.emrCFD,
                            controller: model.emrCFDController,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            hintText: '',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.emrCFD),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          AppTextField(
                            title: AppString.excess_capacityCharge,
                            controller: model.excessCapacityController,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            hintText: '',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.excess_capacityCharge),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          AppTextField(
                            title: AppString.reactiveCharge,
                            controller: model.reactiveController,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            hintText: '',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.reactiveCharge),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
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
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  model.onClickTenderPrice(true, user.accountId,
                                      widget.quoteId, context);
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  model.onClickTenderPrice(false,
                                      user.accountId, widget.quoteId, context);
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
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
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
                                      model.savePartnerPriceUpLift(
                                          user.accountId,
                                          widget.quoteId,
                                          widget.requestQuote,
                                          '1',
                                          context,
                                          false);
                                    }
                                  }),
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
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          InkWell(
                            onTap: () {
                              if (widget.quoteId != null) {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                      //  model.generateIndividualContractView(user.accountId,widget.quoteId,context);
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
                            height: MediaQuery.of(context).size.height * 0.028,
                          ),
                          InkWell(
                            onTap: () {
                              if (widget.quoteId != null) {
                                print('object');
                                model.askForReQuoteView(
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
                            height: MediaQuery.of(context).size.height * 0.028,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                currentFocus.focusedChild.unfocus();
                              }
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                model.savePartnerPriceUpLift(
                                    user.accountId,
                                    widget.quoteId,
                                    widget.requestQuote,
                                    '1',
                                    context,
                                    false);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.062,
                              child: Center(
                                child: Text(
                                  "Save And Next",
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
                            height: MediaQuery.of(context).size.height * 0.028,
                          ),
                        ],
                      ),
                    ),
                  ));
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
