import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/GroupAskForQuoteFinalCredentials.dart';
import 'package:http/http.dart' as htp;
import 'package:pozitive/Core/Model/site_list_model.dart';
import 'package:pozitive/providers/site_list_provider.dart';
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:pozitive/Pages/homepage.dart';

GetIt getIt = GetIt.instance;

class PreviewPageGroupViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  List<ListFormSiteListFinal> allSites = [];
  List<SiteListModel> siteListReceived = [];

  List<ListFormSiteListFinal> getAllSites(
      {SiteListProvider siteListProviderData}) {
    setState(ViewState.BUSY);
    allSites.clear();
    for (int i = 0; i < siteListProviderData.siteListProvider.length; i++) {
      print(siteListProviderData.siteListProvider[i].dteContractStartDate);
      allSites.add(
        ListFormSiteListFinal(
          businessName:
              siteListProviderData.siteListProvider[i].businessName ?? "",
          mPANCore:
              siteListProviderData.siteListProvider[i].fullMpanNumber ?? "",
          mPRN: siteListProviderData.siteListProvider[i].gasMprn ?? "",
          preferedStartDate:
              siteListProviderData.siteListProvider[i].dteContractStartDate ??
                  "",
        ),
      );
    }
    setState(ViewState.IDLE);
    return allSites;
  }

  void onAskForQuoteFinal({
    @required TabController3Provider tabController3Provider,
    BuildContext context,
    GroupQuotaionDetailsProvider quotationDetailsProviderData,
    SiteListProvider siteListProviderData,
  }) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    List<GroupAskForQuoteFinalCredentials> list = [];
    list.add(
      GroupAskForQuoteFinalCredentials(
        accountId: _user.accountId,
        command: 'Final',
        intCompanyUserId: _user.accountId,
        intCompanyId: "1",
        groupId: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.groupId
            .toString(),
        groupname: quotationDetailsProviderData
                .groupQuotaionDetailsProvider.groupname ??
            "",
        basketName: quotationDetailsProviderData
                .groupQuotaionDetailsProvider.basketName ??
            "",
        thirdPartyMOP: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.thirdPartyMOP
            .toString(),
        thirdPartyDADC: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.thirdPartyDADC
            .toString(),
        bteIsStarkDADC: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.bteIsStarkDADC
            .toString(),
        isforFirstyearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforFirstyearGroup
            .toString(),
        isforSecondyearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforSecondyearGroup
            .toString(),
        isforThirdyearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforThirdyearGroup
            .toString(),
        isforFouryearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforFouryearGroup
            .toString(),
        isforFiveyearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforFiveyearGroup
            .toString(),
        isforOtheryearGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isforOtheryearGroup
            .toString(),
        isCommonEnddate: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.isCommonEnddate
            .toString(),
        requiredByDate: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.requiredByDate
            .toString(),
        contractEndDateGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.contractEndDateGroup
            .toString(),
        requestedDateGroup: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.requiredByDate
            .toString(),
        companyName: quotationDetailsProviderData
            .groupQuotaionDetailsProvider.companyName
            .toString(),
        cRN: quotationDetailsProviderData.groupQuotaionDetailsProvider.cRN
            .toString(),
        lstFormSiteListFinal:
            getAllSites(siteListProviderData: siteListProviderData),
      ),
    );
    String json1 = jsonEncode(list.map((e) => e.toJson()).toList());
    int lstLength = json1.length;
    AppConstant.printWrapped(json1.substring(1, lstLength - 1));
    //print(json1.substring(1, lstLength - 1));
    htp.Response response = await htp.post(
      Uri.parse(
          'https://api.boshposh.com/api/Partner/AddPartnerAddQuickLeadQuoteGroup_New'),
      headers: {"Content-Type": "application/json"},
      body: json1.substring(1, lstLength - 1),
    );
    AppConstant.printWrapped(response.body);
    var res = jsonDecode(response.body);

    if (res['status'] == '1') {
      print('Api Calling successfull');
      bool addDetailsPerfect = true;

      for (int j = 0; j < res['data']['lstFormSiteList'].length; j++) {
        if ((res['data']['lstFormSiteList'][j]['Business_NameErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['MpanErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['MprnErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['StartDateErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['BothMissErr'] != null)) {
          addDetailsPerfect = false;
        }
      }

      for (int j = 0; j < res['data']['lstFormSiteList'].length; j++) {
        if ((res['data']['lstFormSiteList'][j]['Business_NameErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['MpanErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['MprnErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['StartDateErr'] != null) ||
            (res['data']['lstFormSiteList'][j]['BothMissErr'] != null)) {
          siteListReceived.clear();
          for (int i = 0; i < res['data']['lstFormSiteList'].length; i++) {
            siteListReceived.add(
              SiteListModel(
                businessName: res['data']['lstFormSiteList'][i]
                    ['Business_Name'],
                strPostCode: res['data']['lstFormSiteList'][i]['strPostCode'],
                fullMpanNumber: res['data']['lstFormSiteList'][i]
                    ['Full_Mpan_Number'],
                eACDay: res['data']['lstFormSiteList'][i]['EAC_Day'],
                eACEWE: res['data']['lstFormSiteList'][i]['EAC_EWE'],
                eACNight: res['data']['lstFormSiteList'][i]['EAC_Night'],
                gasMprn: res['data']['lstFormSiteList'][i]['Gas_Mprn'],
                eACGAS: res['data']['lstFormSiteList'][i]['GAS_EAC'],
                dteContractStartDate: res['data']['lstFormSiteList'][i]
                    ['dteContractStartDate'],
                preferedStartDate: res['data']['lstFormSiteList'][i]
                    ['dteContractStartDate'],
                preferedEndDate: res['data']['lstFormSiteList'][i]
                    ['PreferedEndDate'],
                bIsSingleRate:
                    res['data']['lstFormSiteList'][i]['bIsSingleRate'] == 'true'
                        ? true
                        : false,
                bisGreenCertificate: res['data']['lstFormSiteList'][i]
                            ['bisGreenCertificate'] ==
                        'true'
                    ? true
                    : false,
                businessNameErr: res['data']['lstFormSiteList'][i]
                    ['Business_NameErr'],
                postCodeErr: res['data']['lstFormSiteList'][i]['PostCodeErr'],
                mpanErr: res['data']['lstFormSiteList'][i]['MpanErr'],
                dayEACErr: res['data']['lstFormSiteList'][i]['Day_EACErr'],
                eveningEACErr: res['data']['lstFormSiteList'][i]
                    ['Evening_EACErr'],
                nightEACErr: res['data']['lstFormSiteList'][i]['Night_EACErr'],
                gASEACErr: res['data']['lstFormSiteList'][i]['GAS_EACErr'],
                startDateErr: res['data']['lstFormSiteList'][i]['StartDateErr'],
                endDateErr: res['data']['lstFormSiteList'][i]['EndDateErr'],
                singleRateErr: res['data']['lstFormSiteList'][i]
                    ['SingleRateErr'],
                mprnErr: res['data']['lstFormSiteList'][i]['MprnErr'],
              ),
            );
          }
          siteListProviderData.siteListProvider = siteListReceived;
          setState(ViewState.IDLE);
          return AppConstant.showFailToast(
              context, 'Please fill details properly');
        } else {
          // await PrefGroupQuote.clearSiteDetails();
          // await PrefGroupQuote.clearQuotationGroupDetailsAddQuote();
          // siteListProviderData.siteListProvider.clear();

          siteListReceived.clear();
          for (int i = 0; i < res['data']['lstFormSiteList'].length; i++) {
            siteListReceived.add(
              SiteListModel(
                businessName: res['data']['lstFormSiteList'][i]
                    ['Business_Name'],
                strPostCode: res['data']['lstFormSiteList'][i]['strPostCode'],
                fullMpanNumber: res['data']['lstFormSiteList'][i]
                    ['Full_Mpan_Number'],
                eACDay: res['data']['lstFormSiteList'][i]['EAC_Day'],
                eACEWE: res['data']['lstFormSiteList'][i]['EAC_EWE'],
                eACNight: res['data']['lstFormSiteList'][i]['EAC_Night'],
                gasMprn: res['data']['lstFormSiteList'][i]['Gas_Mprn'],
                eACGAS: res['data']['lstFormSiteList'][i]['GAS_EAC'],
                dteContractStartDate: res['data']['lstFormSiteList'][i]
                    ['dteContractStartDate'],
                preferedStartDate: res['data']['lstFormSiteList'][i]
                    ['dteContractStartDate'],
                preferedEndDate: res['data']['lstFormSiteList'][i]
                    ['PreferedEndDate'],
                bIsSingleRate:
                    res['data']['lstFormSiteList'][i]['bIsSingleRate'] == 'true'
                        ? true
                        : false,
                bisGreenCertificate: res['data']['lstFormSiteList'][i]
                            ['bisGreenCertificate'] ==
                        'true'
                    ? true
                    : false,
                businessNameErr: res['data']['lstFormSiteList'][i]
                    ['Business_NameErr'],
                postCodeErr: res['data']['lstFormSiteList'][i]['PostCodeErr'],
                mpanErr: res['data']['lstFormSiteList'][i]['MpanErr'],
                dayEACErr: res['data']['lstFormSiteList'][i]['Day_EACErr'],
                eveningEACErr: res['data']['lstFormSiteList'][i]
                    ['Evening_EACErr'],
                nightEACErr: res['data']['lstFormSiteList'][i]['Night_EACErr'],
                gASEACErr: res['data']['lstFormSiteList'][i]['GAS_EACErr'],
                startDateErr: res['data']['lstFormSiteList'][i]['StartDateErr'],
                endDateErr: res['data']['lstFormSiteList'][i]['EndDateErr'],
                singleRateErr: res['data']['lstFormSiteList'][i]
                    ['SingleRateErr'],
                mprnErr: res['data']['lstFormSiteList'][i]['MprnErr'],
              ),
            );
          }
          siteListProviderData.siteListProvider = siteListReceived;
          if (addDetailsPerfect) {
            setState(ViewState.IDLE);
            if (res['data']['status'] == 'UnderProcess') {
              tabController3Provider.setTabListProvider = 2;

              return AppConstant.popUp2(
                context,
                AppString.groupQuotePriceAlertMsg,
                () {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false);
                },
              );
            }
            //else if(res['data']['status']=='Quoted'){}
            else {
              return AppConstant.popUp2(
                context,
                AppString.groupQuotePriceAlertMsg,
                    () {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                          (route) => false);
                },
              );
              // Navigator.of(context).pushAndRemoveUntil(
              //     new MaterialPageRoute(
              //       builder: (context) => HomePage(),
              //     ),
              //     (route) => false);
              // return AppConstant.showSuccessToast(context, 'Success');
            }

            // tabController3Provider.setTabListProvider = 2;
            // globals.tabController3.animateTo(2);

            //AppConstant.showSuccessToast(context, 'Success');
          } else {
            setState(ViewState.IDLE);
            AppConstant.showFailToast(
                context, 'Please fill all Details properly');
          }
        }
      }

      setState(ViewState.IDLE);
    } else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(context, res['Error'] ?? "Failed");
    }
    setState(ViewState.IDLE);
  }
}
