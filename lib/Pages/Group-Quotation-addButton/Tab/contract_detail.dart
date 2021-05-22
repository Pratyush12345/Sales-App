import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appColors.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/purple_flat_button.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:pozitive/Widget/appointmentWidget.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/flatbutton_green_color.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/add_site_detail_dialog.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/Tab/edit_site_detail_dialog.dart';

class ContractDetail extends StatefulWidget {
  @override
  _ContractDetailState createState() => _ContractDetailState();
}

class _ContractDetailState extends State<ContractDetail> {
  TextEditingController mpanController = TextEditingController();
  bool autovalidation = false;
  bool elecGasSelected = false;
  bool oneYear = false;
  bool twoYear = false;
  bool threeYear = false;
  bool fourYear = false;
  bool fiveYear = false;
  bool other = false;

  TextEditingController baseRateDay = TextEditingController();
  TextEditingController baseRateNight = TextEditingController();
  TextEditingController baseRateEwe = TextEditingController();
  TextEditingController baseRateSc = TextEditingController();

  TextEditingController requiredUpliftDay = TextEditingController();
  TextEditingController requiredUpliftNight = TextEditingController();
  TextEditingController requiredUpliftEwe = TextEditingController();
  TextEditingController requiredUpliftSc = TextEditingController();

  TextEditingController finalPriceDay = TextEditingController();
  TextEditingController finalPriceNight = TextEditingController();
  TextEditingController finalPriceEwe = TextEditingController();
  TextEditingController finalPriceSc = TextEditingController();

  TextEditingController affiliateUpliftDay = TextEditingController();
  TextEditingController affiliateUpliftNight = TextEditingController();
  TextEditingController affiliateUpliftEwe = TextEditingController();
  TextEditingController affiliateUpliftSc = TextEditingController();

  TextEditingController mprnController = TextEditingController();

  TextEditingController gBaseRateUnit = TextEditingController();
  TextEditingController gBaseRateSc = TextEditingController();

  TextEditingController gRequiredUpliftUnit = TextEditingController();
  TextEditingController gRequiredUpliftSc = TextEditingController();

  TextEditingController gAffiliateUpliftUnit = TextEditingController();
  TextEditingController gAffiliateUpliftSc = TextEditingController();

  TextEditingController gFinalUnit = TextEditingController();
  TextEditingController gFinalSc = TextEditingController();

  TextEditingController contractStartDate = TextEditingController();
  TextEditingController contractEndDate = TextEditingController();

  TextEditingController affiliateController = TextEditingController();

  void toggleOneYear() {
    setState(() {
      oneYear = !oneYear;
    });
  }

  void toggleTwoYear() {
    setState(() {
      twoYear = !twoYear;
    });
  }

  void toggleThreeYear() {
    setState(() {
      threeYear = !threeYear;
    });
  }

  void toggleFourYear() {
    setState(() {
      fourYear = !fourYear;
    });
  }

  void toggleFiveYear() {
    setState(() {
      fiveYear = !fiveYear;
    });
  }

  void toggleOther() {
    setState(() {
      other = !other;
    });
  }

