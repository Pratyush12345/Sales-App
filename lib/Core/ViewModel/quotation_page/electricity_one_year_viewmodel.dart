import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/Api/ask_for_requote_credential.dart';
import 'package:pozitive/Core/Model/Api/generateIndividualContractCredential.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/save_button_credentials.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/sendTenderPriceCredentials.dart';
import 'package:pozitive/Core/Model/ApiResponse/send_email_tender_response.dart';
import 'package:pozitive/Core/Model/request_quote_viewbutton_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_gas_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import '../../baseview.dart';
import 'package:pozitive/Pages/Quotation/GenerateContract/generateContractIndividual.dart';

class ElectricityOneYearViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController dayController = TextEditingController();
  TextEditingController nightController = TextEditingController();
  TextEditingController eweController = TextEditingController();
  TextEditingController scController = TextEditingController();
  TextEditingController requiredUpLiftDayController = TextEditingController();
  TextEditingController requiredUpLiftNightController = TextEditingController();
  TextEditingController requiredUpLiftEweController = TextEditingController();
  TextEditingController requiredUpLiftScController = TextEditingController();
  TextEditingController finalUpLiftDayController = TextEditingController();
  TextEditingController finalUpLiftNightController = TextEditingController();
  TextEditingController finalUpLiftEweController = TextEditingController();
  TextEditingController finalUpLiftScController = TextEditingController();
  TextEditingController affiliateUpLiftDayController = TextEditingController();
  TextEditingController affiliateUpLiftNightController =
      TextEditingController();
  TextEditingController affiliateUpLiftEweController = TextEditingController();
  TextEditingController affiliateUpLiftScController = TextEditingController();

  TextEditingController supplyCapacityController = TextEditingController();
  TextEditingController emrCFDController = TextEditingController();
  TextEditingController excessCapacityController = TextEditingController();
  TextEditingController reactiveController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateRFormat = DateFormat("dd/MM/yyyy hh:mm");
  String startDate = '';
  String endDate = '';
  QuotationElectricityModel electricityModel;
  QuotationGasModel gasModel;
  QuotationIndividualModel individualModel;
  QuotationPriceElectricityGasModel priceElectricityGasModel;
  String finalDay = '0';
  String finalNight = '0';
  String finalSc = '0';
  String finalEwe = '0';

  double eleStandingVar;

  void initializeData(
      RequestQuoteViewButtonModel requestQuote, String termType) async {
    setState(ViewState.BUSY);
    electricityModel = await Prefs.getQuotationElectricityDetails();
    gasModel = await Prefs.getQuotationGasDetails();
    individualModel = await Prefs.getQuotationInvidualDetails();
    priceElectricityGasModel = await Prefs.getQuotationGasElectricityDetails();

    if (termType == '3') {
      if (priceElectricityGasModel.gasUplift != null) {
        eleStandingVar =
            double.tryParse(priceElectricityGasModel.electricityUplift);
      }
      dayController.text = requestQuote.baserateDayUnit3 ?? '';
      nightController.text = requestQuote.baserateNightUnit3 ?? '';
      eweController.text = requestQuote.baserateEWEUnit3 ?? '';
      scController.text = requestQuote.baserateStandingCharge3 ?? '';
      supplyCapacityController.text = requestQuote.supplyCapacity3 ?? '';
      emrCFDController.text = requestQuote.eMRCFD3 ?? '';
      excessCapacityController.text = requestQuote.exceesCapacityCharegs3 ?? '';
      reactiveController.text = requestQuote.reactiveCharegs3 ?? '';
      requiredUpLiftDayController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftNightController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftScController.text =
          priceElectricityGasModel.electricityScUplift ?? '';
      affiliateUpLiftDayController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftNightController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftScController.text =
          priceElectricityGasModel.eAScUplift ?? '';
      finalDay = priceElectricityGasModel.electricityUplift ?? '0';
      finalNight = priceElectricityGasModel.electricityUplift ?? '0';
      // finalEwe = priceElectricityGasModel.electricityUplift ?? '0';
      finalSc = priceElectricityGasModel.electricityScUplift ?? '0';
    } else if (termType == '4') {
      if (priceElectricityGasModel.gasUplift != null) {
        eleStandingVar =
            double.tryParse(priceElectricityGasModel.electricityUplift);
      }
      dayController.text = requestQuote.baserateDayUnit4 ?? '';
      nightController.text = requestQuote.baserateNightUnit4 ?? '';
      eweController.text = requestQuote.baserateEWEUnit4 ?? '';
      scController.text = requestQuote.baserateStandingCharge4 ?? '';
      supplyCapacityController.text = requestQuote.supplyCapacity4 ?? '';
      emrCFDController.text = requestQuote.eMRCFD4 ?? '';
      excessCapacityController.text = requestQuote.exceesCapacityCharegs4 ?? '';
      reactiveController.text = requestQuote.reactiveCharegs4 ?? '';
      requiredUpLiftDayController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftNightController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftScController.text =
          priceElectricityGasModel.electricityScUplift ?? '';
      affiliateUpLiftDayController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftNightController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftScController.text =
          priceElectricityGasModel.eAScUplift ?? '';
      finalDay = priceElectricityGasModel.electricityUplift ?? '0';
      finalNight = priceElectricityGasModel.electricityUplift ?? '0';
      finalSc = priceElectricityGasModel.electricityScUplift ?? '0';
      //  finalEwe = priceElectricityGasModel.electricityUplift ?? '0';
    } else if (termType == '5') {
      if (priceElectricityGasModel.gasUplift != null) {
        eleStandingVar =
            double.tryParse(priceElectricityGasModel.electricityUplift);
      }
      dayController.text = requestQuote.baserateDayUnit5 ?? '';
      nightController.text = requestQuote.baserateNightUnit5 ?? '';
      eweController.text = requestQuote.baserateEWEUnit5 ?? '';
      scController.text = requestQuote.baserateStandingCharge5 ?? '';
      supplyCapacityController.text = requestQuote.supplyCapacity5 ?? '';
      emrCFDController.text = requestQuote.eMRCFD5 ?? '';
      excessCapacityController.text = requestQuote.exceesCapacityCharegs5 ?? '';
      reactiveController.text = requestQuote.reactiveCharegs5 ?? '';
      requiredUpLiftDayController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftNightController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftScController.text =
          priceElectricityGasModel.electricityScUplift ?? '';
      affiliateUpLiftDayController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftNightController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftScController.text =
          priceElectricityGasModel.eAScUplift ?? '';
      finalDay = priceElectricityGasModel.electricityUplift ?? '0';
      finalNight = priceElectricityGasModel.electricityUplift ?? '0';
      finalSc = priceElectricityGasModel.electricityScUplift ?? '0';
      //finalEwe = priceElectricityGasModel.electricityUplift ?? '0';
    } else if (termType == '2') {
      if (priceElectricityGasModel.gasUplift != null) {
        eleStandingVar =
            double.tryParse(priceElectricityGasModel.electricityUplift);
      }
      dayController.text = requestQuote.baserateDayUnit2 ?? '';
      nightController.text = requestQuote.baserateNightUnit2 ?? '';
      eweController.text = requestQuote.baserateEWEUnit2 ?? '';
      scController.text = requestQuote.baserateStandingCharge2 ?? '';
      supplyCapacityController.text = requestQuote.supplyCapacity2 ?? '';
      emrCFDController.text = requestQuote.eMRCFD2 ?? '';
      excessCapacityController.text = requestQuote.exceesCapacityCharegs2 ?? '';
      reactiveController.text = requestQuote.reactiveCharegs2 ?? '';
      requiredUpLiftDayController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftNightController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftScController.text =
          priceElectricityGasModel.electricityScUplift ?? '';
      affiliateUpLiftDayController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftNightController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftScController.text =
          priceElectricityGasModel.eAScUplift ?? '';
      finalDay = priceElectricityGasModel.electricityUplift ?? '0';
      finalSc = priceElectricityGasModel.electricityScUplift ?? '0';
      finalNight = priceElectricityGasModel.electricityUplift ?? '0';
      //finalEwe = priceElectricityGasModel.electricityUplift ?? '0';
    } else if (termType == '1') {
      if (priceElectricityGasModel.gasUplift != null) {
        eleStandingVar =
            double.tryParse(priceElectricityGasModel.electricityUplift);
      }

      dayController.text = requestQuote.baserateDayUnit1 ?? '';
      nightController.text = requestQuote.baserateNightUnit1 ?? '';
      eweController.text = requestQuote.baserateEWEUnit1 ?? '';
      scController.text = requestQuote.baserateStandingCharge1 ?? '';
      supplyCapacityController.text = requestQuote.supplyCapacity1 ?? '';
      emrCFDController.text = requestQuote.eMRCFD1 ?? '';
      excessCapacityController.text = requestQuote.exceesCapacityCharegs1 ?? '';
      reactiveController.text = requestQuote.reactiveCharegs1 ?? '';
      requiredUpLiftDayController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftNightController.text =
          priceElectricityGasModel.electricityUplift ?? '';
      requiredUpLiftScController.text =
          priceElectricityGasModel.electricityScUplift ?? '';
      affiliateUpLiftDayController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftNightController.text =
          priceElectricityGasModel.eAUplift ?? '';
      affiliateUpLiftScController.text =
          priceElectricityGasModel.eAScUplift ?? '';
      finalDay = priceElectricityGasModel?.electricityUplift ?? '0';
      finalNight = priceElectricityGasModel.electricityUplift ?? '0';
      finalSc = priceElectricityGasModel.electricityScUplift ?? '0';
      //finalEwe = priceElectricityGasModel.electricityUplift ?? '0';
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

  Future savePartnerPriceUpLift(
      String accountID,
      String quoteID,
      RequestQuoteViewButtonModel requestQuote,
      String termType,
      BuildContext context,
      bool backBool) async {
    setState(ViewState.BUSY);

    User _user = await Prefs.getUser();

    if (priceElectricityGasModel.subUserID != null) {
      final response = await database.saveRequestQuoteIndividual(
          SaveButtonCredentials(
              accountID: _user.accountId,
              quoteID: quoteID,
              nextPreferredStartDate: requestQuote.preferredStartDate,
              intAffiliateSubUserId: priceElectricityGasModel.subUserID,
              termType: termType,
              requiredUpliftEle1Y: requiredUpLiftDayController.text,
              baserateNightUnit1: nightController.text /*"11.0400"*/,
              requiredUpliftEleNight1Y:
                  requiredUpLiftNightController.text /*"1.5000"*/,
              affiliateUpliftEleNight1Y:
                  affiliateUpLiftNightController.text /*"1.2000"*/,
              requiredUpliftEleSC1Y:
                  requiredUpLiftScController.text /*"20.0000"*/,
              affiliateUpliftEleSC1Y:
                  affiliateUpLiftScController.text /*"20.0000"*/,
              requiredUpliftEleEWE1Y: "",
              affiliateUpliftEle1Y: requestQuote.affiliateUpliftEleSC1Y ?? "",
              affiliateUpliftEleEWE1Y: "",
              baserateDayUnit1: requestQuote.baserateDayUnit1 ?? '',
              requiredUpliftGasSC1Y: requestQuote.requiredUpliftEleSC1Y ?? '',
              affiliateUpliftGas1Y: requestQuote.affiliateUpliftEle1Y ?? '',
              affiliateUpliftGasSC1Y:
                  requestQuote.affiliateUpliftGasSC1Y ?? ''));
      setState(ViewState.IDLE);
      if (response.status == '1' || response.status == '2') {
        AppConstant.showSuccessToast(context, response.msg);
      } else {
        AppConstant.showFailToast(context, response.msg);
      }
    } else {}
  }

  void generateIndividualContractView(
      String termType,
      String accountID,
      String quoteID,
      RequestQuoteViewButtonModel requestQuote,
      BuildContext context,
      String baseRateDay,
      String baseRateNight) async {
    // if (priceElectricityGasModel.subUserID != null) {
    User _user = await Prefs.getUser();
    setState(ViewState.BUSY);
    print('User Id ' + '${_user.accountId}');
    print('Quote Id ' + '$quoteID');
    print('Preferred Start Date ' +
        '${requestQuote.nextPreferredStartDate ?? ''}');
    print('Sub user Id ${priceElectricityGasModel?.subUserID ?? ''}');
    print('Term type $termType');
    print('Int CompanyID ${requestQuote.intCompanyId.toString()}');
    print('Required uplift Ele 1Y : ${requiredUpLiftDayController.text}');
    print(
        'Required uplift Ele night 1Y : ${requiredUpLiftNightController.text}');
    print('Required uplift Ele SC 1Y : ${requiredUpLiftScController.text}');
    print(
        'Required affiliate Ele day 1Y : ${affiliateUpLiftDayController.text}');
    print(
        'Required affiliate Ele night 1Y : ${affiliateUpLiftNightController.text}');
    print('Required affiliate uplift Sc : ${affiliateUpLiftScController.text}');
    print('Base Rate Day : $baseRateDay');
    print('Base Rate Night : $baseRateNight');

    final response = await database.generateIndividualContractService(
        GenerateIndividualContractCredential(
            accountId: _user.accountId,
            quoteId: quoteID,
            nextPreferredStartDate: requestQuote.nextPreferredStartDate,
            intsubuserID: priceElectricityGasModel?.subUserID ?? '',
            termType: termType.toString(),
            intCompanyId: requestQuote.intCompanyId.toString(),
            //intCompanyId: '1',
            requiredUpliftEle1Y: requiredUpLiftDayController.text ?? '',
            requiredUpliftEleNight1Y: requiredUpLiftNightController.text ?? '',
            requiredUpliftEleEWE1Y: "",
            requiredUpliftEleSC1Y: requiredUpLiftScController.text ?? '',
            affiliateUpliftEle1Y: affiliateUpLiftDayController.text ?? '',
            affiliateUpliftEleNight1Y:
                affiliateUpLiftNightController.text ?? '',
            affiliateUpliftEleSC1Y: affiliateUpLiftScController.text ?? '',
            affiliateUpliftEleEWE1Y: "",
            baserateDayUnit1: baseRateDay ?? '',
            baserateNightUnit1: baseRateNight ?? '',
            requiredUpliftGasSC1Y: '',
            requiredUpliftGas1Y: '',
            affiliateUpliftGas1Y: '',
            affiliateUpliftGasSC1Y: ''));
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
    print(
      requestQuote.customerId.toString() + 'ele uniqueid..........',
    );
  }

  void onClickTenderPrice(bool export, String accountID, String quoteID,
      BuildContext context) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    SendEmailTenderResponse response = await database.sendEmailTenderIndividual(
        SendTenderPriceCredentials(
            accountId: _user.accountId,
            quoteid: quoteID,
            emailType: export ? 'no' : 'yes',
            termType: '3'));
    if (export) {
      DownloadService.downloadFromUrl(response.data.exportTenderPricePath);
    } else {
      AppConstant.showSuccessToast(context, response.msg);
    }
    setState(ViewState.IDLE);
  }

  void askForReQuoteView(
      String accountID, String quoteID, BuildContext context) async {
    User _user = await Prefs.getUser();
    setState(ViewState.BUSY);
    final response = await database.askForReQuote(AskForReQuoteCrential(
        accountId: _user.accountId, quoteId: quoteID, flagFrom: "Backend"));
    setState(ViewState.IDLE);
    if (response.status == '1') {
      AppConstant.showSuccessToast(context, response.msg);
    } else {
      AppConstant.showFailToast(context, response.msg);
    }
    print(response.toJson());
  }
}
