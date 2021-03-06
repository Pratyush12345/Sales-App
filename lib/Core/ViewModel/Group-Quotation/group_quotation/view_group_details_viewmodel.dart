import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/group_detail_tab_credential.dart';
import 'package:pozitive/Core/Model/group_details_tab_model.dart';
import 'package:pozitive/Core/Model/group_details_sub_model.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htp;
import 'dart:convert';
import 'package:pozitive/Core/ViewModel/Group-Quotation/group_quotation/group_final_Qutation_viewmodel.dart';

GetIt getIt = GetIt.instance;
GroupDetailsTabModel groupDetailsTabModel;
List<GroupDetailsSubModel> groupDetailslst = [];
List<EachyYearList> oneYear = [];
List<EachyYearList> twoYear = [];
List<EachyYearList> threeYear = [];
List<EachyYearList> fourYear = [];
List<EachyYearList> fiveYear = [];
List<EachyYearList> otherYear = [];
List<EachyYearList> oneYearGas = [];
List<EachyYearList> twoYearGas = [];
List<EachyYearList> threeYearGas = [];
List<EachyYearList> foutYeaGas = [];
finalQuotationpPriceModel tempmodel ;
Map<String,EACvalues> eacvalues ;
List<Skippedmapn> skippedmapnlist = [];
class ViewGroupDetailViewModel extends BaseModel {

  void initializeData({BuildContext context, String groupId,bool check,dynamic loaddata}) async {
    setState(ViewState.BUSY);

    if (groupId != null) {
     // await Getyearviseprice(context, groupId);
     if(check){
       await onCallApi(
         context: context,
         groupId: groupId,
         ress: loaddata,
       );
     }
    }
  print(oneYear.length);
    print(oneYearGas.length);

    setState(ViewState.IDLE);
  }

  void goToNext() {
    setState(ViewState.BUSY);
    globals.tabController8.animateTo(2);
    setState(ViewState.IDLE);
  }

