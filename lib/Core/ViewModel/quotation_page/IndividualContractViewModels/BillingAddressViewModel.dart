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

class BillingAddressViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController contractBillAddress = TextEditingController();
  TextEditingController contractBillTown = TextEditingController();
  TextEditingController contractBillPostcode = TextEditingController();

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractBillingAddress(
      SaveAndGenerateContractAddMethodCredential(
        strAddress1: contractBillAddress.text,
        strTown: contractBillTown.text,
        strPostcodeHome: contractBillPostcode.text,
      ),
    );
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(4);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractBillAddress.text = individualModel.strAddress1;
    contractBillTown.text = individualModel.strTown;
    contractBillPostcode.text = individualModel.strPostcodeHome;
    setState(ViewState.IDLE);
  }
}
