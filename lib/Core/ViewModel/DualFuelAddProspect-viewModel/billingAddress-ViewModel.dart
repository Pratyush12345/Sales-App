import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';

import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

DualFuelBillingAddressCredential credential =
    DualFuelBillingAddressCredential();

class DualFuelBillingAddressAddProspectViewModel extends BaseModel {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcode = TextEditingController();
  bool autovalidation = false;

  bool sameAddress = false;

  int billingtermType = 1;

  DualFuelSiteAddressCredential sitAddress;

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
    sitAddress = await DFPref.getDualFuelSiteAddressValues();
    final data = await DFPref.getDualFuelBillingAddressValues();
    setState(ViewState.BUSY);

    if (data != null) {
      address1Controller.text = data.strBillAddress1;
      address2Controller.text = data.strBillAddress2;
      cityController.text = data.strSiteTown;
      postcode.text = data.strBillPostCode;
      if (data.sameAsSite == 'true') {
        sameAddress = true;
      }
      billingtermType = data.strBillinTermType != null
          ? int.parse(data.strBillinTermType)
          : 0;

      //Same address data is not present
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);

    DFPref.setDualFuelBillingAddressValues(DualFuelBillingAddressCredential(
      strBillAddress1: address1Controller.text,
      strBillAddress2: address2Controller.text,
      strSiteTown: cityController.text,
      strBillPostCode: postcode.text,
      strBillinTermType: billingtermType.toString(),
      sameAsSite: sameAddress.toString(),

      //AQcharge
    ));
    setState(ViewState.IDLE);
  }
}
