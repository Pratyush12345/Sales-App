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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftElectricity,
                            controller: model.elecCommonUnit,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftElectricity),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          // height: 500,
                          child: AppTextField(
                            // title: AppString.commonUpLiftElectricity,
                            controller: model.elecCommonSc,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftElectricity),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftGas,
                            controller: model.gasCommonUnit,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftGas),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            // title: AppString.commonUpLiftElectricity,
                            controller: model.gasCommonSc,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftGas),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: AppString.commonUpLiftElectricityAffiliate,
                            controller: model.elecAffiliateUnit,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value,
                                AppString.commonUpLiftElectricityAffiliate),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(10),
                          child: AppTextField(
                            title: '\n',
                            controller: model.elecAffiliateSc,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value,
                                AppString.commonUpLiftElectricityAffiliate),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(8),
                          child: AppTextField(
                            title: AppString.commonUpLiftGasAffiliate,
                            controller: model.gasAffiliateUnit,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftGasAffiliate),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .47,
                          padding: EdgeInsets.all(8),
                          child: AppTextField(
                            controller: model.gasAffiliateSc,
                            autoValidation: model.autovalidation,
                            textInputType: TextInputType.number,
                            hintText: 'SC Uplift',
                            textInputFormatter: [
                              new WhitelistingTextInputFormatter(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) => AppConstant.stringValidator(
                                value, AppString.commonUpLiftGasAffiliate),
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
                      onTap: () => model.onSaveAndNext(),
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
