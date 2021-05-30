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

GetIt getIt = GetIt.instance;
GroupDetailsTabModel groupDetailsTabModel;
List<GroupDetailsSubModel> groupDetailslst = [];
List<EachyYearList> oneYear = [];
List<EachyYearList> oneYearmprn = [];
List<EachyYearList> twoYear = [];
List<EachyYearList> threeYear = [];
List<EachyYearList> fourYear = [];
class ViewGroupDetailViewModel extends BaseModel {

  void initializeData({BuildContext context, String groupId,bool check}) async {
    setState(ViewState.BUSY);

    if (groupId != null) {
     // await Getyearviseprice(context, groupId);
     if(check){
       await onCallApi(
         context: context,
         groupId: groupId,
       );
     }
    }
    print(oneYear.length);

    setState(ViewState.IDLE);
  }

  void goToNext() {
    setState(ViewState.BUSY);
    //
    setState(ViewState.IDLE);
  }

  Database database = getIt<DatabaseImplementation>();
  Future<void> onCallApi({BuildContext context, String groupId}) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    groupDetailsTabModel = await database.getGroupDetails(
      GroupDetailsTabCredential(
        accountID: _user.accountId,
        groupId: groupId,
        type: 'group',
      ),
    );
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
   // print(res['data']['status']);
    if (res['status'] == '1') {
      print(res['data']['lstPriceValues'][0]['intTermType']);
      oneYear.clear();
      twoYear.clear();
      threeYear.clear();
      fourYear.clear();
      for (int i = 0;
      i < res['data']['lstPriceValues'].length;
      i++) {
        if(res['data']['lstPriceValues'][i]['intTermType'] == '1'){
         if(res['data']['lstPriceValues'][i]['strMPAN'] != ''){
           oneYear.add(
               EachyYearList(
                 tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                 mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "",
                 mprn: res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                 baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                 baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                 baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                 baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                 contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                 contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
               )
           );
         }
          // if(true){
          //   oneYearmprn.add(
          //       EachyYearList(
          //         tremtype: res['data']['lstPriceValues'][i]['intTermType'],
          //         mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "",
          //         mprn: '1123456789',
          //         baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
          //         baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
          //         baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
          //         baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
          //         contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
          //         contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
          //       )
          //   );
          // }
        }
        else if(res['data']['lstPriceValues'][i]['intTermType'] == '2'){
          twoYear.add(
              EachyYearList(
                tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "",
                mprn: res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
              ),
          );
        }
        else if(res['data']['lstPriceValues'][i]['intTermType'] == '3'){
          threeYear.add(
              EachyYearList(
                tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "",
                mprn: res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
              )
          );
        }
        else if(res['data']['lstPriceValues'][i]['intTermType'] == '4'){
          fourYear.add(
              EachyYearList(
                tremtype: res['data']['lstPriceValues'][i]['intTermType'],
                mpan: res['data']['lstPriceValues'][i]['strMPAN'] ?? "",
                mprn: res['data']['lstPriceValues'][i]['strMPRN'] ?? "",
                baserateday: res['data']['lstPriceValues'][i]['decChargeDay'] ?? "",
                baseratenight: res['data']['lstPriceValues'][i]['decChargeNight'] ?? "",
                baserateEwe: res['data']['lstPriceValues'][i]['decChargeEWE'] ?? "",
                baserateSC: res['data']['lstPriceValues'][i]['decSCPrice'] ?? "",
                contractStartDate: res['data']['lstPriceValues'][i]['strContractStartDate'] ?? "",
                contractEndDate: res['data']['lstPriceValues'][i]['strContractEndDate'] ?? "",
              )
          );
        }

      }

      // print(oneYear.length);
      // print(twoYear.length);
      // print(threeYear.length);
      // print(fourYear.length);


    }
    else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, groupDetailsTabModel.error ?? 'Failed');
    }



    if (groupDetailsTabModel.status == '1') {
    //  print(groupDetailsTabModel.data.lstGroupMaster.length);
      groupDetailslst.clear();
      for (int i = 0;
          i < groupDetailsTabModel.data.lstGroupMaster.length;
          i++) {
        groupDetailslst.add(
          GroupDetailsSubModel(
              businessName:
                  groupDetailsTabModel.data.lstGroupMaster[i].businessName ??
                      "",
              mpan: groupDetailsTabModel.data.lstGroupMaster[i].fullMpanNumber ??
                  "",
              mprn: groupDetailsTabModel.data.lstGroupMaster[i].gasMprn ?? "",
              industryEacAq:
                  groupDetailsTabModel.data.lstGroupMaster[i].decIndustryEACAQ ??
                      "",
              currentSupplierName: groupDetailsTabModel
                      .data.lstGroupMaster[i].strCurrentSupplierName ??
                  "",
              currentSupplierStartDate: groupDetailsTabModel
                      .data.lstGroupMaster[i].strCurrentSupplierStartDate ??
                  "",
              siteAddress:
                  groupDetailsTabModel.data.lstGroupMaster[i].strSiteAddress ??
                      "",
              meterType: groupDetailsTabModel.data.lstGroupMaster[i].strMeterType ??
                  "",
              relatedMeter:
                  groupDetailsTabModel.data.lstGroupMaster[i].strRelatedMeter.toString() ?? ""),
        );
      }
      setState(ViewState.IDLE);

    } else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, groupDetailsTabModel.error ?? 'Failed');
    }


}

Future<void>Getyearviseprice(BuildContext context,String groupId) async{
  setState(ViewState.BUSY);
  User _user = await Prefs.getUser();


}

}
