import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/peg_history_list_widget.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/Group-Quotation/view_price_elec_gas_viewmodel.dart';

class ViewPriceElecGasGroup extends StatefulWidget {
  final String groupId;
  ViewPriceElecGasGroup({this.groupId});
  @override
  _ViewPriceElecGasGroupState createState() => _ViewPriceElecGasGroupState();
}

final _formKey = GlobalKey<FormState>();

class _ViewPriceElecGasGroupState extends State<ViewPriceElecGasGroup> {
  ThemeApp themeApp = ThemeApp();

  List viewlist = [];
  double gasUniVar1;
  double eleUniVar1;
  double eleUniAfi;
  double gasUniAfi;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<ViewPriceElectricityGasViewModel>(
        onModelReady: (model) =>
            model.initializeData(context: context, groupId: widget.groupId),
        builder: (context, model, child) {
          if (model.state == ViewState.BUSY) {
            return AppConstant.circularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftElectricity,
                            controller: model.elecCommonUnit,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            // validator: (value) => AppConstant.numberValidator1(
                            //     value, model.elecCommonUnit.text),
                            onChanged: (text) {
                              setState(() {
                                eleUniVar1 = double.tryParse(text.toString());
                                // if (double.tryParse(text) > 3) {
                                //   //hideKeyboard();
                                //   return 'max value 3';
                                // }
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
                              else{
                                return "please enter Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          // height: 500,
                          child: AppTextField(
                            // title: AppString.commonUpLiftElectricity,
                            controller: model.elecCommonSc,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            validator: (value) {
                              // String patttern =
                              //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                              //
                              // RegExp regExp = new RegExp(patttern);
                              if (value.length != 0) {
                                if (eleUniVar1 != null) {
                                  if (eleUniVar1 > 0) {
                                    if (double.tryParse(value) > 50) {
                                      return 'Max value is 50';
                                    } else {}
                                  }
                                  if (eleUniVar1 == 0) {
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
                              else{
                                return "please enter SC Uplift";
                              }
                              return null;
                            },
                            // validator: (value) => AppConstant.numberValidator2(
                            //     value, model.elecCommonSc.text ,model.elecCommonUnit.text)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftGas,
                            controller: model.gasCommonUnit,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            onChanged: (text) {
                              setState(() {
                                gasUniVar1 =
                                    double.tryParse(text.toString());
                                // if (double.tryParse(text) > 1.5) {
                                //   //hideKeyboard();
                                //   return 'max value 1.5';
                                // }
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
                              else{
                                return "please enter Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            // title: AppString.commonUpLiftElectricity,
                            controller: model.gasCommonSc,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            validator: (value) {
                              // String patttern =
                              //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                              //
                              // RegExp regExp = new RegExp(patttern);
                              if (value.length != 0) {
                                if (gasUniVar1 != null) {
                                  if (gasUniVar1 > 0) {
                                    if (double.tryParse(value) > 25) {
                                      return 'Max value is 25';
                                    } else {}
                                  }
                                  if (gasUniVar1 == 0) {
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
                              else{
                                return "please enter SC Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftElectricityAffiliate,
                            controller: model.elecAffiliateUnit,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            // validator: (value) => AppConstant.numberValidator1(
                            //     value, model.elecCommonUnit.text),
                            onChanged: (text) {
                              setState(() {
                                eleUniAfi= double.tryParse(text.toString());
                                // if (double.tryParse(text) > 3) {
                                //   //hideKeyboard();
                                //   return 'max value 3';
                                // }
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
                              else{
                                return "please enter Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: '\n',
                            controller: model.elecAffiliateSc,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            validator: (value) {
                              // String patttern =
                              //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                              //
                              // RegExp regExp = new RegExp(patttern);
                              if (value.length != 0) {
                                if (eleUniAfi != null) {
                                  if (eleUniAfi > 0) {
                                    if (double.tryParse(value) > 50) {
                                      return 'Max value is 50';
                                    } else {}
                                  }
                                  if (eleUniAfi == 0) {
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
                              else{
                                return "please enter SC Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(8),
                          child: AppTextField(
                            title: AppString.commonUpLiftGasAffiliate,
                            controller: model.gasAffiliateUnit,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            onChanged: (text) {
                              setState(() {
                                gasUniAfi =
                                    double.tryParse(text.toString());
                                // if (double.tryParse(text) > 1.5) {
                                //   //hideKeyboard();
                                //   return 'max value 1.5';
                                // }
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
                              else{
                                return "please enter Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(8),
                          child: AppTextField(
                            title: '\n',
                            controller: model.gasAffiliateSc,
                            autoValidation: true,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              WhitelistingTextInputFormatter(
                                RegExp(r'^\d+.?\d{0,4}'),
                              ),
                            ],
                            validator: (value) {
                              // String patttern =
                              //     r'^([0-1]\d{0,1})(\.[0-5]\d{0,4})?$';
                              //
                              // RegExp regExp = new RegExp(patttern);
                              if (value.length != 0) {
                                if (gasUniAfi != null) {
                                  if (gasUniAfi > 0) {
                                    if (double.tryParse(value) > 25) {
                                      return 'Max value is 25';
                                    } else {}
                                  }
                                  if (gasUniAfi == 0) {
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
                              else{
                                return "please enter SC Uplift";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    //Quote History
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .02,
                            right: MediaQuery.of(context).size.width * .02),
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Color.fromRGBO(18, 122, 69, 1),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.height *
                                      0.017,
                                  left: MediaQuery.of(context).size.height *
                                      0.017,
                                  top:
                                      MediaQuery.of(context).size.height * 0.01,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        AppString.termYear,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        AppString.grossValueOftheContractPence,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: model.lstVolumeGroupData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PegGroupQuoteHistoryList(
                                  viewlist: viewlist,
                                  index: index,
                                  termYear:
                                      '${model.lstVolumeGroupData[index].intTermType.toString()} Year',
                                  grossValue: model.lstVolumeGroupData[index]
                                      .grossValueOfContract
                                      .toString(),
                                  netValueOfContract: model
                                      .lstVolumeGroupData[index]
                                      .netValueOfContract
                                      .toString(),
                                  volumeDiscountAmt: model
                                      .lstVolumeGroupData[index]
                                      .discountValueOfContract
                                      .toString(),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    //Save and Next
                    PurpleFlatButton(
                      text: 'Save and Next',
                      onTap: () {
                        if(_formKey.currentState.validate()){
                          model.onSaveAndNext();
                          globals.tabController8.animateTo(3);
                        }

                      }

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
