import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:flutter/material.dart';

import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/GasCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Util/PrefBusinessType/PrefBusinessType.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/BusinessOwnershipDetailsCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';
import 'package:pozitive/Core/enums/view_state.dart';

class AddProspectClearTab extends BaseModel {
  // DualFuelELECTRICITYCredential electricity;
  // DualFuelGasCredential gas;
  // DualFuelBusinessCredential business;
  // DualFuelSiteAddressCredential siteAdd;
  // DualFuelBillingAddressCredential billingadd;
  // DualFuelAccountManagerCredential acManager;
  // DualFuelPaymentCredential paymentDetail;
  // SoleBusinessCredential soleBusinessType;
  // OtherBusinessCredential otherBusinessType;
  // LtdBusinessCredential ltdBusinessType;
  // CharityBusinessCredential charityBusinessType;
  // LLPBusinessCredential llpBusinessType;
  // LLCBusinessCredential llcBusinessType;
  // PartnerShipBusinessCredential partnerShipType;

  void clearDataFromPref() async {
    DFPref.clearDFEleValues();
    DFPref.clearDFGasValues();
    DFPref.clearDFBusinessValues();
    DFPref.clearDFSiteAddValues();
    DFPref.clearDFBillAddValues();
    BusinessTypePref.clearDFOtherBusinessTypeAdd();
    BusinessTypePref.clearDFLtdBusiness();
    BusinessTypePref.clearDFCharityBusiness();
    BusinessTypePref.clearDFLLPBusiness();
    BusinessTypePref.clearDFLLCBusiness();
    BusinessTypePref.clearDFSoleBusiness();
    BusinessTypePref.clearDFPartnerBusiness();
    DFPref.clearDFPrimaryContactValues();
    DFPref.clearDFEAMValues();
    DFPref.clearDFPaymentValues();
    DFPref.clearDFPartnerValues();
    DFPref.clearDFGroupValues();
  }
}
