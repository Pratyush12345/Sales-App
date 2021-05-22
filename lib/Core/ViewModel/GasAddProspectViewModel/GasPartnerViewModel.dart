import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Partner_Credential.dart';
import 'package:pozitive/Util/gas_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';
import 'package:pozitive/Core/Model/InsertAddProspect/GetAddProspectModel.dart';
import 'package:pozitive/Core/Model/Api/InsertAddProspect/ProspectGetAddPartnerCredetial.dart';

Database database = getIt<DatabaseImplementation>();

GasPartnerCredential credential = GasPartnerCredential();

class GasPartnerAddProspectViewModel extends BaseModel {
  bool autovalidation = false;
  TextEditingController partnerName = TextEditingController();
  TextEditingController commongasFixedCommision = TextEditingController();
  TextEditingController commongasSCFixedCommision = TextEditingController();

  TextEditingController gasFixedCommision = TextEditingController();
  TextEditingController gasSCFixedCommision = TextEditingController();
  TextEditingController emailForNotification = TextEditingController();
  TextEditingController affiliateDetail = TextEditingController();

  int emailForNotificationSelected = 0;

  bool commissionType = false;
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

  List notificationlist = [
    "Notification 1",
    "Notification 2",
    "Notification 3"
  ];

  void initialData() async {
    final data = await GasPref.getGasPartnerValues();
    setState(ViewState.BUSY);

    if (data != null) {
      partnerName.text = data.partnerName ?? "";
      gasSCFixedCommision.text = data.gasScFixed;
      gasFixedCommision.text = data.gasFixed;
      commongasSCFixedCommision.text = data.commongasScFixed;
      commongasFixedCommision.text = data.commongasFixed;
      emailForNotification.text = data.additionalEmail;
      affiliateDetail.text = data.affiliateDetail;
      commissionType = data.commissionType != null
          ? bool.fromEnvironment(data.commissionType)
          : 0;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    GasPref.setGasPartnerValues(GasPartnerCredential(
      partnerName: partnerName.text,
      gasFixed: gasFixedCommision.text,
      gasScFixed: gasSCFixedCommision.text,
      commongasFixed: commongasFixedCommision.text,
      commongasScFixed: commongasSCFixedCommision.text,
      commissionType: commissionType.toString(),
      additionalEmail: emailForNotification.text,
      affiliateDetail: affiliateDetail.text,
    ));
    setState(ViewState.IDLE);
  }
}
