import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/sharePrefModel/SaveAndGenerateContractIndividualModel.dart';
import 'package:pozitive/Util/IndividualContractPref.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';
import 'package:pozitive/Util/global.dart' as globals;

GetIt getIt = GetIt.instance;

class SiteAddressViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController contractSiteAddress = TextEditingController();
  TextEditingController contractTown = TextEditingController();
  TextEditingController contractPostcode = TextEditingController();

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractSiteAddress(
      SaveAndGenerateContractAddMethodCredential(
        strSiteAddress1: contractSiteAddress.text,
        strSiteTown: contractTown.text,
        strPostcodeBusiness: contractPostcode.text,
      ),
    );
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(3);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractSiteAddress.text = individualModel.strSiteAddress1;
    contractTown.text = individualModel.strSiteTown;
    contractPostcode.text = individualModel.strPostcodeBusiness;
    setState(ViewState.IDLE);
  }
}
