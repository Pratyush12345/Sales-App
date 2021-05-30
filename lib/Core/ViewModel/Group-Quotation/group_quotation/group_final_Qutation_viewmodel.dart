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
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Pages/Quotation/GenerateContract/generateContractIndividual.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:get_it/get_it.dart';


//GetIt getIt = GetIt.instance;
class finalQuotationpPriceModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  TextEditingController baseStandingChargeController = TextEditingController();
  TextEditingController commonuplift = TextEditingController();
  TextEditingController baseRateDay = TextEditingController();
  TextEditingController baseRateNight = TextEditingController();
  TextEditingController baseRateEWE = TextEditingController();
  TextEditingController baseRateSc = TextEditingController();

  TextEditingController requiredUpliftDay = TextEditingController();
  TextEditingController requiredUpliftNight = TextEditingController();
  TextEditingController requiredUpliftEWE = TextEditingController();
  TextEditingController requiredUpliftSc = TextEditingController();

  TextEditingController upliftPreminumDay = TextEditingController();
  TextEditingController upliftPreminumNight = TextEditingController();
  TextEditingController upliftPreminumEWE = TextEditingController();
  TextEditingController upliftPreminumSc = TextEditingController();

  TextEditingController affiliateUpliftDay = TextEditingController();
  TextEditingController affiliateUpliftNight = TextEditingController();
  TextEditingController affiliateUpliftEWE = TextEditingController();
  TextEditingController affiliateUpliftSc = TextEditingController();


  TextEditingController finalPriceDay = TextEditingController();
  TextEditingController finalPriceNight = TextEditingController();
  TextEditingController finalPriceEWE = TextEditingController();
  TextEditingController finalPriceSc = TextEditingController();


  GroupQuotationPriceElectricityGasModel GroupPriceElectricityGasModel;
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  String startDate = '';
  String endDate = '';
  String finalBase = '0';
  String finalSc = '0';
  double gasStandingVar;

  void initializeData(RequestQuoteViewButtonModel requestQuote, String termType,
      List<EachyYearList> groupDetailslst ,int index , String type ) async {
    setState(ViewState.BUSY);
    startDate = requestQuote.contractstartdate.toString();
    GroupPriceElectricityGasModel =
    await Prefs.getGroupQuotationGasElectricityDetails();

   if(type == 'MPAN'){
     commonuplift.text = GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     requiredUpliftDay.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     requiredUpliftNight.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     requiredUpliftEWE.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     requiredUpliftSc.text = GroupPriceElectricityGasModel?.elecCommonSc ?? '';

     upliftPreminumDay.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     upliftPreminumNight.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     upliftPreminumEWE.text =
         GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
     upliftPreminumSc.text = GroupPriceElectricityGasModel?.elecCommonSc ?? '';
   }
   else{
     commonuplift.text = GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     requiredUpliftDay.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     requiredUpliftNight.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     requiredUpliftEWE.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     requiredUpliftSc.text = GroupPriceElectricityGasModel?.gasCommonSc ?? '';

     upliftPreminumDay.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     upliftPreminumNight.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     upliftPreminumEWE.text =
         GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
     upliftPreminumSc.text = GroupPriceElectricityGasModel?.gasCommonSc ?? '';
   }

    finalPriceDay.text = (double.parse(requiredUpliftDay.text) + double.parse(groupDetailslst[index].baserateday)).toString();
    finalPriceNight.text = (double.parse(requiredUpliftNight.text) + double.parse(groupDetailslst[index].baseratenight)).toString();
   finalPriceEWE.text = (double.parse(requiredUpliftEWE.text) + double.parse(groupDetailslst[index].baserateEwe == '' ? '0' : groupDetailslst[index].baserateEwe)).toString();
    finalPriceSc.text = (double.parse(requiredUpliftSc.text) + double.parse(groupDetailslst[index].baserateSC)).toString();

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

// void onSaved(
//   String accountID,
//   String quoteID,
//   RequestQuoteViewButtonModel requestQuote,
//   String termType,
//   BuildContext context) async {
// setState(ViewState.BUSY);
// User _user = await Prefs.getUser();
//
// //if (priceElectricityGasModel.subUserID != null) {
// SaveButtonResponse response = await database.saveRequestQuoteIndividual(
//     SaveButtonCredentials(
//         accountID: _user.accountId,
//         quoteID: quoteID,
//         nextPreferredStartDate: requestQuote.nextPreferredStartDate,
//         intAffiliateSubUserId: priceElectricityGasModel.subUserID,
//         termType: termType,
//         requiredUpliftGas1Y: requiredBaseUniteChargeController.text ?? '',
//         requiredUpliftGasSC1Y: requiredStandingChargeController.text ?? '',
//         affiliateUpliftGas1Y: affiliateBaseUniteChargeController.text ?? '',
//         affiliateUpliftGasSC1Y:
//         affiliateStandingChargeController.text ?? ''));
// setState(ViewState.IDLE);
// if (response.status == '1' || response.status == '2') {
//   AppConstant.showSuccessToast(context, response.msg);
// } else {
//   AppConstant.showFailToast(context, response.msg);
// }
// // }
//}

//void generateIndividualContractView(
//   String accountID,
//   String quoteID,
//   RequestQuoteViewButtonModel requestQuote,
//   String termType,
//   BuildContext context) async {
// // if (priceElectricityGasModel.subUserID != null) {
// setState(ViewState.BUSY);
// User _user = await Prefs.getUser();
// print('User Id ' + '${_user.accountId}');
// print('Quote Id ' + '$quoteID');
// print('Preferred Start Date ' +
//     '${requestQuote.nextPreferredStartDate ?? ''}');
// print('Sub user Id ${priceElectricityGasModel?.subUserID ?? ''}');
// print('Term type $termType');
// print('Int CompanyID ${requestQuote.intCompanyId.toString()}');
// print('Required 1 Y ${requiredBaseUniteChargeController.text ?? ''}');
// print('Required SC 1 Y ${requiredStandingChargeController.text ?? ''}');
// print('Affiliate 1 Y ${affiliateBaseUniteChargeController.text ?? ''}');
// print('Affiliate SC 1 Y ${affiliateStandingChargeController.text ?? ''}');
//
// final response = await database
//     .generateIndividualContractService(GenerateIndividualContractCredential(
//   accountId: _user.accountId,
//   quoteId: quoteID,
//   nextPreferredStartDate: requestQuote.nextPreferredStartDate ?? '',
//   intsubuserID: priceElectricityGasModel?.subUserID ?? '',
//   termType: termType,
//   // intCompanyId: requestQuote.intCompanyId.toString(),
//   intCompanyId: '1',
//   requiredUpliftGas1Y: requiredBaseUniteChargeController.text ?? '',
//   requiredUpliftGasSC1Y: requiredStandingChargeController.text ?? '',
//   affiliateUpliftGas1Y: affiliateBaseUniteChargeController.text ?? '',
//   affiliateUpliftGasSC1Y: affiliateStandingChargeController.text ?? '',
//   requiredUpliftEle1Y: '',
//   requiredUpliftEleNight1Y: '',
//   requiredUpliftEleEWE1Y: '',
//   requiredUpliftEleSC1Y: '',
//   affiliateUpliftEle1Y: '',
//   affiliateUpliftEleNight1Y: '',
//   affiliateUpliftEleSC1Y: '',
//   affiliateUpliftEleEWE1Y: '',
//   baserateDayUnit1: '',
//   baserateNightUnit1: '',
// ));
// setState(ViewState.IDLE);
// if (response.status == '1') {
//   AppConstant.showSuccessToast(context, response.msg);
//   Navigator.of(context).push(
//     new MaterialPageRoute(
//       builder: (context) => GenerateContractIndividual(
//         quoteID: quoteID,
//         customerId: response.customerId.toString(),
//       ),
//     ),
//   );
// } else {
//   AppConstant.showFailToast(context, response.msg);
// }
// // // } else {
// // //   globals.tabController3.animateTo(3);
// // // }
// }

//void onClickTenderPrice(bool export, String accountID, String quoteID,
//     BuildContext context) async {
//   User _user = await Prefs.getUser();
//   setState(ViewState.BUSY);
//   SendEmailTenderResponse response = await database.sendEmailTenderIndividual(
//       SendTenderPriceCredentials(
//           accountId: _user.accountId,
//           quoteid: quoteID,
//           emailType: export ? 'no' : 'yes',
//           termType: '2'));
//   if (export) {
//     DownloadService.downloadFromUrl(response.data.exportTenderPricePath);
//   } else {
//     // EmailService.sendEmail(
//     //     _user.emailId, response.data.exportTenderPricePath, _user.firstName);
//     AppConstant.showSuccessToast(context, response.msg);
//   }
//   setState(ViewState.IDLE);
// }
//
// void onAskQuote(
//     String accountID, String quoteID, BuildContext context) async {
//   setState(ViewState.BUSY);
//   User _user = await Prefs.getUser();
//
//   final response = await database.askForReQuote(AskForReQuoteCrential(
//       accountId: _user.accountId, quoteId: quoteID, flagFrom: "Backend"));
//
//   if (response.status == '1') {
//     AppConstant.showSuccessToast(context, response.msg);
//   } else {
//     AppConstant.showFailToast(context, response.msg);
//   }
//   print(response.toJson());
//   setState(ViewState.IDLE);
// }
//}
}
