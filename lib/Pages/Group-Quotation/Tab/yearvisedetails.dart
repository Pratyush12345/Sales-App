import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Model/view_quotation_page_argument.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/gas_price_one_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';

class play extends StatefulWidget {
  final String quoteId;
  // final ViewQuotationPageArgument argument;
  final RequestQuoteViewButtonModel requestQuote;
  final String title;

  const play({this.quoteId, this.requestQuote, this.title});
  @override
  _playState createState() => _playState();
}

class _playState extends State<play> {
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  //bool requiredUplift = false;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool fieldsEnabled = true;
  bool requestedRequote = false;
  bool enableExportEmail = true;
  bool enableSaveValid = true;
  bool enableGenContract = true;
  bool enableAskForRequote = true;
  double gasAffiliateUnitVar;

  List<String> contractEndDate;
  QuotationPriceElectricityGasModel priceElectricityGasModel;
  RequestQuoteViewButtonModel requestQuoteViewButtonModel =
      RequestQuoteViewButtonModel();
  Database database = getIt<DatabaseImplementation>();

  @override
  void initState() {
    //onCallApi();

    if (widget.requestQuote.contractstartdate == null)
      widget.requestQuote.contractstartdate = '12/05/2021';
    print(widget.requestQuote.contractstartdate.toString());
    contractEndDate = DateTime.parse(
            widget.requestQuote.contractstartdate.split('/').reversed.join())
        .add(new Duration(days: 364))
        .toString()
        .substring(0, 10)
        .split('-');
    if (widget.title == 'Requested') {
      fieldsEnabled = false;
      enableExportEmail = false;
      enableSaveValid = false;
      enableGenContract = false;
      enableAskForRequote = false;
    }
    if (widget.title == 'Requested Requote') {
      fieldsEnabled = false;
      enableSaveValid = false;
      enableGenContract = false;
      enableAskForRequote = false;
    }
    // if (priceElectricityGasModel.gasUplift != '') {
    //   gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GasPriceOneViewModel>(
        onModelReady: (model) => model.initializeData(widget.requestQuote, '1'),
        builder: (context, model, child) {
          return Column(children: <Widget>[
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
// onTap: () {
//   model.selectDate(context, 'start');
// },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
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
                        "Start Date : ${widget.requestQuote.contractstartdate}",
                        style: TextStyle(
                            color: Color.fromRGBO(18, 122, 69, 1),
                            fontWeight: FontWeight.w600),
                      )),
                ),
                InkWell(
// onTap: () {
//   model.selectDate(context, 'end');
// },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
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
                        'End Date : ${contractEndDate[2]}/${contractEndDate[1]}/${contractEndDate[0]}',

//  'End Date : ${contractEndDate[2]}/${contractEndDate[1]}/${contractEndDate[0]}',
                        style: TextStyle(
                            color: Color.fromRGBO(18, 122, 69, 1),
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
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
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: false,
                    title: AppString.Day,
                    controller: model.baseStandingChargeController,
                    autoValidation: true,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Day),
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
                    enabled: false,
                    title: AppString.Night,
                    controller: model.baseUniteChargeController,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Night),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
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
                    enabled: false,
                    title: AppString.EWE,
                    controller: model.baseStandingChargeController,
                    autoValidation: true,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.EWE),
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
                    enabled: false,
                    title: AppString.SC,
                    controller: model.baseUniteChargeController,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.SC),
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.Day,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Day),
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
                    enabled: true,
                    title: AppString.Night,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Night),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.EWE,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.EWE),
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
                    enabled: true,
                    title: AppString.SC,
                    controller: model.sclift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.SC),
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
                  "Uplift Price Premium",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.Day,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Day),
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
                    enabled: true,
                    title: AppString.Night,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Night),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.EWE,
                    controller: model.commonuplift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.EWE),
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
                    enabled: true,
                    title: AppString.SC,
                    controller: model.sclift,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.SC),
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.Day,
                    controller: model.requiredStandingChargeController,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Day),
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
                    enabled: true,
                    title: AppString.Night,
                    controller: model.requiredStandingChargeController,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.Night),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: true,
                    title: AppString.EWE,
                    controller: model.requiredStandingChargeController,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.EWE),
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
                    enabled: true,
                    title: AppString.SC,
                    controller: model.requiredStandingChargeController,
                    autoValidation: false,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                    validator: (value) =>
                        AppConstant.stringValidator(value, AppString.SC),
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: false,
                    title: AppString.Day,
                    controller: model.requiredStandingChargeController,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
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
                    enabled: false,
                    title: AppString.Night,
                    controller: model.requiredStandingChargeController,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
//  height: MediaQuery.of(context).size.height*0.062,
// padding: EdgeInsets.all(10),
//height: 500,
                  child: AppTextField(
                    enabled: false,
                    title: AppString.EWE,
                    controller: model.requiredStandingChargeController,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
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
                    enabled: false,
                    title: AppString.SC,
                    controller: model.requiredStandingChargeController,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      DecimalTextInputFormatter(
                        decimalRange: 4,
                      ),
                      WhitelistingTextInputFormatter(
                        RegExp(r'^\d+.?\d{0,4}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.058,
              child: Center(
                child: Text(
                  "Generate Contract",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.058,
              child: Center(
                child: Text(
                  "Remove Site",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.058,
              child: Center(
                child: Text(
                  "Edit Site",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: 15,
            ),
          ]);
        });
  }
}
