import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';

import 'package:pozitive/Widget/commonWidget/appTextField.dart';

import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/GasViewModel.dart';

class Gas extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  Gas({this.individualModel});
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  bool isMprnEntered = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<GasViewModel>(
      onModelReady: (model) => model.setDetails(widget.individualModel),
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
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'MPRN',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: Color.fromRGBO(31, 33, 29, 1)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    child: innertextfield2(model.contractMprn, false,
                        _autovalidation, TextInputType.number, "MPRN", (value) {
                      String patttern = '[0-9]';

                      if (value.length != 0) {
                        setState(() {
                          isMprnEntered = true;
                        });
                        if (value.length < 6 || value.length > 10) {
                          return 'Please enter a valid Mprn';
                        }
                      }
                      if (value.length == 0) {
                        setState(() {
                          isMprnEntered = false;
                        });
                      }

                      return null;
                    }, context, 10),
                  ),
                  AppTextField(
                      enabled: false,
                      title: AppString.standingCharge,
                      controller: model.contractSc,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      hintText: AppString.standingCharge,
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                      validator: (value) {
                        if (isMprnEntered) {
                          return AppConstant.stringValidator(
                              value, AppString.standingCharge);
                        }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                      enabled: false,
                      title: 'Unit Price',
                      controller: model.contractUnitPrice,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      hintText: 'Unit Price',
                      textInputFormatter: [
                        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                      ],
                      validator: (value) {
                        return AppConstant.stringValidator(value, 'Unit Price');
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Contact Start Date',
                    controller: model.contractStartDate,
                    autoValidation: _autovalidation,
                    //  textInputType: TextInputType.number,
                    hintText: 'Contract Start Date',
                    textInputFormatter: [
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    ],
                    validator: (value) {
                      return AppConstant.stringValidator(
                          value, 'Contact Start Date');
                    },
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
                  //         return 'Please Select date';
                  //       }
                  //       return null;
                  //     }, context),
                  //   ),
                  //   onTap: () {
                  //     model.selectDate(context, "Required");
                  //   },
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  AppTextField(
                    enabled: false,
                    title: 'Contact End Date',
                    controller: model.contractEndDate,
                    autoValidation: _autovalidation,
                    //  textInputType: TextInputType.number,
                    hintText: 'Contract End Date',
                    textInputFormatter: [
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    ],
                    validator: (value) {
                      return AppConstant.stringValidator(
                          value, 'Contact End Date');
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
                  //         return 'Please Select End date';
                  //       }
                  //       return null;
                  //     }, context),
                  //   ),
                  //   onTap: () {
                  //     model.selectDate2(context, "Required");
                  //   },
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  InkWell(
                    onTap: () {
                      model.onSaveAndNext();
                      // globals.tabController6.animateTo(7);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "Save and Next",
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
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
