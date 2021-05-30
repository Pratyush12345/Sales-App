import 'package:email_validator/email_validator.dart';
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
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';

class play extends StatefulWidget {
  final String quoteId;
  // final ViewQuotationPageArgument argument;
  final RequestQuoteViewButtonModel requestQuote;
  final String title;
  final List<EachyYearList> groupDetailslst;
  final int index;
  final String type;
  const play(
      {this.quoteId,
      this.requestQuote,
      this.title,
      @required this.groupDetailslst,
        this.type,
      this.index});
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
 // Database database = getIt<DatabaseImplementation>();
  TextEditingController baserateday = TextEditingController();
  TextEditingController baseratenight = TextEditingController();
  TextEditingController baserateEwe = TextEditingController();
  TextEditingController baserateSC = TextEditingController();
  @override
  void initState() {
    //onCallApi();
    baserateday.text = widget.groupDetailslst[widget.index].baserateday == '' ? '0': widget.groupDetailslst[widget.index].baserateday;
    baseratenight.text = widget.groupDetailslst[widget.index].baseratenight == '' ? '0':widget.groupDetailslst[widget.index].baseratenight;
    baserateEwe.text = widget.groupDetailslst[widget.index].baserateEwe == '' ? '0' : widget.groupDetailslst[widget.index].baserateEwe;
    baserateSC.text = widget.groupDetailslst[widget.index].baserateSC == '' ? '0' : widget.groupDetailslst[widget.index].baserateSC;

    if (widget.requestQuote.contractstartdate == null)
      widget.requestQuote.contractstartdate = '12/05/2021';
   // print(widget.requestQuote.contractstartdate.toString());
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

  // baserateday.text : widget.groupDetailslst[widget.index].baserateday;
  @override
  Widget build(BuildContext context) {
    return BaseView<finalQuotationpPriceModel>(
        onModelReady: (model) => model.initializeData(widget.requestQuote, '1',widget.groupDetailslst, widget.index,widget.type),
        builder: (context, model, child) {
          return Padding(
            padding: EdgeInsets.all(0),
            child: Column(children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.90,
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
                        width: MediaQuery.of(context).size.width * 0.45,
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
                          "Start Date : ${widget.groupDetailslst[widget.index].contractStartDate}",
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
                        width: MediaQuery.of(context).size.width * 0.45,
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
                          'End Date : ${widget.groupDetailslst[widget.index].contractEndDate}',

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
                      controller: baserateday,
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
                      controller: baseratenight,
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
                      controller: baserateEwe,
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
                      controller: baserateSC,
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
                      controller: model.requiredUpliftDay,
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
                      onChanged: (text){
                        setState(() {
                          model.finalPriceDay.text = (double.parse(baserateday.text)+double.parse(text)
                          ).toString();
                        });
                      },
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
                      controller: model.requiredUpliftNight,
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
                      onChanged: (text){
                        setState(() {
                          model.finalPriceNight.text = (double.parse(baseratenight.text)+double.parse(text)
                          ).toString();
                        });
                      },
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
                      controller: model.requiredUpliftEWE,
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
                      onChanged: (text){
                        setState(() {
                          model.finalPriceEWE.text = (double.parse(baserateEwe.text==null ? baserateEwe.text : '0')+double.parse(text)
                          ).toString();
                        });
                      },
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
                      controller: model.requiredUpliftSc,
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
                      onChanged: (text){
                        setState(() {
                          model.finalPriceSc.text = (double.parse(baserateSC.text)+double.parse(text)
                          ).toString();
                        });
                      },
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
                      controller: model.upliftPreminumDay,
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
                      controller: model.upliftPreminumNight,
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
                      controller: model.upliftPreminumEWE,
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
                      controller: model.upliftPreminumSc,
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
                      controller: model.affiliateUpliftDay,
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
                      controller: model.affiliateUpliftNight,
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
                      controller: model.affiliateUpliftEWE,
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
                      controller: model.affiliateUpliftSc,
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
                      controller: model.finalPriceDay,
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
                      controller: model.finalPriceNight,
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
                      controller: model.finalPriceEWE,
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
                      controller: model.finalPriceSc,
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

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.058,
              //   child: Center(
              //     child: Text(
              //       "Edit Site",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: MediaQuery.of(context).size.height * 0.019,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //       color: Color.fromRGBO(155, 119, 217, 1),
              //       borderRadius: BorderRadius.circular(30)),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
            ]),
          );
        });
  }
}
