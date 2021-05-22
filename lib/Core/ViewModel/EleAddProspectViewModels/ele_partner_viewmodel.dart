import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePartnerCredential.dart';
import 'package:pozitive/Util/electricity_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';

Database database = getIt<DatabaseImplementation>();

ElePartnerCredential credential = ElePartnerCredential();

class ElePartnerAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController partnerName = TextEditingController();
  TextEditingController commonelectricitySCFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityDayFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityNightFixedCommision =
      TextEditingController();
  TextEditingController commonelectricityEWEFixedCommision =
      TextEditingController();

  TextEditingController electricitySCFixedCommision = TextEditingController();
  TextEditingController electricityDayFixedCommision = TextEditingController();
  TextEditingController electricityNightFixedCommision =
      TextEditingController();
  TextEditingController electricityEWEFixedCommision = TextEditingController();
  TextEditingController emailForNotification = TextEditingController();
  TextEditingController affiliateDetails = TextEditingController();

  int emailForNotificationSelected = 0;

  ProspectGetAddPartnerModel addPartnerModel;
  List<LStGetPartnerDetailForEmail> emailList = [];
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

  bool commissionType = false;

  void initialData() async {
    final data = await ElectricityPref.getElectricityPartnerValues();
    setState(ViewState.BUSY);

    if (data != null) {
      partnerName.text = data.elepartnerName;
      electricitySCFixedCommision.text = data.eleeleScFixed;
      electricityDayFixedCommision.text = data.eleeleDayFixed;
      electricityNightFixedCommision.text = data.eleeleNightFixed;
      electricityEWEFixedCommision.text = data.eleeleEweFixed;

      commonelectricitySCFixedCommision.text = data.elecommoneleScFixed;
      commonelectricityDayFixedCommision.text = data.elecommoneleDayFixed;
      commonelectricityNightFixedCommision.text = data.elecommoneleNightFixed;
      commonelectricityEWEFixedCommision.text = data.elecommoneleEweFixed;
      emailForNotification.text = data.eleadditionalEmail;
      affiliateDetails.text = data.eleaffiliateDetail;
      commissionType = data.elecommissionType != null
          ? bool.fromEnvironment(data.elecommissionType)
          : 0;
    }

    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    ElectricityPref.setElectricityPartnerValues(ElePartnerCredential(
      elepartnerName: partnerName.text,
      eleeleDayFixed: electricityDayFixedCommision.text,
      eleeleNightFixed: electricityNightFixedCommision.text,
      eleeleScFixed: electricitySCFixedCommision.text,
      eleeleEweFixed: electricityEWEFixedCommision.text,
      elecommoneleDayFixed: commonelectricityDayFixedCommision.text,
      elecommoneleNightFixed: commonelectricityNightFixedCommision.text,
      elecommoneleScFixed: commonelectricitySCFixedCommision.text,
      elecommoneleEweFixed: commonelectricityEWEFixedCommision.text,
      eleadditionalEmail: emailForNotification.text,
      eleaffiliateDetail: affiliateDetails.text,
      elecommissionType: commissionType.toString(),
    ));
    setState(ViewState.IDLE);
  }
}
