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
import 'package:pozitive/providers/quotation_detail_provider.dart';
import 'package:pozitive/providers/tabcontroller3_provider.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';

GetIt getIt = GetIt.instance;

class GroupDetailsTabViewModel extends BaseModel {
  GroupDetailsTabModel groupDetailsTabModel;
  List<GroupDetailsSubModel> groupDetailslst = [];
  String groupIdFromPref;

  void initializeData(
      {BuildContext context,
      GroupQuotaionDetailsProvider quotationDetailsProviderData}) async {
    setState(ViewState.BUSY);
    groupIdFromPref = await PrefGroupQuote.gRQgetGroupId() ?? null;
    if (groupIdFromPref != null) {
      print(groupIdFromPref);
      await onCallApi(
        context: context,
        groupId: groupIdFromPref,
      );
    }

    setState(ViewState.IDLE);
  }

  void goToNext({TabController3Provider tabController3Provider}) {
    setState(ViewState.BUSY);
    tabController3Provider.setTabListProvider = 3;
    globals.tabController3.animateTo(3);
    setState(ViewState.IDLE);
  }

  Database database = getIt<DatabaseImplementation>();
  Future<void> onCallApi(
      {BuildContext context,
      String groupId}) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();
    groupDetailsTabModel = await database.getGroupDetails(
      GroupDetailsTabCredential(
        accountID: _user.accountId,
        groupId: groupIdFromPref,
        type: 'group',
      ),
    );

    if (groupDetailsTabModel.status == '1') {
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
      return AppConstant.showSuccessToast(context, 'Success');
    } else {
      setState(ViewState.IDLE);
      return AppConstant.showFailToast(
          context, groupDetailsTabModel.error ?? 'Failed');
    }
  }
}
