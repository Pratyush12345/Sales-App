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

class BusinessDetailViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController businessName = TextEditingController();
  TextEditingController regCompanyName = TextEditingController();
  TextEditingController companyRegNo = TextEditingController();
  TextEditingController charityRegNo = TextEditingController();

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractBusinessDetails(
        SaveAndGenerateContractAddMethodCredential(
      strBusinessnames: businessName.text,
      RegisterCompanyName: regCompanyName.text,
      RegisterCompanyNo: companyRegNo.text,
      RegisterCharityNo: charityRegNo.text,
    ));
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(2);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    businessName.text = individualModel.strBusinessnames;
    regCompanyName.text = individualModel.registerCompanyName;
    companyRegNo.text = individualModel.registerCompanyNo;
    charityRegNo.text = individualModel.registerCharityNo;
    setState(ViewState.IDLE);
  }
}
