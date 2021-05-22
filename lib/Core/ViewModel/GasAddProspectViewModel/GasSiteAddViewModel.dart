
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_SiteAdd_Credential.dart';
import 'package:pozitive/Util/gas_Pref.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

GasSiteAddressCredential credential = GasSiteAddressCredential();

class GasSiteAddAddProspectViewModel extends BaseModel {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool autovalidation = false;

  void initialData() async {
    final data = await GasPref.getGasSiteAddressValues();
    setState(ViewState.BUSY);

    if (data != null) {
      address1Controller.text = data.strSiteAddress1;
      address2Controller.text = data.strSiteAddress2;
      cityController.text = data.strSiteTown;
      postcode.text = data.strSitePostCode;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    GasPref.setGasSiteAddressValues(GasSiteAddressCredential(
      strSiteAddress1: address1Controller.text,
      strSiteAddress2: address2Controller.text,
      strSiteTown: cityController.text,
      strSitePostCode: postcode.text,
    ));
    setState(ViewState.IDLE);
  }
}
