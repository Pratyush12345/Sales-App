import 'dart:convert';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleSiteAddressCredential.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

EleSiteAddressCredential credential = EleSiteAddressCredential();

class EleSiteAddressAddProspectViewModel extends BaseModel {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool autovalidation = false;

  Future getEleSiteAddressProspect() async {
    setState(ViewState.BUSY);

    credential = await ElectricityPref.getElectricitySiteAddressValues();

    final response = await database
        .eleSiteAddressInsertAddProspectService(EleSiteAddressCredential());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      EleSiteAddressCredential _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as EleSiteAddressCredential;

      credential = _user;
      print(
          '----------Electricity Site Address---------${credential.strSiteAddress1}');
      ElectricityPref.setElectricitySiteAddressValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void initialData() async {
    final data = await ElectricityPref.getElectricitySiteAddressValues();
    setState(ViewState.BUSY);

    if (data != null) {
      address1Controller.text = data.strSiteAddress1;
      address2Controller.text = data.strSiteAddress2;
      postcode.text = data.strSitePostCode!=null?data.strSitePostCode.toString():'';
      cityController.text = data.strSiteTown;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    ElectricityPref.setElectricitySiteAddressValues(EleSiteAddressCredential(
      strSiteAddress1: address1Controller.text,
      strSiteAddress2: address2Controller.text,
      strSitePostCode: postcode.text.toString(),
      strSiteTown: cityController.text,
    ));
    setState(ViewState.IDLE);
  }
}
