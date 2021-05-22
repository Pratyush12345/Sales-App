import 'dart:convert';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPartnerCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/insert-Add-prospect.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';

Database database = getIt<DatabaseImplementation>();

DualFuelPartnerCredential credential = DualFuelPartnerCredential();

class DualFuelPartnerAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController partnerName = TextEditingController();
  TextEditingController emailForNotification = TextEditingController();

  TextEditingController commonelectricitySCFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityDayFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityNightFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityEWEFixedCommision =
      TextEditingController();
  TextEditingController commongasFixedCommision = TextEditingController();
  TextEditingController commongasSCFixedCommision = TextEditingController();

  TextEditingController electricitySCFixedCommision = TextEditingController();
  TextEditingController electricityDayFixedCommision = TextEditingController();
  TextEditingController electricityNightFixedCommision =
      TextEditingController();
  TextEditingController electricityEWEFixedCommision = TextEditingController();
  TextEditingController gasFixedCommision = TextEditingController();
  TextEditingController gasSCFixedCommision = TextEditingController();

  int emailForNotificationSelected = 0;

  bool commissionType = false;

  ProspectGetAddPartnerModel addPartnerModel;

  List<LStGetPartnerDetailForEmail> emailList = [];

  List<SubUserList> affiliateList = [];

  void getGroupDetails(ProspectGetAddCredential credential) async {
    assert(credential != null);

    setState(ViewState.BUSY);

    final response = await database.getAddProspectService(credential);
    addPartnerModel = response;

    print('rrrrr${addPartnerModel.toJson()}  ==');
    if (isNotError(response)) {
      addPartnerModel = response;
      print(response);
    } else {
      print("error");
    }
    initialData();

    setState(ViewState.IDLE);
  }

  List notificationlist = [
    "Notification 1",
    "Notification 2",
    "Notification 3"
  ];

  Future getDualFuelPartnerProspect() async {
    setState(ViewState.BUSY);

    credential = await DFPref.getDualFuelPartnerValues();

    final response =
        await database.getDualFuelPartnerServices(DualFuelPartnerCredential());

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      DualFuelPartnerCredential _user =
          DuelFuelInsertAddProspectModel.fromJson(res['data'])
              as DualFuelPartnerCredential;

      credential = _user;
      print('#########electriccccccccccc${credential.partnerName}');
      DFPref.setDualFuelPartnerValues(credential);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  void initialData() async {
    final data = await DFPref.getDualFuelPartnerValues();
    setState(ViewState.BUSY);

    if (data != null) {
      partnerName.text = data.partnerName;
      electricitySCFixedCommision.text = data.eleScFixed;
      electricityDayFixedCommision.text = data.eleDayFixed;
      electricityNightFixedCommision.text = data.eleNightFixed;
      electricityEWEFixedCommision.text = data.eleEweFixed;
      gasFixedCommision.text = data.gasFixed;
      gasSCFixedCommision.text = data.gasScFixed;

      emailForNotification.text = data.additionalEmail;
      commissionType = data.commissionType != null
          ? bool.fromEnvironment(data.commissionType)
          : 0;
      commonelectricitySCFixedCommision.text = data.commoneleScFixed;
      commonelectricityDayFixedCommision.text = data.commoneleDayFixed;
      commonelectricityNightFixedCommision.text = data.commoneleNightFixed;
      commonelectricityEWEFixedCommision.text = data.commoneleEweFixed;
      commongasFixedCommision.text = data.commongasFixed;
      commongasSCFixedCommision.text = data.commongasScFixed;
      //notification list and email for notification selected is not present
    }
    // getGroupDetails(ProspectGetAddCredential(
    //     accountID: accountId, companyId: "1", customerId: "0"));
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    DFPref.setDualFuelPartnerValues(DualFuelPartnerCredential(
      partnerName: partnerName.text,
      commoneleDayFixed: commonelectricityDayFixedCommision.text,
      commoneleNightFixed: commonelectricityNightFixedCommision.text,
      commoneleScFixed: commonelectricitySCFixedCommision.text,
      commoneleEweFixed: commonelectricityEWEFixedCommision.text,
      commongasFixed: commongasFixedCommision.text,
      commongasScFixed: commongasSCFixedCommision.text,
      commissionType: commissionType.toString(),
      additionalEmail: emailForNotification.text,
      eleDayFixed: electricityDayFixedCommision.text,
      eleNightFixed: electricityNightFixedCommision.text,
      eleScFixed: electricitySCFixedCommision.text,
      eleEweFixed: electricityEWEFixedCommision.text,
      gasFixed: gasFixedCommision.text,
      gasScFixed: gasSCFixedCommision.text,
    ));
    setState(ViewState.IDLE);
  }
}
