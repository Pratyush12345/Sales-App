import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential..dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential.dart';
import 'package:pozitive/Core/Model/Api/generateIndividualContractCredential.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/save_button_credentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/sendTenderPriceCredentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/update_button_credentials.dart';
import 'package:pozitive/Core/Model/ApiResponse/save_button_response.dart';
import 'package:pozitive/Core/Model/ApiResponse/send_email_tender_response.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_gas_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';

import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import '../../baseview.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Pages/Quotation/GenerateContract/generateContractIndividual.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';

class GasPriceOneViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController baseStandingChargeController = TextEditingController();
  TextEditingController commonuplift = TextEditingController();
  TextEditingController sclift = TextEditingController();
  TextEditingController requiredStandingChargeController =
      TextEditingController();
  TextEditingController finalStandingChargeController = TextEditingController();
  TextEditingController affiliateStandingChargeController =
      TextEditingController();
  TextEditingController baseUniteChargeController = TextEditingController();
  TextEditingController requiredBaseUniteChargeController =
      TextEditingController();
  TextEditingController finalBaseUniteChargeController =
      TextEditingController();
  TextEditingController affiliateBaseUniteChargeController =
      TextEditingController();
  QuotationElectricityModel electricityModel;
  QuotationGasModel gasModel;
  QuotationIndividualModel individualModel;
  QuotationPriceElectricityGasModel priceElectricityGasModel;
  GroupQuotationPriceElectricityGasModel GroupPriceElectricityGasModel;
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  String startDate = '';
  String endDate = '';
  String finalBase = '0';
  String finalSc = '0';
  double gasStandingVar;

  void initializeData(
      RequestQuoteViewButtonModel requestQuote, String termType) async {
    setState(ViewState.BUSY);
    startDate = requestQuote.contractstartdate.toString();
    electricityModel = await Prefs.getQuotationElectricityDetails();
    gasModel = await Prefs.getQuotationGasDetails();
    individualModel = await Prefs.getQuotationInvidualDetails();
    priceElectricityGasModel = await Prefs.getQuotationGasElectricityDetails();
GroupPriceElectricityGasModel = await Prefs.getGroupQuotationGasElectricityDetails();
    if (termType == '1') {
      if (priceElectricityGasModel.gasUplift != null) {
        gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
      }
      baseStandingChargeController.text =
          requestQuote?.baserateSatandingChargeGas1 ?? '0.0000';
      baseUniteChargeController.text =
          requestQuote?.baserateUnitPriceGas1 ?? '';
      requiredBaseUniteChargeController.text =
          priceElectricityGasModel?.gasUplift ?? '';
      requiredStandingChargeController.text =
          priceElectricityGasModel?.gasUplift ?? '';
      affiliateBaseUniteChargeController.text =
          priceElectricityGasModel?.gAUplift ?? '';
      affiliateStandingChargeController.text =
          priceElectricityGasModel?.gAScUplift ?? '';
      finalStandingChargeController.text =
          requestQuote?.finalSatandingChargeGas1F ?? '';
      finalBaseUniteChargeController.text =
          requestQuote?.finalUnitPriceGas1F.toString() ?? '';

      commonuplift.text = GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
      sclift.text = GroupPriceElectricityGasModel?.elecCommonSc ?? '';
      finalBase = priceElectricityGasModel?.gasUplift ?? '';
      finalSc = priceElectricityGasModel?.gasScUplift ?? '0.0000';
    } else if (termType == '2') {
      if (priceElectricityGasModel.gasUplift != null) {
        gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
      }
      baseStandingChargeController.text =
          requestQuote.baserateSatandingChargeGas2 ?? '';
      baseUniteChargeController.text = requestQuote.baserateUnitPriceGas2 ?? '';
      requiredBaseUniteChargeController.text =
          priceElectricityGasModel.gasUplift ?? '';
      requiredStandingChargeController.text =
          priceElectricityGasModel.gasScUplift ?? '';
      affiliateBaseUniteChargeController.text =
          priceElectricityGasModel.gAUplift ?? '';
      affiliateStandingChargeController.text =
          priceElectricityGasModel.gAScUplift ?? '';
      finalStandingChargeController.text =
          requestQuote.finalSatandingChargeGas2F.toString() ?? '';
      finalBaseUniteChargeController.text =
          requestQuote.finalUnitPriceGas2F.toString() ?? '';
      finalBase = priceElectricityGasModel.gasUplift ?? '0';
      finalSc = priceElectricityGasModel.gasScUplift ?? '0';
    } else if (termType == '3') {
      if (priceElectricityGasModel.gasUplift != null) {
        gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
      }
      baseStandingChargeController.text =
          requestQuote.baserateSatandingChargeGas3 ?? '';
      baseUniteChargeController.text = requestQuote.baserateUnitPriceGas3 ?? '';
      requiredBaseUniteChargeController.text =
          priceElectricityGasModel.gasUplift ?? '';
      requiredStandingChargeController.text =
          priceElectricityGasModel.gasScUplift ?? '';
      affiliateBaseUniteChargeController.text =
          priceElectricityGasModel.gAUplift ?? '';
      affiliateStandingChargeController.text =
          priceElectricityGasModel.gAScUplift ?? '';
      finalStandingChargeController.text =
          requestQuote.finalSatandingChargeGas3F.toString() ?? '';
      finalBaseUniteChargeController.text =
          requestQuote.finalUnitPriceGas3F.toString() ?? '';
      finalBase = priceElectricityGasModel.gasUplift ?? '0';
      finalSc = priceElectricityGasModel.gasScUplift ?? '0';
    } else if (termType == '4') {
      if (priceElectricityGasModel.gasUplift != null) {
        gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
      }
      baseStandingChargeController.text =
          requestQuote.baserateSatandingChargeGas4 ?? '';
      baseUniteChargeController.text = requestQuote.baserateUnitPriceGas4 ?? '';
      requiredBaseUniteChargeController.text =
          priceElectricityGasModel.gasUplift ?? '';
      requiredStandingChargeController.text =
          priceElectricityGasModel.gasScUplift ?? '';
      affiliateBaseUniteChargeController.text =
          priceElectricityGasModel.gAUplift ?? '';
      affiliateStandingChargeController.text =
          priceElectricityGasModel.gAScUplift ?? '';
      finalStandingChargeController.text =
          requestQuote.finalSatandingChargeGas4F.toString() ?? '';
      finalBaseUniteChargeController.text =
          requestQuote.finalUnitPriceGas4F.toString() ?? '';
      finalBase = priceElectricityGasModel.gasUplift ?? '0';
      finalSc = priceElectricityGasModel.gasScUplift ?? '0';
    } else if (termType == '5') {
      if (priceElectricityGasModel.gasUplift != null) {
        gasStandingVar = double.tryParse(priceElectricityGasModel.gasUplift);
      }
      baseStandingChargeController.text =
          requestQuote.baserateSatandingChargeGas5 ?? '';
      baseUniteChargeController.text = requestQuote.baserateUnitPriceGas5 ?? '';
      requiredBaseUniteChargeController.text =
          priceElectricityGasModel.gasUplift ?? '';
      requiredStandingChargeController.text =
          priceElectricityGasModel.gasScUplift ?? '';
      affiliateBaseUniteChargeController.text =
          priceElectricityGasModel.gAUplift ?? '';
      affiliateStandingChargeController.text =
          priceElectricityGasModel.gAScUplift ?? '';
      finalStandingChargeController.text =
          requestQuote.finalSatandingChargeGas5F.toString() ?? '';
      finalBaseUniteChargeController.text =
          requestQuote.finalUnitPriceGas5F.toString() ?? '';
      finalBase = priceElectricityGasModel.gasUplift ?? '0';
      finalSc = priceElectricityGasModel.gasScUplift ?? '0';
    }

    setState(ViewState.IDLE);
  }

  Future selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "start") {
        startDate = dateFormat.format(picked);
      } else {
        endDate = dateFormat.format(picked);
      }
      setState(ViewState.IDLE);
    }
  }

  void onSaved(
      String accountID,
      String quoteID,
      RequestQuoteViewButtonModel requestQuote,
      String termType,
      BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();

    //if (priceElectricityGasModel.subUserID != null) {
    SaveButtonResponse response = await database.saveRequestQuoteIndividual(
        SaveButtonCredentials(
            accountID: _user.accountId,
            quoteID: quoteID,
            nextPreferredStartDate: requestQuote.nextPreferredStartDate,
            intAffiliateSubUserId: priceElectricityGasModel.subUserID,
            termType: termType,
            requiredUpliftGas1Y: requiredBaseUniteChargeController.text ?? '',
            requiredUpliftGasSC1Y: requiredStandingChargeController.text ?? '',
            affiliateUpliftGas1Y: affiliateBaseUniteChargeController.text ?? '',
            affiliateUpliftGasSC1Y:
                affiliateStandingChargeController.text ?? ''));
    setState(ViewState.IDLE);
    if (response.status == '1' || response.status == '2') {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    // }
  }

  void generateIndividualContractView(
      String accountID,
      String quoteID,
      RequestQuoteViewButtonModel requestQuote,
      String termType,
      BuildContext context) async {
    // if (priceElectricityGasModel.subUserID != null) {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    print('User Id ' + '${_user.accountId}');
    print('Quote Id ' + '$quoteID');
    print('Preferred Start Date ' +
        '${requestQuote.nextPreferredStartDate ?? ''}');
    print('Sub user Id ${priceElectricityGasModel?.subUserID ?? ''}');
    print('Term type $termType');
    print('Int CompanyID ${requestQuote.intCompanyId.toString()}');
    print('Required 1 Y ${requiredBaseUniteChargeController.text ?? ''}');
    print('Required SC 1 Y ${requiredStandingChargeController.text ?? ''}');
    print('Affiliate 1 Y ${affiliateBaseUniteChargeController.text ?? ''}');
    print('Affiliate SC 1 Y ${affiliateStandingChargeController.text ?? ''}');

    final response = await database
        .generateIndividualContractService(GenerateIndividualContractCredential(
      accountId: _user.accountId,
      quoteId: quoteID,
      nextPreferredStartDate: requestQuote.nextPreferredStartDate ?? '',
      intsubuserID: priceElectricityGasModel?.subUserID ?? '',
      termType: termType,
      // intCompanyId: requestQuote.intCompanyId.toString(),
      intCompanyId: '1',
      requiredUpliftGas1Y: requiredBaseUniteChargeController.text ?? '',
      requiredUpliftGasSC1Y: requiredStandingChargeController.text ?? '',
      affiliateUpliftGas1Y: affiliateBaseUniteChargeController.text ?? '',
      affiliateUpliftGasSC1Y: affiliateStandingChargeController.text ?? '',
      requiredUpliftEle1Y: '',
      requiredUpliftEleNight1Y: '',
      requiredUpliftEleEWE1Y: '',
      requiredUpliftEleSC1Y: '',
      affiliateUpliftEle1Y: '',
      affiliateUpliftEleNight1Y: '',
      affiliateUpliftEleSC1Y: '',
      affiliateUpliftEleEWE1Y: '',
      baserateDayUnit1: '',
      baserateNightUnit1: '',
    ));
    setState(ViewState.IDLE);
    if (response.status == '1') {
      AppConstant.showSuccessToast(context, response.msg);
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) => GenerateContractIndividual(
            quoteID: quoteID,
            customerId: response.customerId.toString(),
          ),
        ),
      );
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    // // } else {
    // //   globals.tabController3.animateTo(3);
    // // }
  }

  void onClickTenderPrice(bool export, String accountID, String quoteID,
      BuildContext context) async {
    User _user = await Prefs.getUser();
    setState(ViewState.BUSY);
    SendEmailTenderResponse response = await database.sendEmailTenderIndividual(
        SendTenderPriceCredentials(
            accountId: _user.accountId,
            quoteid: quoteID,
            emailType: export ? 'no' : 'yes',
            termType: '2'));
    if (export) {
      DownloadService.downloadFromUrl(response.data.exportTenderPricePath);
    } else {
      // EmailService.sendEmail(
      //     _user.emailId, response.data.exportTenderPricePath, _user.firstName);
      AppConstant.showSuccessToast(context, response.msg);
    }
    setState(ViewState.IDLE);
  }

  void onAskQuote(
      String accountID, String quoteID, BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();

    final response = await database.askForReQuote(AskForReQuoteCrential(
        accountId: _user.accountId, quoteId: quoteID, flagFrom: "Backend"));

    if (response.status == '1') {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    print(response.toJson());
    setState(ViewState.IDLE);
  }
}
