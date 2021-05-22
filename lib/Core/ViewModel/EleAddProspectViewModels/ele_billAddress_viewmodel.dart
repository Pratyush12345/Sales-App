import 'dart:convert';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBillAddCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleSiteAddressCredential.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

EleBillAddCredential credential = EleBillAddCredential();

class EleBillAddressAddProspectViewModel extends BaseModel {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcode = TextEditingController();
  bool autovalidation = false;

  bool sameAddress = false;
  EleSiteAddressCredential sitAddress;

  int billingtermType = 1;

  Future getEleBillProspect() async {
    setState(ViewState.BUSY);

    credential = await ElectricityPref.getElectricityBillingAddressValues();

    final response = await database
        .eleBillingAddressInsertAddProspectService(EleBillAddCredential());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      EleBillAddCredential _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as EleBillAddCredential;

      credential = _user;
      print('#########electriccccccccccc${credential.elestrBillAddress1}');
      ElectricityPref.setElectricityBillingAddressValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void onToggleSameAddress() {
    sameAddress = !sameAddress;
    setState(ViewState.BUSY);

    if (sameAddress) {
      address1Controller.text = sitAddress.strSiteAddress1;
      address2Controller.text = sitAddress.strSiteAddress2;
      cityController.text = sitAddress.strSiteTown;
      postcode.text = sitAddress.strSitePostCode;
    }

    setState(ViewState.IDLE);
  }

  void initialData() async {
    sitAddress = await ElectricityPref.getElectricitySiteAddressValues();
    final data = await ElectricityPref.getElectricityBillingAddressValues();
    setState(ViewState.BUSY);

    if (data != null) {
      address1Controller.text = data.elestrBillAddress1;
      address2Controller.text = data.elestrBillAddress2;
      cityController.text = data.eletown1;
      postcode.text = data.elestrBillPostCode;

      if (data.elesameAsSite == 'true') {
        sameAddress = true;
      }
      billingtermType = data.elestrBillinTermType != null
          ? int.parse(data.elestrBillinTermType)
          : 0;

      //Same address data is not present
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    ElectricityPref.setElectricityBillingAddressValues(EleBillAddCredential(
      elestrBillAddress1: address1Controller.text,
      elestrBillAddress2: address2Controller.text,
      eletown1: cityController.text,
      elestrBillPostCode: postcode.text,
      elestrBillinTermType: billingtermType.toString(),
      elesameAsSite: sameAddress.toString(),
    ));
    setState(ViewState.IDLE);
  }
}
