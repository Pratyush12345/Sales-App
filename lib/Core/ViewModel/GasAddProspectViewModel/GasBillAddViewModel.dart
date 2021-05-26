import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_BillAdd_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_SiteAdd_Credential.dart';
import 'package:pozitive/Util/gas_pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

GasBillAddCredential credential = GasBillAddCredential();

class GasBillAddAddProspectViewModel extends BaseModel {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcode = TextEditingController();
  bool autovalidation = false;
  GasSiteAddressCredential sitAddress;

  bool sameAddress = false;

  int billingtermType = 1;

  void onToggleSameAddress() {
    sameAddress = !sameAddress;
    setState(ViewState.BUSY);
    //print(sitAddress.strSiteAddress1);
    if (sameAddress) {
      print(sitAddress.strSiteAddress1);
      address1Controller.text = sitAddress.strSiteAddress1;
      address2Controller.text = sitAddress.strSiteAddress2;
      cityController.text = sitAddress.strSiteTown;
      postcode.text = sitAddress.strSitePostCode;
    }

    setState(ViewState.IDLE);
  }

  void initialData() async {
    sitAddress = await GasPref.getGasSiteAddressValues();
    final data = await GasPref.getGasBillAddValues();
    setState(ViewState.BUSY);

    if (data != null) {
      address1Controller.text = data.strBillAddress1;
      address2Controller.text = data.strBillAddress2;
      cityController.text = data.town1;
      postcode.text = data.strBillPostCode;
      if (data.sameAsSite == 'true') {
        sameAddress = true;
      }
      billingtermType = data.strBillinTermType != null
          ? int.parse(data.strBillinTermType)
          : 0;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    GasPref.setGasBillAddValues(GasBillAddCredential(
      strBillAddress1: address1Controller.text,
      sameAsSite: sameAddress.toString(),
      town1: cityController.text,
      strBillAddress2: address2Controller.text,
      strBillPostCode: postcode.text,
      strBillinTermType: billingtermType.toString(),
    ));
    setState(ViewState.IDLE);
  }
}
