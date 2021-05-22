import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/ViewModel/quotation_page/IndividualContractViewModels/EAMViewModel.dart';

class EnergyAccountManager extends StatefulWidget {
  final SaveAndGenerateContractIndividualModel individualModel;
  EnergyAccountManager({this.individualModel});
  @override
  _EnergyAccountManagerState createState() => _EnergyAccountManagerState();
}

class _EnergyAccountManagerState extends State<EnergyAccountManager> {
  final _formKey = GlobalKey<FormState>();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<EAMViewModel>(
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
                  AppTextField(
                    title: AppString.name,
                    controller: model.contractEamName,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.name,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.name);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: AppString.emailAddess,
                    controller: model.contractEamEmail,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: AppString.emailAddess,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.emailAddess);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: AppString.phoneNo,
                    controller: model.contractEamPhone,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: AppString.phoneNo,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.phoneNo);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  AppTextField(
                    title: AppString.mobileNo,
                    controller: model.contractEamMobile,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.number,
                    hintText: AppString.mobileNo,
                    validator: (value) {
                      if (value) {
                        return AppConstant.stringValidator(
                            value, AppString.mobileNo);
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
                      // globals.tabController6.animateTo(5);
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