  void toggleElecGas() {
    setState(() {
      elecGasSelected = !elecGasSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Scaffold(
        backgroundColor: AppColors.defaultWhite,
        body: ListView(
          children: [
            RichText(
              text: TextSpan(
                text: AppString.selectMpanCaps,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(mpanController, false, autovalidation,
                    TextInputType.text, "Select MPAN", (value) {
                  if (value.isEmpty) {
                    return 'Please Select MPAN';
                  }
                  return null;
                }, context),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Icon(
                          elecGasSelected
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Color.fromRGBO(155, 119, 217, 1),
                          size: MediaQuery.of(context).size.height * .023,
                        ),
                        onTap: toggleElecGas,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Text(
                        AppString.electricityGas,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .019,
                          color: themeApp.purplecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Electricity Gas
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBoxField(
                      checked: oneYear,
                      text: '1 Year',
                      onTap: toggleOneYear,
                    ),
                    CheckBoxField(
                      checked: twoYear,
                      text: '2 Year',
                      onTap: toggleTwoYear,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBoxField(
                      checked: threeYear,
                      text: '3 Year',
                      onTap: toggleThreeYear,
                    ),
                    CheckBoxField(
                      checked: fourYear,
                      text: '4 Year',
                      onTap: toggleFourYear,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckBoxField(
                      checked: fiveYear,
                      text: '5 Year',
                      onTap: toggleFiveYear,
                    ),
                    CheckBoxField(
                      checked: other,
                      text: 'Other',
                      onTap: toggleOther,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Base Rate
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  child: Text(
                    "Base Rate",
                    style: TextStyle(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                new Divider(
                  color: Color.fromRGBO(18, 122, 69, 1),
                  thickness: 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.day,
                        controller: baseRateDay,
                        autoValidation: autovalidation,
                        textInputType:
                            TextInputType.numberWithOptions(decimal: true),
                        hintText: 'Day',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.night,
                        controller: baseRateNight,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'night',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.eWE,
                        controller: baseRateEwe,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'EWE',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.eWE),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.sc,
                        controller: baseRateSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'SC',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.sc),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            //Required Uplift

            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  child: Text(
                    "Required Uplift",
                    style: TextStyle(
                        color: Color.fromRGBO(18, 122, 69, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                new Divider(
                  color: Color.fromRGBO(18, 122, 69, 1),
                  thickness: 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.day,
                        controller: requiredUpliftDay,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'Day',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.night,
                        controller: requiredUpliftNight,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'night',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.eWE,
                        controller: requiredUpliftEwe,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'EWE',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.eWE),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.sc,
                        controller: requiredUpliftSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'SC',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.sc),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            // Final Price
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.94,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.day,
                        controller: finalPriceDay,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'Day',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.night,
                        controller: finalPriceNight,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'night',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.eWE,
                        controller: finalPriceEwe,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'EWE',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.eWE),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.sc,
                        controller: finalPriceSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'SC',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.sc),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Affiliate Uplift

            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.94,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.day,
                        controller: affiliateUpliftDay,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'Day',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.night,
                        controller: affiliateUpliftNight,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'night',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.day),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.eWE,
                        controller: affiliateUpliftEwe,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'EWE',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.eWE),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.sc,
                        controller: affiliateUpliftSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: 'SC',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) =>
                            AppConstant.stringValidator(value, AppString.sc),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Gas
            Text(
              AppString.gas,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeApp.purplecolor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            AppTextField(
              title: 'MPRN:',
              controller: mprnController,
              autoValidation: autovalidation,
              textInputType: TextInputType.number,
              hintText: 'MPRN',
              textInputFormatter: [
                new WhitelistingTextInputFormatter(RegExp("[0-9]")),
              ],
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.mPRN),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            //Base
            Column(
              children: [
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.standingCharge,
                        controller: gBaseRateSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.standingCharge),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.unitCharge,
                        controller: gBaseRateUnit,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.unitCharge),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Required Uplift
            Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.standingCharge,
                        controller: gRequiredUpliftSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.standingCharge),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.unitCharge,
                        controller: gRequiredUpliftUnit,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.unitCharge),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Affiliate Uplift
            Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.standingCharge,
                        controller: gAffiliateUpliftSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.standingCharge),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.unitCharge,
                        controller: gAffiliateUpliftUnit,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9.]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.unitCharge),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //final

            Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.standingCharge,
                        controller: gFinalSc,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.standingCharge),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      child: AppTextField(
                        title: AppString.unitCharge,
                        controller: gFinalUnit,
                        autoValidation: autovalidation,
                        textInputType: TextInputType.number,
                        hintText: '',
                        textInputFormatter: [
                          new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                        ],
                        validator: (value) => AppConstant.stringValidator(
                            value, AppString.unitCharge),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Contract Date

            Text(
              AppString.contractDate,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeApp.purplecolor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .44,
                  child: AppTextField(
                    title: AppString.contractStartDate,
                    controller: contractStartDate,
                    autoValidation: autovalidation,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    ],
                    validator: (value) => AppConstant.stringValidator(
                        value, AppString.standingCharge),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .44,
                  child: AppTextField(
                    title: AppString.contractEndDate,
                    controller: contractEndDate,
                    autoValidation: autovalidation,
                    textInputType: TextInputType.number,
                    hintText: '',
                    textInputFormatter: [
                      new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                    ],
                    validator: (value) => AppConstant.stringValidator(
                        value, AppString.unitCharge),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            //Select Affiliate
            RichText(
              text: TextSpan(
                text: AppString.selectAffiliate,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .062,
                child: DropDownTextField(
                  controller: affiliateController,
                  obscureText: false,
                  autoValidation: autovalidation,
                  textInputType: TextInputType.text,
                  hintText: "Select Affiliate",
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Select Affiliate';
                    }
                    return null;
                  },
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //Buttons
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      FlatButtonGreenColor(
                        buttonText: 'VALID',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      FlatButtonGreenColor(
                        buttonText: 'REFRESH',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      FlatButtonGreenColor(
                        buttonText: 'GENERATE CONTRACT',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      FlatButtonGreenColor(
                        buttonText: 'EXPORT TENDER PRICE',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      FlatButtonGreenColor(
                        buttonText: 'SEND TENDER PRICE',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      FlatButtonGreenColor(
                        buttonText: 'REMOVE SITE',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      FlatButtonGreenColor(
                        buttonText: 'EDIT SITE',
                        onTap: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => EditSiteDetailDialog(),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  //Main buttons
                  Column(
                    children: [
                      PurpleFlatButton(
                        text: 'SAVE',
                        onTap: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (context) => AppointmentWidget(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PurpleFlatButton(
                          text: 'GENERATE GROUP CONTRACT', onTap: () {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PurpleFlatButton(
                          text: 'EXPORT TENDER PRICE', onTap: () {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PurpleFlatButton(text: 'SEND TENDER PRICE', onTap: () {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PurpleFlatButton(text: 'DOWNLOAD CONTRACT', onTap: () {}),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PurpleFlatButton(
                        text: 'ADD SITE',
                        onTap: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => AddSiteDetailDialog(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
