
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_EAM_Credential.dart';
import 'package:pozitive/Util/gas_Pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

GasEAMCredential credential = GasEAMCredential();

class GasEAMAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mobile = TextEditingController();
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email.text);
  }
  void initialData() async {
    final data = await GasPref.getGasEAMValues();
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
    GasPref.setGasEAMValues(GasEAMCredential(
      strEAName: name.text,
      strEAEmail: email.text,
      strEAPhoneNo: phone.text,
      strEAMobileNo: mobile.text,
    ));
    setState(ViewState.IDLE);
  }
}
