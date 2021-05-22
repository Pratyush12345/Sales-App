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

class EAMViewModel extends BaseModel {
  Database database = getIt<DatabaseImplementation>();

  TextEditingController contractEamName = TextEditingController();
  TextEditingController contractEamEmail = TextEditingController();
  TextEditingController contractEamPhone = TextEditingController();
  TextEditingController contractEamMobile = TextEditingController();

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    IndividualContractPref.setContractEam(
      SaveAndGenerateContractAddMethodCredential(
        strFullName: contractEamName.text,
        strEmailHome: contractEamEmail.text,
        strPhoneHome: contractEamPhone.text,
        MobileNo: contractEamMobile.text,
      ),
    );
    setState(ViewState.IDLE);
    globals.tabController6.animateTo(5);
  }

  void setDetails(SaveAndGenerateContractIndividualModel individualModel) {
    setState(ViewState.BUSY);
    contractEamMobile.text = individualModel.mobileNo;
    contractEamPhone.text = individualModel.strPhoneHome;
    contractEamEmail.text = individualModel.strEmailHome;
    contractEamName.text = individualModel.strFullName;
    setState(ViewState.IDLE);
  }
}
