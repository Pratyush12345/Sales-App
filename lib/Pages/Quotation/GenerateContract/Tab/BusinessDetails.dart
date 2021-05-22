import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/BusinessDetailViewModel.dart';

class BusinessDetails extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  BusinessDetails({this.individualModel});
  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final _formKey = GlobalKey<FormState>();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<BusinessDetailViewModel>(
      onModelReady: (model) => model.setDetails(widget.individualModel),
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          AppConstant.circularProgressIndicator();
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
                  AppTextField(
                    title: AppString.businessName,
                    controller: model.businessName,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.businessName,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.businessName);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: AppString.regCompanyName,
                    controller: model.regCompanyName,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.regCompanyName,
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
                    title: AppString.companyRegNo,
                    controller: model.companyRegNo,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: AppString.companyRegNo,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.companyRegNo);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: AppString.charityRegNo,
                    controller: model.charityRegNo,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: AppString.charityRegNo,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.charityRegNo);
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
                      //globals.tabController6.animateTo(2);
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
