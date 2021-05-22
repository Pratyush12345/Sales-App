import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

DualFuelAccountManagerCredential credential =
    DualFuelAccountManagerCredential();

class AccountManagerDualFuelViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mobile = TextEditingController();

  void initialData() async {
    final data = await DFPref.getDualFuelAccountManagerValues();
    setState(ViewState.BUSY);

    if (data != null) {
      name.text = data.strEAName;
      email.text = data.strEAEmail;
      phone.text = data.strEAPhoneNo;
      mobile.text = data.strEAMobileNo;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    DFPref.setDualFuelAccountManagerValues(DualFuelAccountManagerCredential(
      strEAName: name.text,
      strEAEmail: email.text,
      strEAPhoneNo: phone.text,
      strEAMobileNo: mobile.text,
    ));
    setState(ViewState.IDLE);
  }
}