  Database database = getIt<DatabaseImplementation>();
  Future<void> onCallApi({BuildContext context, String groupId,dynamic ress}) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    // // groupDetailsTabModel = await database.getGroupDetails(
    // //   GroupDetailsTabCredential(
    // //     accountID: _user.accountId,
    // //     groupId: groupId,
    // //     type: 'group',
    // //   ),
    // // );
    htp.Response response = await htp.post(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/GetPartnerQuoteGroup_Price'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": groupId ,
          "type": "group"
        })
    );
    var res  = jsonDecode(response.body);
   print(res['data']['status']);
    if (res['status'] == '1') {
      //print(res['data']['lstPriceValues'][0]['intTermType']);
      oneYear.clear();
      twoYear.clear();
      threeYear.clear();
      fourYear.clear();
      fiveYear.clear();
      otherYear.clear();
      oneYearGas.clear();
      twoYearGas.clear();
      threeYearGas.clear();
      foutYeaGas.clear();

      if(res['data']['lstPriceValues'] != null){
        for (int i = 0;
        i < res['data']['lstPriceValues'].length;
        i++) {
          if(res['data']['lstPriceValues'][i]['intTermType'] == '1'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              oneYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn: "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,

                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",


                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              oneYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",

                  )
              );
            }
          }
          else if(res['data']['lstPriceValues'][i]['intTermType'] == '2'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              twoYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn: "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",


                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              twoYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",

                  )
              );
            }
          }
          else if(res['data']['lstPriceValues'][i]['intTermType'] == '3'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              threeYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn:  "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",

                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              threeYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",
                  )
              );
            }
          }
          else if(res['data']['lstPriceValues'][i]['intTermType'] == '4'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              fourYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn:  "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",


                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              fourYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",
                  )
              );
            }
          }
          else  if(res['data']['lstPriceValues'][i]['intTermType'] == '5'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              fiveYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn: "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,

                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",


                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              fiveYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",

                  )
              );
            }
          }
          else  if(res['data']['lstPriceValues'][i]['intTermType'] == '0'){
            if((res['data']['lstPriceValues'][i]['strMPAN'] != "") && (res['data']['lstPriceValues'][i]['strMPAN'] != null)){
              otherYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "", //'048111201900049034320',
                    mprn: "",//'987412563',
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,

                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",

                  )
              );
            }
            if((res['data']['lstPriceValues'][i]['strMPRN'] != "") && (res['data']['lstPriceValues'][i]['strMPRN'] != null)){
              otherYear.add(
                  EachyYearList(
                    tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                    mpan:  "", //'048111201900049034320',
                    mprn:  res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                    baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                    baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                    baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                    baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                    contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                    contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
                    QuoteId: res['data']['lstPriceValues'][i]['QuteId'] ?? "",
                    grpId: res['data']['GroupId'] ?? "",
                    intCompId: res['data']['IntCompanyId'] ?? "",
                    visibleGrpName: res['data']['VisibilityGroupname'] ?? "",
                    checkItem: false,
                    visited:  false,
                    requiredUpliftDay: "",
                    requiredUpliftNight: "",
                    requiredUpliftEWE: "",
                    requiredUpliftSc: "",
                    upliftPreminumDay: "",
                    upliftPreminumNight: "",
                    upliftPreminumEWE: "",
                    upliftPreminumSc: "",
                    affiliateUpliftDay: "",
                    affiliateUpliftNight: "",
                    affiliateUpliftEWE: "",
                    affiliateUpliftSc: "",
                    requiredUpliftDayGas: "",
                    requiredUpliftScGas: "",
                    upliftPreminumDayGas: "",
                    upliftPreminumScGas: "",
                  )
              );
            }
          }


        }
      }

      // print(oneYear.length);
      // print(twoYear.length);
      // print(threeYear.length);
      // print(fourYear.length);

     // setState(ViewState.IDLE);
    }
    else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, groupDetailsTabModel.error ?? 'Failed');
    }



    if (res['status'] == '1') {
    //  print(groupDetailsTabModel.data.lstGroupMaster.length);
      groupDetailslst.clear();
      if(eacvalues != null)
      eacvalues.clear();
      if(res['data']['lstGroupMaster'] != null){
        for (int i = 0;
        i < res['data']['lstGroupMaster'].length;
        i++) {
          groupDetailslst.add(
            GroupDetailsSubModel(
                businessName:
                res['data']['lstGroupMaster'][i]['Business_Name']  ??
                    "",
                mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ??
                    "",
                mprn: res['data']['lstGroupMaster'][i]['Gas_Mprn']?? "",
                industryEacAq:
                res['data']['lstGroupMaster'][i]['decIndustryEACAQ'] ??
                    "",
                currentSupplierName: res['data']['lstGroupMaster'][i]['strCurrentSupplierName'] ??
                    "",
                currentSupplierStartDate: res['data']['lstGroupMaster'][i]['strCurrentSupplierStartDate'] ??
                    "",
                siteAddress:
                res['data']['lstGroupMaster'][i]['strSiteAddress'] ??
                    "",
                meterType: res['data']['lstGroupMaster'][i]['strMeterType']??
                    "",
                relatedMeter:
                res['data']['lstGroupMaster'][i]['strRelatedMeter'] ?? ""),
          );
          if(eacvalues != null ){
            String tempmpan = res['data']['lstGroupMaster'][i]['Full_Mpan_Number'];
            if(res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] != null && res['data']['lstGroupMaster'][i]['Full_Mpan_Number']!=""){
              eacvalues.addAll(
                  {
                    tempmpan.substring(8) ?? "" :  EACvalues(
                      mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                      EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                      EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                    ),
                    res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                      mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                      EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                      EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                      strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                    ),
                  });
            }
            else{
              eacvalues.addAll(
                  {
                    res['data']['lstGroupMaster'][i]['Full_Mpan_Number']?? "" :  EACvalues(
                      mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                      EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                      EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                    ),
                    res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                      mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                      EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                      EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                      strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                    ),
                  });
            }
          }
          else{
            String tempmpan = res['data']['lstGroupMaster'][i]['Full_Mpan_Number'];
            if(res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] != null && res['data']['lstGroupMaster'][i]['Full_Mpan_Number']!=""){
              eacvalues =  {
                tempmpan.substring(8) ?? "" :  EACvalues(
                  mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                  EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                  EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                ),
                res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                  mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                  EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                  EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                  strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                ),
              };
            }else{
              eacvalues =  {
                res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] :  EACvalues(
                  mpan: res['data']['lstGroupMaster'][i]['Full_Mpan_Number'] ?? "",
                  EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                  EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                ),
                res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "" :  EACvalues(
                  mpan: res['data']['lstGroupMaster'][i]['Gas_Mprn'] ?? "",
                  EACDay: res['data']['lstGroupMaster'][i]['ElectricityDay_EAC'] ?? "",
                  EACnight: res['data']['lstGroupMaster'][i]['ElectricityNight_EAC'] ?? "",
                  strAq: res['data']['lstGroupMaster'][i]['GAS_EAC'] ?? "",
                ),
              };
            }

          }

        }
      }


     // setState(ViewState.IDLE);

    } else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, groupDetailsTabModel.error ?? 'Failed');
    }


    htp.Response response2 = await htp.get(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/GetSkipMPANList?intGroupId=${groupId}&intAccountId=${_user.accountId}'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),

    );
    print(response2.body);
    var res2 = jsonDecode(response2.body);
    skippedmapnlist = [];
    if(res2['status'] == '1'){
      print(res2['data']);
      List skips = res2['data'];
      if(skips.isNotEmpty){
        for(int i=0;i<res2['data'].length;i++){
          skippedmapnlist.add(
              Skippedmapn(
                mapncore: res2['data'][i]['strMPANCore'],
                Reason: res2['data'][i]['strReason'],
              )
          );
        }
        print(skippedmapnlist[0].mapncore);
      }
      setState(ViewState.IDLE);
    }
    else{
      setState(ViewState.IDLE);
    }


}

