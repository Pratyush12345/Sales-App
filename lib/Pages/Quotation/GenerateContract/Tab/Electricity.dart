import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/ElectricityViewModel.dart';

class Electricity extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  Electricity({this.individualModel});
  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<ElectricityViewModel>(
      onModelReady: (model) =>
          model.setElectricityDetails(widget.individualModel),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          Scaffold(
              body: AppConstant.circularProgressIndicator(),
              backgroundColor: Colors.white);
        }
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.034,
                right: MediaQuery.of(context).size.width * 0.034),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  Text(
                    "MPAN",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: AppTextFieldWithOutBorder(
                                enabled: false,
                                controller: model.contractMpanCode,
                                digit: 2,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  return AppConstant.stringValidator(value, '');
                                },
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color.fromRGBO(
                                              128, 189, 40, 1)))),
                            ),
                            // child: withoutboderdropdowntextfield(
                            //     model.contractMpanCode,
                            //     false,
                            //     _autovalidation,
                            //     TextInputType.text,
                            //     "", (value) {
                            //   return null;
                            // }, context),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color:
                                            Color.fromRGBO(128, 189, 40, 1)))),
                          ),
                          onTap: () {
                            // FocusScope.of(context).requestFocus(FocusNode());
                            // showDialog(
                            //     context: context,
                            //     child: Dialog(
                            //       child: Column(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: <Widget>[
                            //           SizedBox(
                            //             height:
                            //                 MediaQuery.of(context).size.height *
                            //                     0.03,
                            //           ),
                            //           Text(
                            //             "Select MPAN",
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                     0.03),
                            //           ),
                            //           SizedBox(
                            //             height:
                            //                 MediaQuery.of(context).size.height *
                            //                     0.02,
                            //           ),
                            //           Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height: 1,
                            //             color: Colors.grey.withOpacity(.2),
                            //           ),
                            //           Container(
                            //             child: model.mpancodeview(),
                            //           )
                            //         ],
                            //       ),
                            //     ));
                          },
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan1,
                            digit: 3,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              return AppConstant.stringValidator(value, '');
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .32,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan2,
                            digit: 3,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              return AppConstant.stringValidator(value, '');
                            },
                            // validator: (value) =>
                            //     AppConstant.stringValidator(value, ''),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan3,
                            digit: 2,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              return AppConstant.stringValidator(value, '');
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: themeApp.textfieldbordercolor,
                                      width: 2))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan4,
                            digit: 4,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              return AppConstant.stringValidator(value, '');
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: themeApp.textfieldbordercolor,
                                      width: 2))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan5,
                            digit: 4,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              return AppConstant.stringValidator(value, '');
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Color.fromRGBO(128, 189, 40, 1)))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .23,
                          child: AppTextFieldWithOutBorder(
                            enabled: false,
                            controller: model.contractMpan6,
                            digit: 3,
                            autoValidation: _autovalidation,
                            textInputType: TextInputType.number,
                            // textInputFormatter: [
                            //   new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            // ],
                            validator: (value) {
                              AppConstant.stringValidator(value, '');
                            },
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                  ),
                  // mpanError != null
                  //     ? Text(
                  //         mpanError,
                  //         style: TextStyle(color: Colors.red),
                  //       )
                  //     : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    enabled: false,
                    title: AppString.standingCharge,
                    controller: model.contractStandingCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: AppString.standingCharge,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.standingCharge);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Day Unit Charge',
                    controller: model.contractDayCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Day Unit Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Day Unit Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Night Unit Charge',
                    controller: model.contractNightCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Night Unit Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Night Unit Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'EWE Unit Charge',
                    controller: model.contractEweCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'EWE Unit Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'EWE Unit Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Capacity Charge',
                    controller: model.contractCapacityCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Capacity Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Capacity Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Supply Capacity',
                    controller: model.contractSupplyCapacityCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Supply Capacity',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Supply Capacity');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Excess Capacity Charge',
                    controller: model.contractExcessCapacityCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Excess Capacity Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Excess Capacity Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Reactive Charge',
                    controller: model.contractReactiveCharge,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: 'Reactive Charge',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Reactive Charge');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Contract Start Date',
                  //     style: TextStyle(
                  //         fontSize: MediaQuery.of(context).size.height * .015,
                  //         color: Color.fromRGBO(31, 33, 29, 1)),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.01,
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height * .062,
                  //     child: datetextfield(
                  //         model.contractStartDate,
                  //         false,
                  //         _autovalidation,
                  //         TextInputType.text,
                  //         "Select date", (value) {
                  //       if (value.isEmpty) {
                  //         return 'Please Select Start date';
                  //       }
                  //       return null;
                  //     }, context),
                  //   ),
                  //   onTap: () {
                  //     model.selectDate(context, "Required");
                  //   },
                  // ),
                  AppTextField(
                    enabled: false,
                    title: 'Contract Start Date',
                    controller: model.contractStartDate,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: 'Contract Start Date',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Contract Start Date');
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Contract End Date',
                    controller: model.contractEndDate,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: 'Contract End Date',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, 'Contract End Date');
                      }
                      return null;
                    },
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Contract End Date',
                  //     style: TextStyle(
                  //         fontSize: MediaQuery.of(context).size.height * .015,
                  //         color: Color.fromRGBO(31, 33, 29, 1)),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.01,
                  // ),
                  // InkWell(
                  //   child: SizedBox(
                  //     height: MediaQuery.of(context).size.height * .062,
                  //     child: datetextfield(
                  //         model.contractEndDate,
                  //         false,
                  //         _autovalidation,
                  //         TextInputType.text,
                  //         "Select date", (value) {
                  //       if (value.isEmpty) {
                  //         return 'Please Select End Date ';
                  //       }
                  //       return null;
                  //     }, context),
                  //   ),
                  //   onTap: () {
                  //     model.selectDate2(context, "Required");
                  //   },
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.030,
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
                    onTap: () {
                      model.onSaveAndNext();
                      // globals.tabController6.animateTo(6);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.030,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
