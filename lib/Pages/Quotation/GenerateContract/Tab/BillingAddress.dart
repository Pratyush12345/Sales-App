import 'package:flutter/material.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/BillingAddressViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';

class BillingAddress extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  BillingAddress({this.individualModel});
  @override
  _BillingAddressState createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  final _formKey = GlobalKey<FormState>();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<BillingAddressViewModel>(
      onModelReady: (model) => model.setDetails(widget.individualModel),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          Scaffold(
              body: AppConstant.circularProgressIndicator(),
              backgroundColor: Colors.white);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Address',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                          color: Color.fromRGBO(31, 33, 29, 1)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    child: innerLongtextfield(
                        5,
                        model.contractBillAddress,
                        _autovalidation,
                        TextInputType.text,
                        "Billing Address", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Billing Address';
                      }
                      return null;
                    }, context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: 'Town/City',
                    controller: model.contractBillTown,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: 'Town/City',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.regCompanyName);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: 'PostCode',
                    controller: model.contractBillPostcode,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: 'PostCode',
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.companyRegNo);
                      }
                      return null;
                    },
                  ),
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
                      // globals.tabController6.animateTo(4);
                    },
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
