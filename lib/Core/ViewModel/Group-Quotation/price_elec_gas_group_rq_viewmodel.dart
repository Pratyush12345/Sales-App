import 'package:flutter/material.dart';
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
import 'package:pozitive/Core/Model/get_partner_quote_group_price_model.dart';
import 'package:pozitive/Core/Model/Api/get_partner_quote_group_price_credentials.dart';
import 'package:pozitive/Util/PrefGroupQuote/PrefQuoteGroup.dart';
import 'package:pozitive/Core/Model/Api/get_group_volume_data_credentials.dart';
import 'package:pozitive/Core/Model/get_group_volume_data_model.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

GetIt getIt = GetIt.instance;

class PriceElecGasGroupRQViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();
  bool autovalidation = false;
  TextEditingController elecCommonUnit = TextEditingController();
  TextEditingController elecCommonSc = TextEditingController();
  TextEditingController elecAffiliateUnit = TextEditingController();
  TextEditingController elecAffiliateSc = TextEditingController();
  TextEditingController gasCommonUnit = TextEditingController();
  TextEditingController gasCommonSc = TextEditingController();
  TextEditingController gasAffiliateUnit = TextEditingController();
  TextEditingController gasAffiliateSc = TextEditingController();
  String groupIdFromPref;
  GetGroupVolumeDataModel getGroupVolumeDataModel;
  List<LstGroupVolumeData> lstVolumeGroupData = [];

  void initializeData({BuildContext context}) async {
    setState(ViewState.BUSY);
    groupIdFromPref = await PrefGroupQuote.gRQgetGroupId() ?? null;
    if (groupIdFromPref != null) {
      print(groupIdFromPref);
      await onApiCall(context: context, groupId: groupIdFromPref);
    }
    setState(ViewState.IDLE);
  }

  Future<void> onApiCall({BuildContext context, String groupId}) async {
    setState(ViewState.BUSY);
    User _user = await Prefs.getUser();

    if (groupId != null) {
      getGroupVolumeDataModel = await database.getGroupVolumeData(
        GetGroupVolumeDataCredentials(
          accountId: _user.accountId,
          groupId: groupId,
          //groupId: '19840',
          type: 'group',
        ),
      );
    }
    if (getGroupVolumeDataModel.status == '1') {
      lstVolumeGroupData.clear();
      AppConstant.showSuccessToast(context, 'Success');
      lstVolumeGroupData = getGroupVolumeDataModel.data.lstGroupVolumeData;
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext({
    @required TabController3Provider tabController3Provider,
  }) {
    setState(ViewState.BUSY);
    tabController3Provider.setTabListProvider = 4;
    globals.tabController3.animateTo(4);
    setState(ViewState.IDLE);
  }
}
