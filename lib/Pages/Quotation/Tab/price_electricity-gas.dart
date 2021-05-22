import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';

import 'package:pozitive/Core/ViewModel/quotation_page/price_electricity_gas_viewmodel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';
import 'package:pozitive/Util/global.dart' as globals;

class PriceElectricityGasIndividual extends StatefulWidget {
  final String quoteID;
  PriceElectricityGasIndividual({this.quoteID});
  @override
  _PriceElectricityGasIndividualState createState() =>
      _PriceElectricityGasIndividualState();
}

class _PriceElectricityGasIndividualState
    extends State<PriceElectricityGasIndividual> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidation = false;
  Widget partnerview(List partners, PriceElectricityGasViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: partners.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                partners[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                model.onSelectPartner(partners[index]);

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BaseView<PriceElectricityGasViewModel>(
        onModelReady: (model) => model.initializeData(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        //  height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        //height: 500,
                        child: AppTextField(
                          title: AppString.commonUpLiftElectricity,
                          controller: model.eUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.commonUpLiftElectricity),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        //height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        // height: 500,
                        child: AppTextField(
                          // title: AppString.commonUpLiftElectricity,
                          controller: model.eScUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'SC Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
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
                        //  height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        //height: 500,
                        child: AppTextField(
                          title: AppString.commonUpLiftGas,
                          controller: model.gUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.commonUpLiftGas),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        //height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        // height: 500,
                        child: AppTextField(
                          // title: AppString.commonUpLiftElectricity,
                          controller: model.gScUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'SC Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
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
                        //  height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        //height: 500,
                        child: AppTextField(
                          title: AppString.commonUpLiftElectricityAffiliate,
                          controller: model.aEUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value,
                              AppString.commonUpLiftElectricityAffiliate),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        //height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(10),
                        // height: 500,
                        child: AppTextField(
                          title: '\n',
                          controller: model.aEScUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'SC Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
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
                        //  height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(8),
                        //height: 500,
                        child: AppTextField(
                          title: AppString.commonUpLiftGasAffiliate,
                          controller: model.aGUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.commonUpLiftGasAffiliate),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        //height: MediaQuery.of(context).size.height*0.062,
                        padding: EdgeInsets.all(8),
                        // height: 500,
                        child: AppTextField(
                          controller: model.aGScUpliftController,
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.number,
                          hintText: 'SC Uplift',
                          textInputFormatter: [
                            new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          ],
                          validator: (value) => AppConstant.stringValidator(
                              value, AppString.commonUpLiftGasAffiliate),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
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
                          hintText: "Select Partner",
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Select Partner';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                          context: context,
                          builder: (context)=> Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: Colors.grey.withOpacity(.2),
                                ),
                                Container(
                                  child:
                                      partnerview(['${user.userName}'], model),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .45,
                          height: MediaQuery.of(context).size.height * 0.062,
                          child: Center(
                            child: Text(
                              "Export Tender Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 119, 217, 1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onTap: () {
                          model.onClickTenderPrice(
                              true, user.accountId, widget.quoteID, context);
//                        ExportTenderPriceService.downloadExportTenderFromUrl(model.exportTenderPricePath);
                        },
                      ),
                      InkWell(
                        onTap: () {
                          model.onClickTenderPrice(
                              false, user.accountId, widget.quoteID, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .45,
                          height: MediaQuery.of(context).size.height * 0.062,
                          child: Center(
                            child: Text(
                              "Email Tender Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
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
                      if (_formKey.currentState.validate()) {
                        model.onSaveAndNext();
                        globals.tabController7.animateTo(4);
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