Future<void>Getyearviseprice(BuildContext context,String groupId) async{
  setState(ViewState.BUSY);
  User _user = await Prefs.getUser();


}


Future <void>RemoveSite({String grpId,BuildContext context,String Year}) async{
   setState(ViewState.BUSY);
    // print(oneYear[0].QuoteId);
    // print(oneYear[0].checkItem);
    // print(oneYear[1].QuoteId);
    // print(oneYear[1].checkItem);
    // print(oneYear[2].QuoteId);
    // print(oneYear[2].checkItem);
    List<EachyYearList>TempListEle = [];
   List<EachyYearList>temp2 = [];
    if(Year == '1'){
      TempListEle = oneYear;
    }
    else if(Year == '2'){
      TempListEle = twoYear;
    }
    else if(Year == '3'){
      TempListEle = threeYear;
    }
    else if(Year == '4'){
      TempListEle = fourYear;
    }
    else if(Year == '5'){
      TempListEle = fiveYear;
    }
    else if(Year == '0'){
      TempListEle = fiveYear;
    }
    print(TempListEle[0].checkItem);
    List<int> deleids = [];
    List<CollectionQuoteIds> ids = [];
    for(int i=0;i<TempListEle.length;i++){
      if(TempListEle[i].checkItem == true){
        deleids.add(i);
        ids.add(
            CollectionQuoteIds(
              QuoteId: TempListEle[i].QuoteId,
            )
        );
        //TempListEle.removeAt(i);
      }
    }
    print(ids.length);
    int j=TempListEle.length;
    //oneYear.clear();
    User _user = await Prefs.getUser();
    for(int i=0;i<j;i++){
      if(!deleids.contains(i)){
        temp2.add(TempListEle[i]);
      }
      //TempListEle.removeAt(deleids[i]);
    }

    htp.Response response = await htp.post(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/RemoveContractSite'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode({
          "AccountId": _user.accountId,
          "GroupId": grpId ,
          "type": "group",
          "lstRemoveSite": ids,
        })
    );
    var res = jsonDecode(response.body);
    print(response.body);
    if(res['status'] == '1'){
      if(Year == '1'){
          oneYear = temp2;

      }
      else if(Year == '2'){
       twoYear= temp2;
      }
      else if(Year == '3'){
       threeYear=temp2;
      }
      else if(Year == '4'){
         fourYear=temp2;
      }
      else if(Year == '5'){
        fiveYear=temp2;
      }
      else if(Year == '0'){
        otherYear=temp2;
      }
      if(oneYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<oneYear.length;j++){
            if(ids[i].QuoteId ==oneYear[j].QuoteId ){
              oneYear.removeAt(j);
            }
          }
        }
      }
      if(twoYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<twoYear.length;j++){
            if(ids[i].QuoteId ==twoYear[j].QuoteId ){
              twoYear.removeAt(j);
            }
          }
        }
      }
      if(threeYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<threeYear.length;j++){
            if(ids[i].QuoteId==threeYear[j].QuoteId ){
              threeYear.removeAt(j);
            }
          }
        }
      }
      if(fourYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<fourYear.length;j++){
            if(ids[i].QuoteId ==fourYear[j].QuoteId ){
              fourYear.removeAt(j);
            }
          }
        }
      }
      if(fiveYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<fiveYear.length;j++){
            if(ids[i].QuoteId ==fiveYear[j].QuoteId ){
              fiveYear.removeAt(j);
            }
          }
        }
      }
      if(otherYear!=null){
        for(int i=0;i<ids.length;i++){
          for(int j=0;j<otherYear.length;j++){
            if(ids[i].QuoteId ==otherYear[j].QuoteId ){
              otherYear.removeAt(j);
            }
          }
        }
      }
      return setState(ViewState.IDLE);
    }
    else{
       setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, res['msg'] ?? 'Failed');
    }


}

  Future <void>Editsite({String grpId,BuildContext context,String Year}) async{
   // setState(ViewState.BUSY);

    User _user = await Prefs.getUser();
    htp.Response response = await htp.post(
        Uri.parse(
            'https://api.boshposh.com/api/Partner/RemoveContractSite'),
        headers: {"Content-Type": "application/json"},
        // body: (json1.substring(1, lstLength - 1)),
        body: json.encode(
            {
              "AccountId": "7257",
              "GroupId": "20730",
              "QuoteId": "69432",
              "type":"group",
              "strfullMpan":"008451271460001787850",
              "strDayEAC":"6000",
              "strNightEAC":"",
              "strEweEAC":"",
              "strMPRN":"",
              "strAQ":"",
              "dteContractStartDate":"25/08/2021",
              "dteContractEndDate":""
            }
        )
    );
    var res = jsonDecode(response.body);
    print(response.body);


  }




}
