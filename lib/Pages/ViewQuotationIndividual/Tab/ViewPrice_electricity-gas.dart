import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/user.dart';

import 'package:pozitive/Core/ViewModel/quotation_page/price_electricity_gas_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/Pref.dart';

class ViewPriceElectricityGasIndividual extends StatefulWidget {
  final bool isGasTrue;
  final bool isElecTrue;
  final String quoteID;
  final RequestQuoteViewButtonModel requestQuote;
  final String title;

  ViewPriceElectricityGasIndividual(
      {this.quoteID,
      this.requestQuote,
      this.title,
      this.isGasTrue,
      this.isElecTrue});
  @override
  _ViewPriceElectricityGasIndividualState createState() =>
      _ViewPriceElectricityGasIndividualState();
}

class _ViewPriceElectricityGasIndividualState
    extends State<ViewPriceElectricityGasIndividual> with KeyboardHiderMixin {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidation = false;
  bool fieldsEnabled = true;
  double gasUniVar;
  double eleUniVar;
  double gasAffiliateUniVar;
  double eleAffiliateUniVar;

  Widget partnerview(
      List<AffiliateSubUserList> partners, PriceElectricityGasViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: partners.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                partners[index].text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                model.onChangeSubUserID(partners[index].value);
                model.onSelectPartner(partners[index].text);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    
    if (widget.title == 'Requested') {
      fieldsEnabled = false;
    }
    if (widget.title == 'Requested Requote') {
      fieldsEnabled = false;
    }
    setState(() {});
  }

  bool isUpLiftGreater = false;
  var upLiftGas = 50;
  var upLiftGasHigh = 25;
  var upGasZero = 0;
  var upGasMore = 1.5;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<PriceElectricityGasViewModel>(
        //  onModelReady: (model) => model.initializeData(),
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
                    width: 20,
                  ),
                  widget.isElecTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //  height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              //height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                title: AppString.commonUpLiftElectricity,
                                controller: model.eUpliftController,
                                autoValidation: _autovalidation = true,
                                textInputType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                hintText: 'Uplift',
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
                                    eleUniVar =
                                        double.tryParse(text.toString());
                                    if (double.tryParse(text) > 3) {
                                      //hideKeyboard();
                                      return 'max value 3';
                                    }
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
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              // height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                // title: AppString.commonUpLiftElectricity,
                                controller: model.eScUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                hintText: 'SC Uplift',
                                textInputFormatter: [
                                  DecimalTextInputFormatter(
                                    decimalRange: 4,
                                  ),
                                  WhitelistingTextInputFormatter(
                                    RegExp(r'^\d+.?\d{0,4}'),
                                  ),
                                ],

                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (eleUniVar != null) {
                                      if (eleUniVar > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {}
                                      }
                                      if (eleUniVar == 0) {
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
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.isGasTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //  height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              //height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                title: AppString.commonUpLiftGas,
                                controller: model.gUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.number,
                                hintText: 'Uplift',
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
                                    gasUniVar =
                                        double.tryParse(text.toString());
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
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              // height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                controller: model.gScUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true, signed: false),
                                hintText: 'SC Uplift',
                                textInputFormatter: [
                                  DecimalTextInputFormatter(decimalRange: 4),
                                  WhitelistingTextInputFormatter(
                                    RegExp(r'^\d+.?\d{0,4}'),
                                  ),
                                ],
                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (gasUniVar != null) {
                                      if (gasUniVar > 0) {
                                        if (double.tryParse(value) > 25) {
                                          return 'Max value is 25';
                                        } else {}
                                      }
                                      if (gasUniVar == 0) {
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
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.isElecTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //  height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              //height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                title:
                                    AppString.commonUpLiftElectricityAffiliate,
                                controller: model.aEUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                hintText: 'Uplift',
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
                                    eleAffiliateUniVar =
                                        double.tryParse(text.toString());
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
                                      if (double.tryParse(value) > 3) {
                                        return 'max value 3';
                                      }
                                    }
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(10),
                              // height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                title: '\n',
                                controller: model.aEScUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                hintText: 'SC Uplift',
                                textInputFormatter: [
                                  DecimalTextInputFormatter(
                                    decimalRange: 4,
                                  ),
                                  WhitelistingTextInputFormatter(
                                    RegExp(r'^\d+.?\d{0,4}'),
                                  ),
                                ],
                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (eleAffiliateUniVar != null) {
                                      if (eleAffiliateUniVar > 0) {
                                        if (double.tryParse(value) > 50) {
                                          return 'Max value is 50';
                                        } else {}
                                      }
                                      if (eleAffiliateUniVar == 0) {
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
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.isGasTrue
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //  height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(8),
                              //height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                title: AppString.commonUpLiftGasAffiliate,
                                controller: model.aGUpliftController,
                                autoValidation: _autovalidation,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                hintText: 'Uplift',
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
                                    gasAffiliateUniVar =
                                        double.tryParse(text.toString());
                                  });
                                },
                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.isNotEmpty) {
                                    if (double.tryParse(value) > 1.5) {
                                      return 'max value 1.5';
                                    }
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .47,
                              //height: MediaQuery.of(context).size.height*0.062,
                              padding: EdgeInsets.all(8),
                              // height: 500,
                              child: AppTextField(
                                enabled: fieldsEnabled,
                                controller: model.aGScUpliftController,
                                autoValidation: _autovalidation = true,
                                textInputType: TextInputType.numberWithOptions(
                                    decimal: true),
                                hintText: 'SC Uplift',
                                textInputFormatter: [
                                  DecimalTextInputFormatter(
                                    decimalRange: 4,
                                  ),
                                  WhitelistingTextInputFormatter(
                                    RegExp(r'^\d+.?\d{0,4}'),
                                  ),
                                ],
                                validator: (value) {
                                  String patttern =
                                      r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';

                                  RegExp regExp = new RegExp(patttern);
                                  if (value.length != 0) {
                                    if (gasAffiliateUniVar != null) {
                                      if (gasAffiliateUniVar > 0) {
                                        if (double.tryParse(value) > 25) {
                                          return 'Max value is 25';
                                        } else {}
                                      }
                                      if (gasAffiliateUniVar == 0) {
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
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Affiliate',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: Color.fromRGBO(31, 33, 29, 1)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: DropDownTextField(
                          controller: model.partnerController,
                          obscureText: false,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.text,
                          hintText: "Select Affiliate",
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please Select Affiliate';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    onTap: () {
                      if (fieldsEnabled) {
                        if (widget.requestQuote.affiliateSubUserList[0].text
                                .toString() ==
                            '--Select Affiliate--') {
                          setState(() {
                            widget.requestQuote.affiliateSubUserList
                                .removeAt(0);
                          });
                        }

                        FocusScope.of(context).requestFocus(FocusNode());
                        showDialog(
                            context: context,
                            builder: (context)=> Dialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Text(
                                    "Select Partner",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  Container(
                                    child: partnerview(
                                        widget
                                            .requestQuote.affiliateSubUserList,
                                        model),
                                  )
                                ],
                              ),
                            ));
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  fieldsEnabled
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width * .45,
                                height:
                                    MediaQuery.of(context).size.height * 0.062,
                                child: Center(
                                  child: Text(
                                    "Export Tender Price",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              onTap: () async {
                                User _user = await Prefs.getUser();
                                model.onClickTenderPrice(true, _user.accountId,
                                    widget.quoteID, context);
//                        ExportTenderPriceService.downloadExportTenderFromUrl(model.exportTenderPricePath);
                              },
                            ),
                            InkWell(
                              onTap: () async {
                                User _user = await Prefs.getUser();
                                model.onClickTenderPrice(false, _user.accountId,
                                    widget.quoteID, context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .45,
                                height:
                                    MediaQuery.of(context).size.height * 0.062,
                                child: Center(
                                  child: Text(
                                    "Email Tender Price",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
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
                        )
                      : Container(),
                  fieldsEnabled
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        )
                      : SizedBox(),
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
                    onTap: () {
                      if (fieldsEnabled) {
                        if (_formKey.currentState.validate()) {
                          model.onSaveAndNext();
                          globals.tabController3.animateTo(4);
                        }
                      } else {
                        globals.tabController3.animateTo(4);
                      }
                    },
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
