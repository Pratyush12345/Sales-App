
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Services/database.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';

import '../../baseview.dart';

Database database = getIt<DatabaseImplementation>();

DualFuelSiteAddressCredential credential = DualFuelSiteAddressCredential();

class DualFuelSiteAddressAddProspectViewModel extends BaseModel {

  TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController postcode=TextEditingController();
  TextEditingController cityController=TextEditingController();
  bool autovalidation=false;



  void initialData() async {
    final data = await DFPref.getDualFuelSiteAddressValues();
    setState(ViewState.BUSY);

    if (data != null) {

    address1Controller.text = data.strSiteAddress1;
    cityController.text = data.strSiteTown;
    address2Controller.text = data.strSiteAddress2;
    postcode.text = data.strSitePostCode;
    }
    setState(ViewState.IDLE);
  }

  void onSaveAndNext() {
    setState(ViewState.BUSY);
    DFPref.setDualFuelSiteAddressValues(DualFuelSiteAddressCredential(
    strSiteAddress1 : address1Controller.text,
     strSiteTown: cityController.text,
     strSiteAddress2: address2Controller.text,
     strSitePostCode: postcode.text,


    ));
    setState(ViewState.IDLE);
  }
}