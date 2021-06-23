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
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/view_group_details_viewmodel.dart';

import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Pages/Group-Quotation/Tab/Price_1_Year/Price(1_Year)_Electricity.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:pozitive/Pages/Quotation/GenerateContract/generateContractIndividual.dart';
import 'package:pozitive/Core/Services/DownloadService.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:file_utils/file_utils.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

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

TextEditingController requiredUpliftDayGas = TextEditingController();
TextEditingController requiredUpliftScGas = TextEditingController();

TextEditingController upliftPreminumDayGas = TextEditingController();
TextEditingController upliftPreminumScGas = TextEditingController();
//GetIt getIt = GetIt.instance;
int prevIndex = null;
Map<int, GenerateQuoteIds> tempMap;
List<EachyYearList> tempList = [];
List<GenerateQuoteIds> quoteIdspricecollection = [];

class finalQuotationpPriceModel extends BaseModel {
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
      List<EachyYearList> groupDetailslst, int index, String type) async {
    setState(ViewState.BUSY);
    startDate = requestQuote.contractstartdate.toString();
    GroupPriceElectricityGasModel =
        await Prefs.getGroupQuotationGasElectricityDetails();
    if (termType == '1') {
      tempList = oneYear;
    } else if (termType == '2') {
      tempList = twoYear;
    } else if (termType == '3') {
      tempList = threeYear;
    } else if (termType == '4') {
      tempList = fourYear;
    } else if (termType == '5') {
      tempList = fiveYear;
    } else if (termType == '0') {
      tempList = otherYear;
    }
    // print(requiredUpliftDay.text);
    // print(prevIndex);
    if (prevIndex != null) {
      print(requiredUpliftDay.text);
      // tempList[prevIndex].requiredUpliftDay = requiredUpliftDay.text;
      // if (tempMap[prevIndex] != null) {
      //   tempMap.update(
      //       prevIndex,
      //       (value) => GenerateQuoteIds(
      //           QuteId: oneYear[index].QuoteId,
      //           IntSubUserId: 0,
      //           decupliftEle: requiredUpliftDay.text ?? "0",
      //           decupliftEleNight: requiredUpliftNight.text ?? "0",
      //           decupliftEleSC: requiredUpliftSc.text ?? "0",
      //           decupliftGasSC: requiredUpliftSc.text ?? "0",
      //           decupliftGas: requiredUpliftDay.text ?? "0",
      //           decupliftEle_UPP: upliftPreminumDay.text ?? "0",
      //           decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
      //           decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
      //           decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
      //           decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
      //           decupliftGas_UPP: upliftPreminumDay.text ?? "0",
      //           decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
      //           decupliftEleEWE_Sub: "0.0000",
      //           decupliftEleNight_Sub: "0.0000",
      //           decupliftEleSC_Sub: "0.0000",
      //           decupliftGasSC_Sub: "0.0000",
      //           decupliftGas_Sub: "0.0000",
      //           intTermType: oneYear[index].tremtype,
      //           decChargeDay: oneYear[index].baserateday,
      //           decChargeNight: oneYear[index].baseratenight,
      //           decChargeEWE: oneYear[index].baserateEwe,
      //           decSCPrice: oneYear[index].baserateSC,
      //           decUnitPriceGas: "0.0000",
      //           decSCPriceGas: "0.0000"));
      // } else {
      //   tempMap.putIfAbsent(
      //       prevIndex,
      //       () => GenerateQuoteIds(
      //           QuteId: oneYear[index].QuoteId,
      //           IntSubUserId: 0,
      //           decupliftEle: requiredUpliftDay.text ?? "0",
      //           decupliftEleNight: requiredUpliftNight.text ?? "0",
      //           decupliftEleSC: requiredUpliftSc.text ?? "0",
      //           decupliftGasSC: requiredUpliftSc.text ?? "0",
      //           decupliftGas: requiredUpliftDay.text ?? "0",
      //           decupliftEle_UPP: upliftPreminumDay.text ?? "0",
      //           decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
      //           decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
      //           decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
      //           decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
      //           decupliftGas_UPP: upliftPreminumDay.text ?? "0",
      //           decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
      //           decupliftEleEWE_Sub: "0.0000",
      //           decupliftEleNight_Sub: "0.0000",
      //           decupliftEleSC_Sub: "0.0000",
      //           decupliftGasSC_Sub: "0.0000",
      //           decupliftGas_Sub: "0.0000",
      //           intTermType: oneYear[index].tremtype,
      //           decChargeDay: oneYear[index].baserateday,
      //           decChargeNight: oneYear[index].baseratenight,
      //           decChargeEWE: oneYear[index].baserateEwe,
      //           decSCPrice: oneYear[index].baserateSC,
      //           decUnitPriceGas: "0.0000",
      //           decSCPriceGas: "0.0000"));
      //   // m = {
      //   //   prevIndex :
      //   // };
      // }

      prevIndex = index;
    } else {
      prevIndex = index;
    }

    print(tempList[index].requiredUpliftDay);
    requiredUpliftDayGas.text = tempList[index].requiredUpliftDayGas;
    requiredUpliftScGas.text = tempList[index].requiredUpliftScGas;
    upliftPreminumDayGas.text = tempList[index].upliftPreminumDayGas;
    upliftPreminumScGas.text = tempList[index].upliftPreminumScGas;

    requiredUpliftDay.text = tempList[index].requiredUpliftDay;
    requiredUpliftNight.text = tempList[index].requiredUpliftNight;
    requiredUpliftEWE.text = tempList[index].requiredUpliftEWE;
    requiredUpliftSc.text = tempList[index].requiredUpliftSc;

    upliftPreminumDay.text = tempList[index].upliftPreminumDay;
    upliftPreminumNight.text = tempList[index].upliftPreminumNight;
    upliftPreminumEWE.text = tempList[index].upliftPreminumEWE;
    upliftPreminumSc.text = tempList[index].upliftPreminumSc;

    affiliateUpliftDay.text = tempList[index].affiliateUpliftDay;
    affiliateUpliftNight.text = tempList[index].affiliateUpliftNight;
    affiliateUpliftEWE.text = tempList[index].affiliateUpliftEWE;
    affiliateUpliftSc.text = tempList[index].affiliateUpliftSc;
    //
    if (type == "MPAN") {
      finalPriceDay.text = (double.parse(
                  requiredUpliftDay.text == "" ? "0" : requiredUpliftDay.text) +
              double.parse(
                  upliftPreminumDay.text == "" ? "0" : upliftPreminumDay.text) +
              double.parse(groupDetailslst[index].baserateday == ""
                  ? "0"
                  : groupDetailslst[index].baserateday))
          .toString();
      finalPriceNight.text = (double.parse(requiredUpliftNight.text == ""
                  ? "0"
                  : requiredUpliftNight.text) +
              double.parse(upliftPreminumNight.text == ""
                  ? "0"
                  : upliftPreminumNight.text) +
              double.parse(groupDetailslst[index].baseratenight == ''
                  ? "0"
                  : groupDetailslst[index].baseratenight))
          .toString();
      finalPriceEWE.text = (double.parse(
                  requiredUpliftEWE.text == "" ? "0" : requiredUpliftEWE.text) +
              double.parse(
                  upliftPreminumEWE.text == "" ? "0" : upliftPreminumEWE.text) +
              double.parse(groupDetailslst[index].baserateEwe == ''
                  ? '0'
                  : groupDetailslst[index].baserateEwe))
          .toString();
      finalPriceSc.text = (double.parse(
                  requiredUpliftSc.text == "" ? "0" : requiredUpliftSc.text) +
              double.parse(
                  upliftPreminumSc.text == "" ? "0" : upliftPreminumSc.text) +
              double.parse(groupDetailslst[index].baserateSC == ""
                  ? "0"
                  : groupDetailslst[index].baserateSC))
          .toString();
    } else {
      finalPriceDay.text = (double.parse(requiredUpliftDayGas.text == ""
                  ? "0"
                  : requiredUpliftDayGas.text) +
              double.parse(upliftPreminumDayGas.text == ""
                  ? "0"
                  : upliftPreminumDayGas.text) +
              double.parse(groupDetailslst[index].baserateday == ""
                  ? '0'
                  : groupDetailslst[index].baserateday))
          .toString();

      finalPriceSc.text = (double.parse(requiredUpliftScGas.text == ""
                  ? "0"
                  : requiredUpliftScGas.text) +
              double.parse(upliftPreminumScGas.text == ""
                  ? "0"
                  : upliftPreminumScGas.text) +
              double.parse(groupDetailslst[index].baserateSC == ""
                  ? "0"
                  : groupDetailslst[index].baserateSC))
          .toString();
    }
    // if (tempList[index].visited == false) {
    //   if (type == 'MPAN') {
    //
    //     commonuplift.text = GroupPriceElectricityGasModel?.elecCommonUnit ?? '';
    //     requiredUpliftDay.text = tempList[index].requiredUpliftDay;
    //     requiredUpliftNight.text =
    //         tempList[index].requiredUpliftNight;
    //     requiredUpliftEWE.text =
    //         tempList[index].requiredUpliftEWE;
    //     requiredUpliftSc.text =
    //         tempList[index].requiredUpliftSc;
    //
    //     if (double.parse(requiredUpliftDay.text) >= 0 &&
    //         double.parse(requiredUpliftDay.text) <= 1.5) {
    //       upliftPreminumDay.text = "0";
    //     } else if (double.parse(requiredUpliftDay.text) > 1.5 &&
    //         double.parse(requiredUpliftDay.text) <= 2) {
    //       upliftPreminumDay.text = "0.1";
    //     } else if (double.parse(requiredUpliftDay.text) > 2 &&
    //         double.parse(requiredUpliftDay.text) <= 2.5) {
    //       upliftPreminumDay.text = "0.2";
    //     } else {
    //       upliftPreminumDay.text = "0.3";
    //     }
    //
    //     if (double.parse(requiredUpliftNight.text) >= 0 &&
    //         double.parse(requiredUpliftNight.text) <= 1.5) {
    //       upliftPreminumNight.text = "0";
    //     } else if (double.parse(requiredUpliftNight.text) > 1.5 &&
    //         double.parse(requiredUpliftNight.text) <= 2) {
    //       upliftPreminumNight.text = "0.1";
    //     } else if (double.parse(requiredUpliftNight.text) > 2 &&
    //         double.parse(requiredUpliftNight.text) <= 2.5) {
    //       upliftPreminumNight.text = "0.2";
    //     } else {
    //       upliftPreminumNight.text = "0.3";
    //     }
    //
    //     if (double.parse(requiredUpliftEWE.text) >= 0 &&
    //         double.parse(requiredUpliftEWE.text) <= 1.5) {
    //       upliftPreminumEWE.text = "0";
    //     } else if (double.parse(requiredUpliftEWE.text) > 1.5 &&
    //         double.parse(requiredUpliftEWE.text) <= 2) {
    //       upliftPreminumEWE.text = "0.1";
    //     } else if (double.parse(requiredUpliftEWE.text) > 2 &&
    //         double.parse(requiredUpliftEWE.text) <= 2.5) {
    //       upliftPreminumEWE.text = "0.2";
    //     } else {
    //       upliftPreminumEWE.text = "0.3";
    //     }
    //
    //     if (double.parse(requiredUpliftSc.text) == 0) {
    //       upliftPreminumSc.text = "0";
    //     } else if (double.parse(requiredUpliftSc.text) > 0 &&
    //         double.parse(requiredUpliftSc.text) <= 10) {
    //       upliftPreminumSc.text = "1";
    //     } else if (double.parse(requiredUpliftSc.text) > 10 &&
    //         double.parse(requiredUpliftSc.text) <= 20) {
    //       upliftPreminumSc.text = "2";
    //     } else if (double.parse(requiredUpliftSc.text) > 20 &&
    //         double.parse(requiredUpliftSc.text) <= 30) {
    //       upliftPreminumSc.text = "3";
    //     } else if (double.parse(requiredUpliftSc.text) > 30 &&
    //         double.parse(requiredUpliftSc.text) <= 40) {
    //       upliftPreminumSc.text = "4";
    //     } else {
    //       upliftPreminumSc.text = "5";
    //     }
    //     finalPriceDay.text = (double.parse(requiredUpliftDay.text) +
    //             double.parse(upliftPreminumDay.text) +
    //             double.parse(groupDetailslst[index].baserateday == ""
    //                 ? "0"
    //                 : groupDetailslst[index].baserateday))
    //         .toString();
    //     finalPriceNight.text = (double.parse(requiredUpliftNight.text) +
    //             double.parse(upliftPreminumNight.text) +
    //             double.parse(groupDetailslst[index].baseratenight == ''
    //                 ? "0"
    //                 : groupDetailslst[index].baseratenight))
    //         .toString();
    //     finalPriceEWE.text = (double.parse(requiredUpliftEWE.text) +
    //             double.parse(upliftPreminumEWE.text) +
    //             double.parse(groupDetailslst[index].baserateEwe == ''
    //                 ? '0'
    //                 : groupDetailslst[index].baserateEwe))
    //         .toString();
    //     finalPriceSc.text = (double.parse(requiredUpliftSc.text) +
    //             double.parse(upliftPreminumSc.text) +
    //             double.parse(groupDetailslst[index].baserateSC == ""
    //                 ? "0"
    //                 : groupDetailslst[index].baserateSC))
    //         .toString();
    //   } else {
    //     commonuplift.text = GroupPriceElectricityGasModel?.gasCommonUnit ?? '';
    //     requiredUpliftDay.text =tempList[index].requiredUpliftDay;
    //     requiredUpliftSc.text = tempList[index].requiredUpliftSc;
    //
    //     if (double.parse(requiredUpliftDay.text) >= 0 &&
    //         double.parse(requiredUpliftDay.text) <= 1.5) {
    //       upliftPreminumDay.text = "0";
    //     }
    //
    //     if (double.parse(requiredUpliftSc.text) == 0) {
    //       upliftPreminumSc.text = "0";
    //     } else if (double.parse(requiredUpliftSc.text) > 0 &&
    //         double.parse(requiredUpliftSc.text) <= 10) {
    //       upliftPreminumSc.text = "1";
    //     } else if (double.parse(requiredUpliftSc.text) > 10 &&
    //         double.parse(requiredUpliftSc.text) <= 20) {
    //       upliftPreminumSc.text = "2";
    //     } else if (double.parse(requiredUpliftSc.text) > 20 &&
    //         double.parse(requiredUpliftSc.text) <= 30) {
    //       upliftPreminumSc.text = "3";
    //     } else if (double.parse(requiredUpliftSc.text) > 30 &&
    //         double.parse(requiredUpliftSc.text) <= 40) {
    //       upliftPreminumSc.text = "4";
    //     } else {
    //       upliftPreminumSc.text = "5";
    //     }
    //
    //     if (groupDetailslst[index].baserateday == "") {
    //       groupDetailslst[index].baserateday = "0";
    //     }
    //     if (groupDetailslst[index].baserateSC == "") {
    //       groupDetailslst[index].baserateSC = "0";
    //     }
    //     print(groupDetailslst[index].baserateday);
    //     finalPriceDay.text = (double.parse(requiredUpliftDay.text) +
    //             double.parse(upliftPreminumDay.text) +
    //             double.parse(groupDetailslst[index].baserateday == ""
    //                 ? '0'
    //                 : groupDetailslst[index].baserateday))
    //         .toString();
    //
    //     finalPriceSc.text = (double.parse(requiredUpliftSc.text) +
    //             double.parse(upliftPreminumSc.text) +
    //             double.parse(groupDetailslst[index].baserateSC == ""
    //                 ? "0"
    //                 : groupDetailslst[index].baserateSC))
    //         .toString();
    //   }
    //
    //
    //
    //   tempList[index].visited = true;
    // } else {
    //   requiredUpliftDay.text = tempList[index].requiredUpliftDay;
    //   requiredUpliftNight.text = tempList[index].requiredUpliftNight;
    //   requiredUpliftEWE.text = tempList[index].requiredUpliftEWE;
    //   requiredUpliftSc.text = tempList[index].requiredUpliftSc;
    //
    //   upliftPreminumDay.text = tempList[index].upliftPreminumDay;
    //   upliftPreminumNight.text = tempList[index].upliftPreminumNight;
    //   upliftPreminumEWE.text = tempList[index].upliftPreminumEWE;
    //   upliftPreminumSc.text = tempList[index].upliftPreminumSc;
    //
    //   affiliateUpliftDay.text = tempList[index].affiliateUpliftDay;
    //   affiliateUpliftNight.text = tempList[index].affiliateUpliftNight;
    //   affiliateUpliftEWE.text = tempList[index].affiliateUpliftEWE;
    //   affiliateUpliftSc.text = tempList[index].affiliateUpliftSc;
    // }
    // print(m[index].decupliftEle);
    if (termType == '1') {
      oneYear = tempList;
    } else if (termType == '2') {
      twoYear = tempList;
    } else if (termType == '3') {
      threeYear = tempList;
    } else if (termType == '4') {
      fourYear = tempList;
    } else if (termType == '5') {
      fiveYear = tempList;
    } else if (termType == '0') {
      otherYear = tempList;
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

  Future<dynamic> GenerateSite({String termType, String visGroupName}) async {
    setState(ViewState.BUSY);
    //print(m[0].decupliftEle);
    // if(prevIndex == null){
    //   prevIndex=in
    // }
    // print(prevIndex);
    // if (tempMap != null) {
    //   if (tempMap[prevIndex] != null) {
    //     tempMap.update(
    //         prevIndex,
    //         (value) => GenerateQuoteIds(
    //             QuteId: oneYear[prevIndex].QuoteId,
    //             IntSubUserId: 0,
    //             decupliftEle: requiredUpliftDay.text ?? "0",
    //             decupliftEleNight: requiredUpliftNight.text ?? "0",
    //             decupliftEleSC: requiredUpliftSc.text ?? "0",
    //             decupliftGasSC: requiredUpliftSc.text ?? "0",
    //             decupliftGas: requiredUpliftDay.text ?? "0",
    //             decupliftEle_UPP: upliftPreminumDay.text ?? "0",
    //             decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
    //             decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
    //             decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
    //             decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
    //             decupliftGas_UPP: upliftPreminumDay.text ?? "0",
    //             decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
    //             decupliftEleEWE_Sub: "0.0000",
    //             decupliftEleNight_Sub: "0.0000",
    //             decupliftEleSC_Sub: "0.0000",
    //             decupliftGasSC_Sub: "0.0000",
    //             decupliftGas_Sub: "0.0000",
    //             intTermType: oneYear[prevIndex].tremtype,
    //             decChargeDay: oneYear[prevIndex].baserateday,
    //             decChargeNight: oneYear[prevIndex].baseratenight,
    //             decChargeEWE: oneYear[prevIndex].baserateEwe,
    //             decSCPrice: oneYear[prevIndex].baserateSC,
    //             decUnitPriceGas: "0.0000",
    //             decSCPriceGas: "0.0000"));
    //   } else {
    //     tempMap.addAll({
    //       prevIndex: GenerateQuoteIds(
    //           QuteId: oneYear[prevIndex].QuoteId,
    //           IntSubUserId: 0,
    //           decupliftEle: requiredUpliftDay.text ?? "0",
    //           decupliftEleNight: requiredUpliftNight.text ?? "0",
    //           decupliftEleSC: requiredUpliftSc.text ?? "0",
    //           decupliftGasSC: requiredUpliftSc.text ?? "0",
    //           decupliftGas: requiredUpliftDay.text ?? "0",
    //           decupliftEle_UPP: upliftPreminumDay.text ?? "0",
    //           decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
    //           decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
    //           decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
    //           decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
    //           decupliftGas_UPP: upliftPreminumDay.text ?? "0",
    //           decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
    //           decupliftEleEWE_Sub: "0.0000",
    //           decupliftEleNight_Sub: "0.0000",
    //           decupliftEleSC_Sub: "0.0000",
    //           decupliftGasSC_Sub: "0.0000",
    //           decupliftGas_Sub: "0.0000",
    //           intTermType: oneYear[prevIndex].tremtype,
    //           decChargeDay: oneYear[prevIndex].baserateday,
    //           decChargeNight: oneYear[prevIndex].baseratenight,
    //           decChargeEWE: oneYear[prevIndex].baserateEwe,
    //           decSCPrice: oneYear[prevIndex].baserateSC,
    //           decUnitPriceGas: "0.0000",
    //           decSCPriceGas: "0.0000")
    //     });
    //   }
    // } else {
    //   tempMap = {
    //     prevIndex: GenerateQuoteIds(
    //         QuteId: oneYear[prevIndex].QuoteId,
    //         IntSubUserId: 0,
    //         decupliftEle: requiredUpliftDay.text ?? "0",
    //         decupliftEleNight: requiredUpliftNight.text ?? "0",
    //         decupliftEleSC: requiredUpliftSc.text ?? "0",
    //         decupliftGasSC: requiredUpliftSc.text ?? "0",
    //         decupliftGas: requiredUpliftDay.text ?? "0",
    //         decupliftEle_UPP: upliftPreminumDay.text ?? "0",
    //         decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
    //         decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
    //         decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
    //         decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
    //         decupliftGas_UPP: upliftPreminumDay.text ?? "0",
    //         decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
    //         decupliftEleEWE_Sub: "0.0000",
    //         decupliftEleNight_Sub: "0.0000",
    //         decupliftEleSC_Sub: "0.0000",
    //         decupliftGasSC_Sub: "0.0000",
    //         decupliftGas_Sub: "0.0000",
    //         intTermType: oneYear[prevIndex].tremtype,
    //         decChargeDay: oneYear[prevIndex].baserateday,
    //         decChargeNight: oneYear[prevIndex].baseratenight,
    //         decChargeEWE: oneYear[prevIndex].baserateEwe,
    //         decSCPrice: oneYear[prevIndex].baserateSC,
    //         decUnitPriceGas: "0.0000",
    //         decSCPriceGas: "0.0000")
    //   };
    //   // m = {
    //   //   prevIndex :
    //   // };
    // }
    // // print(m[prevIndex].decupliftEle);
    List<GenerateQuoteIds> temp = [];
    // for(int i=0;i<m.length;i++){
    //   print(m[i].decupliftEle);
    //   temp.add(m[i]);
    // }
    if (termType == '1') {
      tempList = oneYear;
    } else if (termType == '2') {
      tempList = twoYear;
    } else if (termType == '3') {
      tempList = threeYear;
    } else if (termType == '4') {
      tempList = fourYear;
    } else if (termType == '5') {
      tempList = fiveYear;
    } else if (termType == '0') {
      tempList = otherYear;
    }
    quoteIdspricecollection.clear();
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i].checkItem == true) {
        quoteIdspricecollection.add(GenerateQuoteIds(
            QuteId: tempList[i].QuoteId,
            IntSubUserId: 0,
            decupliftEle: tempList[i].requiredUpliftDay ?? "0",
            decupliftEleNight: tempList[i].requiredUpliftNight ?? "0",
            decupliftEleSC: tempList[i].requiredUpliftSc ?? "0",
            decupliftGasSC: tempList[i].requiredUpliftScGas ?? "0",
            decupliftGas: tempList[i].requiredUpliftDayGas ?? "0",
            decupliftEle_UPP: tempList[i].upliftPreminumDay ?? "0",
            decupliftEleEWE_UPP: tempList[i].upliftPreminumEWE ?? "0",
            decupliftEleNight_UPP: tempList[i].upliftPreminumNight ?? '0',
            decUpliftEleSC_UPP: tempList[i].upliftPreminumSc ?? "0",
            decUpliftGasSC_UPP: tempList[i].upliftPreminumScGas ?? "0",
            decupliftGas_UPP: tempList[i].upliftPreminumDayGas ?? "0",
            decupliftEle_Sub: tempList[i].affiliateUpliftDay ?? "0",
            decupliftEleEWE_Sub: "0.0000",
            decupliftEleNight_Sub: "0.0000",
            decupliftEleSC_Sub: "0.0000",
            decupliftGasSC_Sub: "0.0000",
            decupliftGas_Sub: "0.0000",
            intTermType: tempList[i].tremtype,
            decChargeDay: tempList[i].baserateday,
            decChargeNight: tempList[i].baseratenight,
            decChargeEWE: tempList[i].baserateEwe,
            decSCPrice: tempList[i].baserateSC,
            decUnitPriceGas: "0.0000",
            decSCPriceGas: "0.0000"));
        print(tempList[i].requiredUpliftDay);
      }
    }
    //print(oneYear[prevIndex].visibleGrpName);
    print(tempList[0].intCompId);
    var Dialogmsseg ;
    User _user = await Prefs.getUser();
    if (quoteIdspricecollection.length > 1 && visGroupName == "") {
      var a = jsonEncode({
        "status": "2",
        "msg": "Visibility Group",
      });
      setState(ViewState.IDLE);
      return Dialogmsseg = jsonDecode(a);
    }


    print(visGroupName);
    htp.Response response = await htp.post(
        Uri.parse('https://api.boshposh.com/api/Partner/GenerateContractGroup'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": tempList[0].grpId,
          "VisibilityGroupname": quoteIdspricecollection.length>1 ? visGroupName : "",
          "IntCompanyId": "1",
          "type": "group",
          "lstPriceValues": quoteIdspricecollection,
        }));
    var res = jsonDecode(response.body);
    print(res);
    Dialogmsseg = res;
    if (res['status'] == "1") {
      print(res['data']['lstPriceValues']);
      print(res['data']['PremisesAndPricesContract_Quotewithdata']);
      String pdfurl = "";
      if (res['data']['PremisesAndPricesContract_Quotewithdata'] == null ||
          res['data']['PremisesAndPricesContract_Quotewithdata'] == "") {
        pdfurl =
            "https://boshposh.com/MailTemplates/TemplateContract/Premises_7053.pdf";
      } else {
        pdfurl = res['data']['PremisesAndPricesContract_Quotewithdata'];
      }
     // Dialogmsseg = "Contract Generated Successfully";
      if (await Permission.storage.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        String dirloc = "";
        Dio dio = Dio();
        if (Platform.isAndroid) {
          dirloc = "/sdcard/download/";
        } else {
          dirloc = (await getApplicationDocumentsDirectory()).path;
        }

        final taskId = await FlutterDownloader.enqueue(
          url: pdfurl,
          savedDir: dirloc,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        String progress;
        // try {
        //   FileUtils.mkdir([dirloc]);
        //   await dio.download(pdfurl, dirloc + "Premises_6977.pdf",
        //       onReceiveProgress: (receivedBytes, totalBytes) {
        //         progress =
        //             ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
        //         print(progress);
        //       });
        //
        //     Dialogmsseg =
        //     "Generate Site Successfully\n"+"File Successfully Downloaded.";
        // } catch (e) {
        //   print(e);
        //   //Dialogmsseg = e.toString();
        // }
      }
    }
    setState(ViewState.IDLE);
    return Dialogmsseg;
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

// Future <void>RemoveSite({String grpId,BuildContext context,String Year}) async{
//   setState(ViewState.BUSY);
//   // print(oneYear[0].QuoteId);
//   // print(oneYear[0].checkItem);
//   // print(oneYear[1].QuoteId);
//   // print(oneYear[1].checkItem);
//   // print(oneYear[2].QuoteId);
//   // print(oneYear[2].checkItem);
//   List<EachyYearList>TempListEle = [];
//   List<EachyYearList>temp2 = [];
//   if(Year == '1'){
//     TempListEle = oneYear;
//   }
//   else if(Year == '2'){
//     TempListEle = twoYear;
//   }
//   else if(Year == '3'){
//     TempListEle = threeYear;
//   }
//   else if(Year == '4'){
//     TempListEle = fourYear;
//   }
//   List<int> deleids = [];
//   List<CollectionQuoteIds> ids = [];
//   for(int i=0;i<TempListEle.length;i++){
//     if(TempListEle[i].checkItem == true){
//       deleids.add(i);
//       ids.add(
//           CollectionQuoteIds(
//             QuoteId: TempListEle[i].QuoteId,
//           )
//       );
//       //TempListEle.removeAt(i);
//     }
//   }
//   print(ids.length);
//   int j=TempListEle.length;
//   //oneYear.clear();
//   User _user = await Prefs.getUser();
//   for(int i=0;i<j;i++){
//     if(!deleids.contains(i)){
//       temp2.add(TempListEle[i]);
//     }
//     //TempListEle.removeAt(deleids[i]);
//   }
//
//   htp.Response response = await htp.post(
//       Uri.parse(
//           'https://api.boshposh.com/api/Partner/RemoveContractSite'),
//       headers: {"Content-Type": "application/json"},
//       // body: (json1.substring(1, lstLength - 1)),
//       body: json.encode({
//         "AccountId": _user.accountId,
//         "GroupId": grpId ,
//         "type": "group",
//         "lstRemoveSite": ids,
//       })
//   );
//   var res = jsonDecode(response.body);
//   print(response.body);
//   if(res['status'] == '1'){
//     if(Year == '1'){
//       oneYear = temp2;
//     }
//     else if(Year == '2'){
//       twoYear= temp2;
//     }
//     else if(Year == '3'){
//       threeYear=temp2;
//     }
//     else if(Year == '4'){
//       fourYear=temp2;
//     }
//     return setState(ViewState.IDLE);
//   }
//   else{
//     setState(ViewState.IDLE);
//     return AppConstant.showFailToast(
//         context, res['msg'] ?? 'Failed');
//   }
//
//}
Future<dynamic> GenerateSite({String termType, String visGroupName}) async {
  //setState(ViewState.BUSY);
  //print(m[0].decupliftEle);
  // if(prevIndex == null){
  //   prevIndex=in
  // }
  // print(prevIndex);
  // if (tempMap != null) {
  //   if (tempMap[prevIndex] != null) {
  //     tempMap.update(
  //         prevIndex,
  //         (value) => GenerateQuoteIds(
  //             QuteId: oneYear[prevIndex].QuoteId,
  //             IntSubUserId: 0,
  //             decupliftEle: requiredUpliftDay.text ?? "0",
  //             decupliftEleNight: requiredUpliftNight.text ?? "0",
  //             decupliftEleSC: requiredUpliftSc.text ?? "0",
  //             decupliftGasSC: requiredUpliftSc.text ?? "0",
  //             decupliftGas: requiredUpliftDay.text ?? "0",
  //             decupliftEle_UPP: upliftPreminumDay.text ?? "0",
  //             decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
  //             decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
  //             decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
  //             decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
  //             decupliftGas_UPP: upliftPreminumDay.text ?? "0",
  //             decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
  //             decupliftEleEWE_Sub: "0.0000",
  //             decupliftEleNight_Sub: "0.0000",
  //             decupliftEleSC_Sub: "0.0000",
  //             decupliftGasSC_Sub: "0.0000",
  //             decupliftGas_Sub: "0.0000",
  //             intTermType: oneYear[prevIndex].tremtype,
  //             decChargeDay: oneYear[prevIndex].baserateday,
  //             decChargeNight: oneYear[prevIndex].baseratenight,
  //             decChargeEWE: oneYear[prevIndex].baserateEwe,
  //             decSCPrice: oneYear[prevIndex].baserateSC,
  //             decUnitPriceGas: "0.0000",
  //             decSCPriceGas: "0.0000"));
  //   } else {
  //     tempMap.addAll({
  //       prevIndex: GenerateQuoteIds(
  //           QuteId: oneYear[prevIndex].QuoteId,
  //           IntSubUserId: 0,
  //           decupliftEle: requiredUpliftDay.text ?? "0",
  //           decupliftEleNight: requiredUpliftNight.text ?? "0",
  //           decupliftEleSC: requiredUpliftSc.text ?? "0",
  //           decupliftGasSC: requiredUpliftSc.text ?? "0",
  //           decupliftGas: requiredUpliftDay.text ?? "0",
  //           decupliftEle_UPP: upliftPreminumDay.text ?? "0",
  //           decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
  //           decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
  //           decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
  //           decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
  //           decupliftGas_UPP: upliftPreminumDay.text ?? "0",
  //           decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
  //           decupliftEleEWE_Sub: "0.0000",
  //           decupliftEleNight_Sub: "0.0000",
  //           decupliftEleSC_Sub: "0.0000",
  //           decupliftGasSC_Sub: "0.0000",
  //           decupliftGas_Sub: "0.0000",
  //           intTermType: oneYear[prevIndex].tremtype,
  //           decChargeDay: oneYear[prevIndex].baserateday,
  //           decChargeNight: oneYear[prevIndex].baseratenight,
  //           decChargeEWE: oneYear[prevIndex].baserateEwe,
  //           decSCPrice: oneYear[prevIndex].baserateSC,
  //           decUnitPriceGas: "0.0000",
  //           decSCPriceGas: "0.0000")
  //     });
  //   }
  // } else {
  //   tempMap = {
  //     prevIndex: GenerateQuoteIds(
  //         QuteId: oneYear[prevIndex].QuoteId,
  //         IntSubUserId: 0,
  //         decupliftEle: requiredUpliftDay.text ?? "0",
  //         decupliftEleNight: requiredUpliftNight.text ?? "0",
  //         decupliftEleSC: requiredUpliftSc.text ?? "0",
  //         decupliftGasSC: requiredUpliftSc.text ?? "0",
  //         decupliftGas: requiredUpliftDay.text ?? "0",
  //         decupliftEle_UPP: upliftPreminumDay.text ?? "0",
  //         decupliftEleEWE_UPP: upliftPreminumEWE.text ?? "0",
  //         decupliftEleNight_UPP: upliftPreminumNight.text ?? '0',
  //         decUpliftEleSC_UPP: upliftPreminumSc.text ?? "0",
  //         decUpliftGasSC_UPP: upliftPreminumSc.text ?? "0",
  //         decupliftGas_UPP: upliftPreminumDay.text ?? "0",
  //         decupliftEle_Sub: affiliateUpliftDay.text ?? "0",
  //         decupliftEleEWE_Sub: "0.0000",
  //         decupliftEleNight_Sub: "0.0000",
  //         decupliftEleSC_Sub: "0.0000",
  //         decupliftGasSC_Sub: "0.0000",
  //         decupliftGas_Sub: "0.0000",
  //         intTermType: oneYear[prevIndex].tremtype,
  //         decChargeDay: oneYear[prevIndex].baserateday,
  //         decChargeNight: oneYear[prevIndex].baseratenight,
  //         decChargeEWE: oneYear[prevIndex].baserateEwe,
  //         decSCPrice: oneYear[prevIndex].baserateSC,
  //         decUnitPriceGas: "0.0000",
  //         decSCPriceGas: "0.0000")
  //   };
  //   // m = {
  //   //   prevIndex :
  //   // };
  // }
  // // print(m[prevIndex].decupliftEle);
  List<GenerateQuoteIds> temp = [];
  // for(int i=0;i<m.length;i++){
  //   print(m[i].decupliftEle);
  //   temp.add(m[i]);
  // }
  if (termType == '1') {
    tempList = oneYear;
  } else if (termType == '2') {
    tempList = twoYear;
  } else if (termType == '3') {
    tempList = threeYear;
  } else if (termType == '4') {
    tempList = fourYear;
  } else if (termType == '5') {
    tempList = fiveYear;
  } else if (termType == '0') {
    tempList = otherYear;
  }
  quoteIdspricecollection.clear();
  for (int i = 0; i < tempList.length; i++) {
    if (tempList[i].checkItem == true) {
      quoteIdspricecollection.add(GenerateQuoteIds(
          QuteId: tempList[i].QuoteId,
          IntSubUserId: 0,
          decupliftEle: tempList[i].requiredUpliftDay ?? "0",
          decupliftEleNight: tempList[i].requiredUpliftNight ?? "0",
          decupliftEleSC: tempList[i].requiredUpliftSc ?? "0",
          decupliftGasSC: tempList[i].requiredUpliftScGas ?? "0",
          decupliftGas: tempList[i].requiredUpliftDayGas ?? "0",
          decupliftEle_UPP: tempList[i].upliftPreminumDay ?? "0",
          decupliftEleEWE_UPP: tempList[i].upliftPreminumEWE ?? "0",
          decupliftEleNight_UPP: tempList[i].upliftPreminumNight ?? '0',
          decUpliftEleSC_UPP: tempList[i].upliftPreminumSc ?? "0",
          decUpliftGasSC_UPP: tempList[i].upliftPreminumScGas ?? "0",
          decupliftGas_UPP: tempList[i].upliftPreminumDayGas ?? "0",
          decupliftEle_Sub: tempList[i].affiliateUpliftDay ?? "0",
          decupliftEleEWE_Sub: "0.0000",
          decupliftEleNight_Sub: "0.0000",
          decupliftEleSC_Sub: "0.0000",
          decupliftGasSC_Sub: "0.0000",
          decupliftGas_Sub: "0.0000",
          intTermType: tempList[i].tremtype,
          decChargeDay: tempList[i].baserateday,
          decChargeNight: tempList[i].baseratenight,
          decChargeEWE: tempList[i].baserateEwe,
          decSCPrice: tempList[i].baserateSC,
          decUnitPriceGas: "0.0000",
          decSCPriceGas: "0.0000"));
      print(tempList[i].requiredUpliftDay);
    }
  }
  //print(oneYear[prevIndex].visibleGrpName);
  print(tempList[0].intCompId);
  var Dialogmsseg ;
  User _user = await Prefs.getUser();
  if (quoteIdspricecollection.length > 1 && visGroupName == "") {
    var a = jsonEncode({
      "status": "2",
      "msg": "Visibility Group",
    });
   // setState(ViewState.IDLE);
    return Dialogmsseg = jsonDecode(a);
  }


  print(visGroupName);
  htp.Response response = await htp.post(
      Uri.parse('https://api.boshposh.com/api/Partner/GenerateContractGroup'),
      headers: {"Content-Type": "application/json"},
      // body: (json1.substring(1, lstLength - 1)),
      body: json.encode({
        "AccountId": _user.accountId,
        "GroupId": tempList[0].grpId,
        "VisibilityGroupname": quoteIdspricecollection.length>1 ? visGroupName : "",
        "IntCompanyId": "1",
        "type": "group",
        "lstPriceValues": quoteIdspricecollection,
      }));
  var res = jsonDecode(response.body);
  print(res);
  Dialogmsseg = res;
  if (res['status'] == "1") {
    print(res['data']['lstPriceValues']);
    print(res['data']['PremisesAndPricesContract_Quotewithdata']);
    String pdfurl = "";
    if (res['data']['PremisesAndPricesContract_Quotewithdata'] == null ||
        res['data']['PremisesAndPricesContract_Quotewithdata'] == "") {
      pdfurl =
      "https://boshposh.com/MailTemplates/TemplateContract/Premises_7053.pdf";
    } else {
      pdfurl = res['data']['PremisesAndPricesContract_Quotewithdata'];
    }
    // Dialogmsseg = "Contract Generated Successfully";
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      String dirloc = "";
      Dio dio = Dio();
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      final taskId = await FlutterDownloader.enqueue(
        url: pdfurl,
        savedDir: dirloc,
        showNotification:
        true, // show download progress in status bar (for Android)
        openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
      );
      String progress;
      // try {
      //   FileUtils.mkdir([dirloc]);
      //   await dio.download(pdfurl, dirloc + "Premises_6977.pdf",
      //       onReceiveProgress: (receivedBytes, totalBytes) {
      //         progress =
      //             ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
      //         print(progress);
      //       });
      //
      //     Dialogmsseg =
      //     "Generate Site Successfully\n"+"File Successfully Downloaded.";
      // } catch (e) {
      //   print(e);
      //   //Dialogmsseg = e.toString();
      // }
    }
  }
  //setState(ViewState.IDLE);
  return Dialogmsseg;
}
