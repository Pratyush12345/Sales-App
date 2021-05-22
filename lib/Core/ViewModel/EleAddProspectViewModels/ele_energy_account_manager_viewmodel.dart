import 'dart:convert';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEAMCredential.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

EleEAMCredential credential = EleEAMCredential();

class EleEAMAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mobile = TextEditingController();

  Future getEleEAMProspect() async {
    setState(ViewState.BUSY);

    credential = await ElectricityPref.getElectricityEAMValues();

    final response =
        await database.eleEAMInsertAddProspectService(EleEAMCredential());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      EleEAMCredential _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as EleEAMCredential;

      credential = _user;
      print('#########electriccccccccccc${credential.strEAName}');
      ElectricityPref.setElectricityEAMValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void initialData() async {
    final data = await ElectricityPref.getElectricityEAMValues();
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
    ElectricityPref.setElectricityEAMValues(EleEAMCredential(
      strEAName: name.text,
      strEAEmail: email.text,
      strEAPhoneNo: phone.text,
      strEAMobileNo: mobile.text,
    ));
    setState(ViewState.IDLE);
  }
}
