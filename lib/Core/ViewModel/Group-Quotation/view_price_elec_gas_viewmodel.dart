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
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';

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
    // final data = await Prefs.getGroupQuotationGasElectricityDetails();
    // if (data != null) {
    //   elecCommonUnit.text = data.elecCommonUnit ?? '0';
    //   elecCommonSc.text = data.elecCommonSc ?? '0';
    //   elecAffiliateUnit.text = data.elecAffiliateUnit ?? '0';
    //   elecAffiliateSc.text = data.elecAffiliateSc ?? '0';
    //   gasCommonUnit.text = data.gasCommonUnit ?? '0';
    //   gasCommonSc.text = data.gasCommonSc ?? '0';
    //   gasAffiliateUnit.text = data.gasAffiliateUnit ?? '0';
    //   gasAffiliateSc.text = data.gasAffiliateSc ?? '0';
    //
    // }

    setState(ViewState.IDLE);
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

  void onSaveAndNext() async {
    setState(ViewState.BUSY);
    //
    setState(ViewState.IDLE);
    Prefs.setGroupQuotationGasElectricityDetails(GroupQuotationPriceElectricityGasModel(
        elecCommonUnit: elecCommonUnit.text ?? '0',
        elecCommonSc: elecCommonSc.text ?? '0',
        elecAffiliateUnit: elecAffiliateUnit.text ?? '0',
        elecAffiliateSc: elecAffiliateSc.text ?? '0',
        gasCommonUnit: gasCommonUnit.text ?? '0',
        gasCommonSc: gasCommonSc.text ?? '0',
        gasAffiliateUnit: gasAffiliateUnit.text ?? '0',
        gasAffiliateSc: gasAffiliateSc.text ?? '0',
        getGroupVolumeDataModel: getGroupVolumeDataModel,));
  }
}
