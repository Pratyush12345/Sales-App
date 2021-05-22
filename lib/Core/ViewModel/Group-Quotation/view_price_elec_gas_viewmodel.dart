import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/get_group_volume_data_credentials.dart';
import 'package:pozitive/Core/Model/get_group_volume_data_model.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';

GetIt getIt = GetIt.instance;

class ViewPriceElectricityGasViewModel extends BaseModel {
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
  GetGroupVolumeDataModel getGroupVolumeDataModel;
  List<LstGroupVolumeData> lstVolumeGroupData = [];

  void initializeData({BuildContext context, String groupId}) async {
    setState(ViewState.BUSY);
    if (groupId != null) {
      await onApiCall(context: context, groupId: groupId);
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
          type: 'group',
        ),
      );
    }
    if (getGroupVolumeDataModel.status == '1') {
      lstVolumeGroupData.clear();

      lstVolumeGroupData = getGroupVolumeDataModel.data.lstGroupVolumeData;
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    //
    setState(ViewState.IDLE);
  }
}
