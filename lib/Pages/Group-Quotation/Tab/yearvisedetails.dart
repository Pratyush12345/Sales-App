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
    print(widget.type);
    baserateday.text = widget.groupDetailslst[widget.index].baserateday == ''
        ? '0'
        : widget.groupDetailslst[widget.index].baserateday;
    baseratenight.text =
        widget.groupDetailslst[widget.index].baseratenight == ''
            ? '0'
            : widget.groupDetailslst[widget.index].baseratenight;
    baserateEwe.text = widget.groupDetailslst[widget.index].baserateEwe == ''
        ? '0'
        : widget.groupDetailslst[widget.index].baserateEwe;
    baserateSC.text = widget.groupDetailslst[widget.index].baserateSC == ''
        ? '0'
        : widget.groupDetailslst[widget.index].baserateSC;

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
        onModelReady: (model) => model.initializeData(widget.requestQuote, '1',
            widget.groupDetailslst, widget.index, widget.type),
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
              widget.type == "MPAN" ? Column(
                children: [
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
                ],
              ) : Column(
                children: [
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
                              AppConstant.stringValidator(value, AppString.Night),
                        ),
                      ),
                    ],
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
              widget.type == "MPAN" ? Column(
                children: [
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
                          controller: requiredUpliftDay,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftDay.text) >=0 && double.parse(requiredUpliftDay.text) <=1.5)
                                {
                                 upliftPreminumDay.text ='0' ;
                                }
                              else if(double.parse(requiredUpliftDay.text) >1.5 && double.parse(requiredUpliftDay.text) <=2){
                                upliftPreminumDay.text ='0.1' ;
                              }
                              else if(double.parse(requiredUpliftDay.text) >2 && double.parse(requiredUpliftDay.text) <=2.5){
                                upliftPreminumDay.text ='0.2' ;
                              }
                              else{
                                upliftPreminumDay.text ='0.3' ;
                              }
                              finalPriceDay.text = (double.parse(baserateday.text) + double.parse(upliftPreminumDay.text)+
                                  double.parse(text))
                                  .toString();
                            });
                          },
                          // onChanged: (text) {
                          //   setState(() {
                          //     eleUniVar1 = double.tryParse(text.toString());
                          //     // if (double.tryParse(text) > 3) {
                          //     //   //hideKeyboard();
                          //     //   return 'max value 3';
                          //     validate1 =true;
                          //     // }
                          //   });
                          // },

                          validator: (value) {
                            String patttern =
                                r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';
                            RegExp regexp = new RegExp(
                              r"^|\-|\,|\ ",
                              caseSensitive: false,
                              multiLine: false,
                            );
                            // RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (double.tryParse(value) > 3) {
                                return 'max value 3';
                              }
                            }
                            return null;
                          },
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
                          controller: requiredUpliftNight,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftNight.text) >=0 && double.parse(requiredUpliftNight.text) <=1.5)
                              {
                                upliftPreminumNight.text ='0' ;
                              }
                              else if(double.parse(requiredUpliftNight.text) >1.5 && double.parse(requiredUpliftNight.text) <=2){
                                upliftPreminumNight.text ='0.1' ;
                              }
                              else if(double.parse(requiredUpliftNight.text) >2 && double.parse(requiredUpliftNight.text) <=2.5){
                                upliftPreminumNight.text ='0.2' ;
                              }
                              else{
                                upliftPreminumNight.text ='0.3' ;
                              }
                              finalPriceNight.text =
                                  (double.parse(baseratenight.text) + double.parse(upliftPreminumNight.text)+
                                      double.parse(text))
                                      .toString();
                            });
                          },
                          validator: (value) {
                            String patttern =
                                r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';
                            RegExp regexp = new RegExp(
                              r"^|\-|\,|\ ",
                              caseSensitive: false,
                              multiLine: false,
                            );
                            // RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (double.tryParse(value) > 3) {
                                return 'max value 3';
                              }
                            }
                            return null;
                          },
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
                          controller: requiredUpliftEWE,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftEWE.text) >=0 && double.parse(requiredUpliftEWE.text) <=1.5)
                              {
                                upliftPreminumEWE.text ='0' ;
                              }
                              else if(double.parse(requiredUpliftEWE.text) >1.5 && double.parse(requiredUpliftEWE.text) <=2){
                                upliftPreminumEWE.text ='0.1' ;
                              }
                              else if(double.parse(requiredUpliftEWE.text) >2 && double.parse(requiredUpliftEWE.text) <=2.5){
                                upliftPreminumEWE.text ='0.2' ;
                              }
                              else{
                                upliftPreminumEWE.text ='0.3' ;
                              }
                              finalPriceEWE.text = (double.parse(
                                  baserateEwe.text == null
                                      ? baserateEwe.text
                                      : '0') + double.parse(upliftPreminumEWE.text)+
                                  double.parse(text))
                                  .toString();
                            });
                          },
                          validator: (value) {
                            String patttern =
                                r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';
                            RegExp regexp = new RegExp(
                              r"^|\-|\,|\ ",
                              caseSensitive: false,
                              multiLine: false,
                            );
                            // RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              if (double.tryParse(value) > 3) {
                                return 'max value 3';
                              }
                            }
                            return null;
                          },
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
                          controller: requiredUpliftSc,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftSc.text) == 0  ){
                                upliftPreminumSc.text = "0";
                              }
                              else if(double.parse(requiredUpliftSc.text) >0 && double.parse(requiredUpliftSc.text) <=10 ){
                                upliftPreminumSc.text = "1";
                              }
                              else if(double.parse(requiredUpliftSc.text) >10 && double.parse(requiredUpliftSc.text) <=20 ){
                                upliftPreminumSc.text = "2";
                              }
                              else if(double.parse(requiredUpliftSc.text) >20 && double.parse(requiredUpliftSc.text) <=30 ){
                                upliftPreminumSc.text = "3";
                              }
                              else if(double.parse(requiredUpliftSc.text) >30 && double.parse(requiredUpliftSc.text) <=40 ){
                                upliftPreminumSc.text = "4";
                              }
                              else{
                                upliftPreminumSc.text = "5";
                              }
                              finalPriceSc.text = (double.parse(baserateSC.text) + double.parse(upliftPreminumSc.text)+
                                  double.parse(text))
                                  .toString();
                            });
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (requiredUpliftDay.text != null) {
                                if (double.parse(requiredUpliftDay.text) > 0) {
                                  if (double.tryParse(value) > 50) {
                                    return 'Max value is 50';
                                  } else {}
                                }
                                if (double.parse(requiredUpliftDay.text)  == 0) {
                                  if (double.tryParse(value) > 100) {
                                    return 'Max value is 100';
                                  }
                                }
                              } else {
                                if (double.tryParse(value) > 100) {
                                  return 'Max value is 100';
                                }
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ) : Column(
                children: [
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
                          controller: requiredUpliftDay,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftDay.text) >=0 && double.parse(requiredUpliftDay.text) <=1.5)
                              {
                                upliftPreminumDay.text ='0' ;
                              }
                              finalPriceDay.text = (double.parse(baserateday.text) + double.parse(upliftPreminumDay.text)+
                                  double.parse(text))
                                  .toString();
                            });
                          },
                          validator: (value) {
                            String patttern =
                                r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';

                            RegExp regExp = new RegExp(patttern);
                            if (value.isNotEmpty) {
                              // if (value.length > 9) {
                              //   return 'Enter 0 or 1';
                              // } else if (!regExp.hasMatch(value)) {
                              //   return 'Enter 0 or 1';
                              // }
                              if (value.isNotEmpty) {
                                if (double.tryParse(value) > 1.5) {
                                  return 'max value 1.5';
                                }
                              }
                            }

                            return null;
                          },
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
                          controller: requiredUpliftSc,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(requiredUpliftSc.text) == 0  ){
                                upliftPreminumSc.text = "0";
                              }
                              else if(double.parse(requiredUpliftSc.text) >0 && double.parse(requiredUpliftSc.text) <=10 ){
                                upliftPreminumSc.text = "1";
                              }
                              else if(double.parse(requiredUpliftSc.text) >10 && double.parse(requiredUpliftSc.text) <=20 ){
                                upliftPreminumSc.text = "2";
                              }
                              else if(double.parse(requiredUpliftSc.text) >20 && double.parse(requiredUpliftSc.text) <=30 ){
                                upliftPreminumSc.text = "3";
                              }
                              else if(double.parse(requiredUpliftSc.text) >30 && double.parse(requiredUpliftSc.text) <=40 ){
                                upliftPreminumSc.text = "4";
                              }
                              else{
                                upliftPreminumSc.text = "5";
                              }
                              finalPriceSc.text =
                                  (double.parse(baserateSC.text) + double.parse(upliftPreminumSc.text)+
                                      double.parse(text))
                                      .toString();
                            });
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(requiredUpliftDay.text) != null) {
                                if (double.parse(requiredUpliftDay.text) > 0) {
                                  if (double.tryParse(value) > 25) {
                                    return 'Max value is 25';
                                  } else {}
                                }
                                if (double.parse(requiredUpliftDay.text) == 0) {
                                  if (double.tryParse(value) > 50) {
                                    return 'Max value is 50';
                                  }
                                }
                              } else {
                                if (double.tryParse(value) > 50) {
                                  return 'Max value is 50';
                                }
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
              widget.type == "MPAN" ? Column(
                children: [
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
                          controller: upliftPreminumDay,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(upliftPreminumDay.text) == 0){
                                requiredUpliftDay.text = "1.5";
                              }
                              else if(double.parse(upliftPreminumDay.text) == 0.1){
                                requiredUpliftDay.text = "2";
                              }
                              else if(double.parse(upliftPreminumDay.text) == 0.2){
                                requiredUpliftDay.text = "2.5";
                              }
                              else{
                                requiredUpliftDay.text = "3.0";
                              }
                              finalPriceDay.text =
                                  (double.parse(baserateday.text) + double.parse(requiredUpliftDay.text)+
                                      double.parse(text))
                                      .toString();
                            });
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumDay.text) != null) {
                                if (double.parse(upliftPreminumDay.text)  != 0 &&
                                    double.parse(upliftPreminumDay.text)  != 0.1 &&
                                    double.parse(upliftPreminumDay.text)  != 0.2 &&
                                    double.parse(upliftPreminumDay.text)  != 0.3) {
                                  return "value must be 0/0.1/0.2/0.3";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
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
                          controller: upliftPreminumNight,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(upliftPreminumNight.text) == 0){
                                requiredUpliftNight.text = "1.5";
                              }
                              else if(double.parse(upliftPreminumNight.text) == 0.1){
                                requiredUpliftNight.text = "2";
                              }
                              else if(double.parse(upliftPreminumNight.text) == 0.2){
                                requiredUpliftNight.text = "2.5";
                              }
                              else{
                                requiredUpliftNight.text = "3.0";
                              }
                              finalPriceNight.text =
                                  (double.parse(baseratenight.text) + double.parse(requiredUpliftNight.text)+
                                      double.parse(text))
                                      .toString();
                            });
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumNight.text) != null) {
                                if (double.parse(upliftPreminumNight.text)  != 0 &&
                                    double.parse(upliftPreminumNight.text)  != 0.1 &&
                                    double.parse(upliftPreminumNight.text)  != 0.2 &&
                                    double.parse(upliftPreminumNight.text)  != 0.3) {
                                  return "value must be 0/0.1/0.2/0.3";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
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
                          controller: upliftPreminumEWE,
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
                          onChanged: (text) {
                            setState(() {
                              if(double.parse(upliftPreminumEWE.text) == 0){
                                requiredUpliftEWE.text = "1.5";
                              }
                              else if(double.parse(upliftPreminumEWE.text) == 0.1){
                                requiredUpliftEWE.text = "2";
                              }
                              else if(double.parse(upliftPreminumEWE.text) == 0.2){
                                requiredUpliftEWE.text = "2.5";
                              }
                              else{
                                requiredUpliftEWE.text = "3.0";
                              }
                              finalPriceEWE.text =
                                  (double.parse(baserateEwe.text) + double.parse(requiredUpliftEWE.text)+
                                      double.parse(text))
                                      .toString();
                            });
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumEWE.text) != null) {
                                if (double.parse(upliftPreminumEWE.text)  != 0 &&
                                    double.parse(upliftPreminumEWE.text)  != 0.1 &&
                                    double.parse(upliftPreminumEWE.text)  != 0.2 &&
                                    double.parse(upliftPreminumEWE.text)  != 0.3) {
                                  return "value must be 0/0.1/0.2/0.3";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
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
                          controller: upliftPreminumSc,
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
                          onChanged: (text){
                            if(double.parse(upliftPreminumSc.text) == 0){
                              requiredUpliftSc.text = "0";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 1){
                              requiredUpliftSc.text = "10";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 2){
                              requiredUpliftSc.text = "20";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 3){
                              requiredUpliftSc.text = "30";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 4){
                              requiredUpliftSc.text = "40";
                            }
                            else{
                              requiredUpliftSc.text = "50";
                            }
                            finalPriceSc.text =
                                (double.parse(baserateSC.text) + double.parse(requiredUpliftSc.text)+
                                    double.parse(text))
                                    .toString();
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumSc.text) != null) {
                                if (double.parse(upliftPreminumSc.text)  != 0 &&
                                    double.parse(upliftPreminumSc.text)  != 1 &&
                                    double.parse(upliftPreminumSc.text)  != 2 &&
                                    double.parse(upliftPreminumSc.text)  != 3 &&
                                    double.parse(upliftPreminumSc.text)  != 4 &&
                                    double.parse(upliftPreminumSc.text)  != 5) {
                                  return "value must be 0/1/2/3/4/5";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ) : Column(
                children: [
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
                          controller: upliftPreminumDay,
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
                          onChanged: (text){
                            if(double.parse(upliftPreminumDay.text) == 0){
                              requiredUpliftDay.text = "1.5";
                            }
                            finalPriceDay.text =
                                (double.parse(baserateday.text) + double.parse(requiredUpliftDay.text)+
                                    double.parse(text))
                                    .toString();
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumDay.text) != null) {
                                if (double.parse(upliftPreminumDay.text)  != 0 &&
                                    double.parse(upliftPreminumDay.text)  != 0.1 &&
                                    double.parse(upliftPreminumDay.text)  != 0.2 &&
                                    double.parse(upliftPreminumDay.text)  != 0.3) {
                                  return "value must be 0/0.1/0.2/0.3";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
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
                          controller: upliftPreminumSc,
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
                          onChanged: (text){
                            if(double.parse(upliftPreminumSc.text) == 0){
                              requiredUpliftSc.text = "0";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 1){
                              requiredUpliftSc.text = "10";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 2){
                              requiredUpliftSc.text = "20";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 3){
                              requiredUpliftSc.text = "30";
                            }
                            else if(double.parse(upliftPreminumSc.text) == 4){
                              requiredUpliftSc.text = "40";
                            }
                            else{
                              requiredUpliftSc.text = "50";
                            }
                            finalPriceSc.text =
                                (double.parse(baserateSC.text) + double.parse(requiredUpliftSc.text)+
                                    double.parse(text))
                                    .toString();
                          },
                          validator: (value) {
                            // String patttern =
                            //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                            //
                            // RegExp regExp = new RegExp(patttern);
                            if (value.length != 0) {
                              if (double.parse(upliftPreminumSc.text) != null) {
                                if (double.parse(upliftPreminumSc.text)  != 0 &&
                                    double.parse(upliftPreminumSc.text)  != 1 &&
                                    double.parse(upliftPreminumSc.text)  != 2 &&
                                    double.parse(upliftPreminumSc.text)  != 3 ) {
                                  return "value must be 0/1/2/3";
                                }
                                else
                                  return null;
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
              widget.type == "MPAN" ? Column(
                children: [
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
                          controller: affiliateUpliftDay,
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
                          controller: affiliateUpliftNight,
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
                          controller: affiliateUpliftEWE,
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
                          controller: affiliateUpliftSc,
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
                ],
              ) : Column(
                children: [
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
                          controller: affiliateUpliftDay,
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
                          title: AppString.SC,
                          controller: affiliateUpliftSc,
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
             widget.type == "MPAN" ? Column(
               children: [
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
                         controller: finalPriceDay,
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
                         controller: finalPriceNight,
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
                         controller: finalPriceEWE,
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
                         controller: finalPriceSc,
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
               ],
             ) : Column(
               children: [
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
                         controller: finalPriceDay,
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
                         controller: finalPriceSc,
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
