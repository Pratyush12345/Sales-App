import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelGroupCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPartnerCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/GasCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/PrimaryContactCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DFPref {
  //Electricity getDualFuel

  static Future<DualFuelELECTRICITYCredential> getDualFuelEleValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print('get duel fuel ele called');
    String dffullMpan = preferences.getString("DFELEFullMpan");
    String dfmpanCodeController =
        preferences.getString('DFELEmpanCodeController');
    String dfbusinessController1 =
        preferences.getString("DFELEbusinessController1");
    String dfbusinessController2 =
        preferences.getString("DFELEbusinessController2");
    String dfbusinessController3 =
        preferences.getString("DFELEbusinessController3");
    String dfbusinessController4 =
        preferences.getString("DFELEbusinessController4");
    String dfbusinessController5 =
        preferences.getString("DFELEbusinessController5");
    String dfbusinessController6 =
        preferences.getString("DFELEbusinessController6");

    String dfwholeMpan = preferences.getString("ELEWholeMpan");

    String dfrhtMpanCodeController =
        preferences.getString("DFELErhtMpanCodeController");
    String dfrhtBusinessController1 =
        preferences.getString("DFELErhtBusinessController1");
    String dfrhtBusinessController2 =
        preferences.getString("DFELErhtBusinessController2");
    String dfrhtBusinessController3 =
        preferences.getString("DFELErhtBusinessController3");
    String dfrhtBusinessController4 =
        preferences.getString("DFELErhtBusinessController4");
    String dfrhtBusinessController5 =
        preferences.getString("DFELErhtBusinessController5");
    String dfrhtBusinessController6 =
        preferences.getString("DFELErhtBusinessController6");
    String rhtStandingCharge = preferences.getString("DFELErhtStandingCharge");
    String rhtNightUnit = preferences.getString("DFELErhtNightUnit");
    String rhtNightEac = preferences.getString("DFELErhtNightEac");
    String dfwholeRHTMpan = preferences.getString("DFELEwholeRHTMpan");
    String dffullMpanRHT = preferences.getString("DFELEfullMpanRHT");

    String dfcontractStartDate =
        preferences.getString("DFEleEleContractStartDate");
    String dfcontractEndDate = preferences.getString("DFEleEleContractEndDate");

    String dfOthercontractEndDate =
        preferences.getString("DFOthercontractEndDate");

    String dfstandingCharge = preferences.getString("DFEleEleStandingCharge");
    String dfdayUnitCharge = preferences.getString("DFEleEleDayUnit");
    String dfnightUnitCharge = preferences.getString("DFEleEleNightUnit");
    String dfeweUnitCharge = preferences.getString("DFEleEleEWEUnit");
    String dfcapacityCharge = preferences.getString("DFEleEleCapacityCharge");
    String dfexcessCapacityCharge =
        preferences.getString("DFEleEleExcessCapacity");
    String dfemrCharge = preferences.getString("DFEleEleEMRCharge");
    String dfenergizationStatus =
        preferences.getString("DFEleEleEnergizationStatus");
    String dfdayEac = preferences.getString("DFEleEleDayEac");
    String dfnightEac = preferences.getString("DFEleEleNightEac");
    String dfeveEac = preferences.getString("DFEleEleEveEac");
    String dfsiteCapacity = preferences.getString("DFEleEleSiteCharge");
    String dfreactiveCharges = preferences.getString("DFEleEleReactiveCharge");
    String dffitCharge = preferences.getString("DFEleEleFitCharge");
    String dfnewConnection = preferences.getString("DFEleEleNewConn");
    String dfrhtCheckBox = preferences.getString("DFRHTCheckbox");
    String dfbteCustomerMop = preferences.getString("DFEleEleMopCustomer");
    String dfbteCustomerDaDc = preferences.getString("DFEleEleMopCustomerDADC");

    print('#####Dual Fuel Electricity########$dffullMpanRHT');
    print('#####Dual Fuel Electricity########$dfwholeMpan');
    if (dffullMpan != null) {
      return new DualFuelELECTRICITYCredential(
        dfmpanCodeController: dfmpanCodeController,
        dfwholeMpan: dfwholeMpan,
        dfwholeRHTMpan: dfwholeRHTMpan,
        dffullMpanRHT: dffullMpanRHT,
        dfrhtcheckbox: dfrhtCheckBox,
        dffullMpan: dffullMpan,
        dfbusinessController1: dfbusinessController1,
        dfbusinessController2: dfbusinessController2,
        dfbusinessController3: dfbusinessController3,
        dfbusinessController4: dfbusinessController4,
        dfbusinessController5: dfbusinessController5,
        dfbusinessController6: dfbusinessController6,
        dfrhtMpanCodeController: dfrhtMpanCodeController,
        dfrhtBusinessController1: dfrhtBusinessController1,
        dfrhtBusinessController2: dfrhtBusinessController2,
        dfrhtBusinessController3: dfrhtBusinessController3,
        dfrhtBusinessController4: dfrhtBusinessController4,
        dfrhtBusinessController5: dfrhtBusinessController5,
        dfrhtBusinessController6: dfrhtBusinessController6,
        rhtStandingCharge: rhtStandingCharge,
        rhtNightUnit: rhtNightUnit,
        rhtNightEac: rhtNightEac,
        dfdteElecStartDate: dfcontractStartDate,
        dfdtContractEndDateEle: dfcontractEndDate,
        dfOthercontractEndDate: dfOthercontractEndDate,
        dfstrStandingCharge: dfstandingCharge,
        dfstrDayUnit: dfdayUnitCharge,
        dfstrNightUnit: dfnightUnitCharge,
        dfstrEWEUnit: dfeweUnitCharge,
        dfstrCapacitycharges: dfcapacityCharge,
        dfstrExceesCapacityCharegs: dfexcessCapacityCharge,
        dfstrEMRCFD: dfemrCharge,
        dfstrEnergizationstatus: dfenergizationStatus,
        dfelectricityDay_EAC: dfdayEac,
        dfelectricityNight_EAC: dfnightEac,
        dfelectricityEvening_EAC: dfeveEac,
        dfstrSiteCharge: dfsiteCapacity,
        dfstrReactiveCharges: dfreactiveCharges,
        dfstrFITcharge: dffitCharge,
        dfstrNewConnection: dfnewConnection,
        dfbteMopCustomer: dfbteCustomerMop,
        dfbteMopDADCCustomer: dfbteCustomerDaDc,
      );
    } else {
      return null;
    }
  }

  static void clearDFEleValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("DFELEFullMpan", null);
  }

//Electricity setDualFuel
  static void setDualFuelEleValues(
      DualFuelELECTRICITYCredential eleCredential) async {
    print(eleCredential.toJson());
    // print(eleCredential.dteElecStartDate);
    print('set dual fuel ele called');
    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleCredential.dfmpanCodeController != null) {
      sharedPreferences.setString(
          "DFELEmpanCodeController", eleCredential.dfmpanCodeController);
    }

    if (eleCredential.dfwholeMpan != null) {
      sharedPreferences.setString("DFELEWholeMpan", eleCredential.dfwholeMpan);
    }
    if (eleCredential.dffullMpan != null) {
      sharedPreferences.setString("DFELEFullMpan", eleCredential.dfwholeMpan);
    }
    if (eleCredential.dfbusinessController1 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController1", eleCredential.dfbusinessController1);
    }
    if (eleCredential.dfbusinessController2 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController2", eleCredential.dfbusinessController2);
    }
    if (eleCredential.dfbusinessController3 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController3", eleCredential.dfbusinessController3);
    }
    if (eleCredential.dfbusinessController4 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController4", eleCredential.dfbusinessController4);
    }
    if (eleCredential.dfbusinessController5 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController5", eleCredential.dfbusinessController5);
    }
    if (eleCredential.dfbusinessController6 != null) {
      sharedPreferences.setString(
          "DFELEbusinessController6", eleCredential.dfbusinessController6);
    }

    if (eleCredential.dfOthercontractEndDate != null) {
      sharedPreferences.setString(
          "DFOthercontractEndDate", eleCredential.dfOthercontractEndDate);
    }
    /////////////
    if (eleCredential.dfrhtMpanCodeController != null) {
      sharedPreferences.setString(
          "DFELErhtMpanCodeController", eleCredential.dfrhtMpanCodeController);
    }

    if (eleCredential.dfwholeRHTMpan != null) {
      sharedPreferences.setString(
          "DFELEwholeRHTMpan", eleCredential.dfwholeRHTMpan);
    }
    if (eleCredential.dffullMpanRHT != null) {
      sharedPreferences.setString(
          "DFELEfullMpanRHT", eleCredential.dffullMpanRHT);
    }
    if (eleCredential.dfrhtBusinessController1 != null) {
      sharedPreferences.setString("DFELErhtBusinessController1",
          eleCredential.dfrhtBusinessController1);
    }
    if (eleCredential.dfrhtBusinessController2 != null) {
      sharedPreferences.setString("DFELErhtBusinessController2",
          eleCredential.dfrhtBusinessController2);
    }
    if (eleCredential.dfrhtBusinessController3 != null) {
      sharedPreferences.setString("DFELErhtBusinessController3",
          eleCredential.dfrhtBusinessController3);
    }
    if (eleCredential.dfrhtBusinessController4 != null) {
      sharedPreferences.setString("DFELErhtBusinessController4",
          eleCredential.dfrhtBusinessController4);
    }
    if (eleCredential.dfrhtBusinessController5 != null) {
      sharedPreferences.setString("DFELErhtBusinessController5",
          eleCredential.dfrhtBusinessController5);
    }
    if (eleCredential.dfrhtBusinessController6 != null) {
      sharedPreferences.setString("DFELErhtBusinessController6",
          eleCredential.dfrhtBusinessController6);
    }

    if (eleCredential.rhtStandingCharge != null) {
      sharedPreferences.setString(
          "DFELErhtStandingCharge", eleCredential.rhtStandingCharge);
    }
    if (eleCredential.rhtNightUnit != null) {
      sharedPreferences.setString(
          "DFELErhtNightUnit", eleCredential.rhtNightUnit);
    }
    if (eleCredential.rhtNightEac != null) {
      sharedPreferences.setString(
          "DFELErhtNightEac", eleCredential.rhtNightEac);
    }
    //////////

    if (eleCredential.dfrhtcheckbox != null) {
      sharedPreferences.setString(
          "DFELERHTCheckbox", eleCredential.dfrhtcheckbox);
    }
    if (eleCredential.dfdteElecStartDate != null) {
      sharedPreferences.setString(
          "DFEleEleContractStartDate", eleCredential.dfdteElecStartDate);
    }
    if (eleCredential.dfdtContractEndDateEle != null) {
      sharedPreferences.setString(
          "DFEleEleContractEndDate", eleCredential.dfdtContractEndDateEle);
    }
    if (eleCredential.dfstrStandingCharge != null) {
      sharedPreferences.setString(
          "DFEleEleStandingCharge", eleCredential.dfstrStandingCharge);
    }
    if (eleCredential.dfstrDayUnit != null) {
      sharedPreferences.setString(
          "DFEleEleDayUnit", eleCredential.dfstrDayUnit);
    }
    if (eleCredential.dfstrNightUnit != null) {
      sharedPreferences.setString(
          "DFEleEleNightUnit", eleCredential.dfstrNightUnit);
    }
    if (eleCredential.dfstrEWEUnit != null) {
      sharedPreferences.setString(
          "DFEleEleEWEUnit", eleCredential.dfstrEWEUnit);
    }
    if (eleCredential.dfstrCapacitycharges != null) {
      sharedPreferences.setString(
          "DFEleEleCapacityCharge", eleCredential.dfstrCapacitycharges);
    }
    if (eleCredential.dfstrExceesCapacityCharegs != null) {
      sharedPreferences.setString(
          "DFEleEleExcessCapacity", eleCredential.dfstrExceesCapacityCharegs);
    }
    if (eleCredential.dfstrEMRCFD != null) {
      sharedPreferences.setString(
          "DFEleEleEMRCharge", eleCredential.dfstrEMRCFD);
    }
    if (eleCredential.dfstrEnergizationstatus != null) {
      sharedPreferences.setString(
          "DFEleEleEnergizationStatus", eleCredential.dfstrEnergizationstatus);
    }
    if (eleCredential.dfelectricityDay_EAC != null) {
      sharedPreferences.setString(
          "DFEleEleDayEac", eleCredential.dfelectricityDay_EAC);
    }
    if (eleCredential.dfelectricityNight_EAC != null) {
      sharedPreferences.setString(
          "DFEleEleNightEac", eleCredential.dfelectricityNight_EAC);
    }
    if (eleCredential.dfelectricityEvening_EAC != null) {
      sharedPreferences.setString(
          "DFEleEleEveEac", eleCredential.dfelectricityEvening_EAC);
    }
    // //site capacity not present
    if (eleCredential.dfstrSiteCharge != null) {
      sharedPreferences.setString(
          "DFEleEleSiteCharge", eleCredential.dfstrSiteCharge);
    }
    if (eleCredential.dfstrReactiveCharges != null) {
      sharedPreferences.setString(
          "DFEleEleReactiveCharge", eleCredential.dfstrReactiveCharges);
    }
    if (eleCredential.dfstrFITcharge != null) {
      sharedPreferences.setString(
          "DFEleEleFitCharge", eleCredential.dfstrFITcharge);
    }
    if (eleCredential.dfstrNewConnection != null) {
      sharedPreferences.setString(
          "DFEleEleNewConn", eleCredential.dfstrNewConnection);
    }
    if (eleCredential.dfrhtcheckbox != null) {
      sharedPreferences.setString(
          "DFEleEleRhtCheckbox", eleCredential.dfrhtcheckbox);
    }
    if (eleCredential.dfbteMopCustomer != null) {
      sharedPreferences.setString(
          "DFEleEleMopCustomer", eleCredential.dfbteMopCustomer);
    }
    if (eleCredential.dfbteMopDADCCustomer != null) {
      sharedPreferences.setString(
          "DFEleEleMopCustomerDADC", eleCredential.dfbteMopDADCCustomer);
    }
  }

//DualFuel Gas getDualFuel

  static Future<DualFuelGasCredential> getDualFuelGasValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String GasMprn = preferences.getString("dfGasMprn");
    String GasStartDate = preferences.getString("dfGasStartDate");
    String gasEndDate = preferences.getString("dfgasEndDate");
    //GasEndDate String StandingCharge = preferences.getString("dfGasEndDate");
    String GasStandingCharge = preferences.getString("dfGasStandingCharge");
    String GasUnitCharge = preferences.getString("dfGasUnitCharge");
    String aqCharge = preferences.getString("dfaqCharge");
    String dfgascontractEndDateOther =
        preferences.getString("dfgascontractEndDate");

//DualFuel AQCharge
    print('##### Dual Fuel Gas ########$GasStartDate');
    if (GasMprn != null) {
      return new DualFuelGasCredential(
        fullMprn: GasMprn,
        dfdteGasStartDate: GasStartDate,
        strStandingChargeGas: GasStandingCharge,
        strUnitPriceGas: GasUnitCharge,
        aqCharge: aqCharge,
        dfgasEndDate: gasEndDate,
        dfgascontractEndDate: dfgascontractEndDateOther,
      );
    } else {
      return null;
    }
  }

  static void clearDFGasValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfGasMprn", null);
  }

//DualFuel Gas setDualFuel
  static void setDualFuelGasValues(DualFuelGasCredential gasCredential) async {
    print(gasCredential.toJson());
    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasCredential.fullMprn != null) {
      sharedPreferences.setString("dfGasMprn", gasCredential.fullMprn);
    }
    if (gasCredential.dfgasEndDate != null) {
      sharedPreferences.setString("dfgasEndDate", gasCredential.dfgasEndDate);
    }
    if (gasCredential.aqCharge != null) {
      sharedPreferences.setString("dfaqCharge", gasCredential.aqCharge);
    }

    if (gasCredential.dfdteGasStartDate != null) {
      sharedPreferences.setString(
          "dfGasStartDate", gasCredential.dfdteGasStartDate);
    }
    if (gasCredential.dfgascontractEndDate != null) {
      sharedPreferences.setString(
          "dfgascontractEndDate", gasCredential.dfgascontractEndDate);
    }
//EndDate//////////
    /*   if (dualFuelInsertAddProspectCredential.contract != null) {
      sharedPreferences.setString("End Date",
          dualFuelInsertAddProspectCredential.dteGasStartDate);
    }*/
    if (gasCredential.strStandingChargeGas != null) {
      sharedPreferences.setString(
          "dfGasStandingCharge", gasCredential.strStandingChargeGas);
    }
    if (gasCredential.strUnitPriceGas != null) {
      sharedPreferences.setString(
          "dfGasUnitCharge", gasCredential.strUnitPriceGas);
    }
//DualFuel AQCHarge
    /*  if (dualFuelInsertAddProspectCredential.aQCharge != null) {
      sharedPreferences.setString(
          "nightUnitCharge", dualFuelInsertAddProspectCredential.strNightUnit);
    }
*/

    sharedPreferences.commit();
  }

//DualFuel BusinessDetails getDualFuel

  static Future<DualFuelBusinessCredential>
      getDualFuelBusinessDetailsValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String Business_Name = preferences.getString("dfbusiness_Name");
    String Business_Type = preferences.getString("dfbusiness_Type");
    String Alternative_Number = preferences.getString("dfalternative_Number");
    String Email = preferences.getString("dfemail");
    String StrNameOfBill = preferences.getString("dfstrNameOfBill");
    String StrSupplyName = preferences.getString("dfstrSupplyName");
    String StrCompanyRegNo = preferences.getString("dfstrCompanyRegNo");
    String StrEAMobileNo = preferences.getString("dfstrEAMobileNo");
    String RegisteredCompanyName =
        preferences.getString("dfregisteredCompanyName");
    String BtePaperBill = preferences.getString("dfbtePaperBill");
    String Btemicrobuisnes = preferences.getString("dfbtemicrobuisnes");
    String StrPropertOwnerShip = preferences.getString("dfstrPropertOwnerShip");
    String StrCustomerRefNo = preferences.getString("dfstrCustomerRefNo");

    print('#####Dual Fuel Bussiness########$Business_Type');
    if (Business_Name != null) {
      return new DualFuelBusinessCredential(
          business_Name: Business_Name,
          business_Type: Business_Type,
          alternative_Number: Alternative_Number,
          email: Email,
          strNameOfBill: StrNameOfBill,
          strSupplyName: StrSupplyName,
          strCompanyRegNo: StrCompanyRegNo,
          strEAMobileNo: StrEAMobileNo,
          registeredCompanyName: RegisteredCompanyName,
          btePaperBill: BtePaperBill,
          btemicrobuisnes: Btemicrobuisnes,
          strPropertOwnerShip: StrPropertOwnerShip,
          strCustomerRefNo: StrCustomerRefNo);
    } else {
      return null;
    }
  }

  static void clearDFBusinessValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfbusiness_Name", null);
  }

//DualFuel BusinessDetails setDualFuel
  static void setDualFuelBusinessDetailsValues(
      DualFuelBusinessCredential dualFuelInsertAddProspectCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    print(dualFuelInsertAddProspectCredential.toJson());

    if (dualFuelInsertAddProspectCredential.business_Name != null) {
      sharedPreferences.setString(
          "dfbusiness_Name", dualFuelInsertAddProspectCredential.business_Name);
    }

    if (dualFuelInsertAddProspectCredential.business_Type != null) {
      sharedPreferences.setString(
          "dfbusiness_Type", dualFuelInsertAddProspectCredential.business_Type);
    }
    if (dualFuelInsertAddProspectCredential.alternative_Number != null) {
      sharedPreferences.setString("dfalternative_Number",
          dualFuelInsertAddProspectCredential.alternative_Number);
    }
    if (dualFuelInsertAddProspectCredential.email != null) {
      sharedPreferences.setString(
          "dfemail", dualFuelInsertAddProspectCredential.email);
    }
    if (dualFuelInsertAddProspectCredential.strNameOfBill != null) {
      sharedPreferences.setString(
          "dfstrNameOfBill", dualFuelInsertAddProspectCredential.strNameOfBill);
    }

    if (dualFuelInsertAddProspectCredential.strSupplyName != null) {
      sharedPreferences.setString(
          "dfstrSupplyName", dualFuelInsertAddProspectCredential.strSupplyName);
    }

    if (dualFuelInsertAddProspectCredential.strCompanyRegNo != null) {
      sharedPreferences.setString("dfstrCompanyRegNo",
          dualFuelInsertAddProspectCredential.strCompanyRegNo);
    }
    if (dualFuelInsertAddProspectCredential.strEAMobileNo != null) {
      sharedPreferences.setString(
          "dfstrEAMobileNo", dualFuelInsertAddProspectCredential.strEAMobileNo);
    }
    if (dualFuelInsertAddProspectCredential.registeredCompanyName != null) {
      sharedPreferences.setString("dfregisteredCompanyName",
          dualFuelInsertAddProspectCredential.registeredCompanyName);
    }
    if (dualFuelInsertAddProspectCredential.btePaperBill != null) {
      sharedPreferences.setString(
          "dfbtePaperBill", dualFuelInsertAddProspectCredential.btePaperBill);
    }
    if (dualFuelInsertAddProspectCredential.btemicrobuisnes != null) {
      sharedPreferences.setString("dfbtemicrobuisnes",
          dualFuelInsertAddProspectCredential.btemicrobuisnes);
    }
    if (dualFuelInsertAddProspectCredential.strPropertOwnerShip != null) {
      sharedPreferences.setString("dfstrPropertOwnerShip",
          dualFuelInsertAddProspectCredential.strPropertOwnerShip);
    }
    if (dualFuelInsertAddProspectCredential.strCustomerRefNo != null) {
      sharedPreferences.setString("dfstrCustomerRefNo",
          dualFuelInsertAddProspectCredential.strCustomerRefNo);
    }

    sharedPreferences.commit();
  }

//DualFuel SiteAddress getDualFuel

  static Future<DualFuelSiteAddressCredential>
      getDualFuelSiteAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String StrSiteAddress1 = preferences.getString("dfstrSiteAddress1");
    String StrSiteTown = preferences.getString("dfstrSiteTown");
    String StrSiteAddress2 = preferences.getString("dfstrSiteAddress2");
    String StrSitePostCode = preferences.getString("dfstrSitePostCode");

    print('#####Dual Fuel Siteadd########$StrSiteTown');
    if (StrSiteAddress1 != null) {
      return new DualFuelSiteAddressCredential(
        strSiteAddress1: StrSiteAddress1,
        strSiteTown: StrSiteTown,
        strSiteAddress2: StrSiteAddress2,
        strSitePostCode: StrSitePostCode,
      );
    } else {
      return null;
    }
  }

  static void clearDFSiteAddValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfstrSiteAddress1", null);
  }

//DualFuel SiteAddress setDualFuel
  static void setDualFuelSiteAddressValues(
      DualFuelSiteAddressCredential siteaddCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (siteaddCredential.strSiteAddress1 != null) {
      sharedPreferences.setString(
          "dfstrSiteAddress1", siteaddCredential.strSiteAddress1);
    }

    if (siteaddCredential.strSiteTown != null) {
      sharedPreferences.setString(
          "dfstrSiteTown", siteaddCredential.strSiteTown);
    }
    if (siteaddCredential.strSiteAddress2 != null) {
      sharedPreferences.setString(
          "dfstrSiteAddress2", siteaddCredential.strSiteAddress2);
    }
    if (siteaddCredential.strSitePostCode != null) {
      sharedPreferences.setString(
          "dfstrSitePostCode", siteaddCredential.strSitePostCode);
    }
    sharedPreferences.commit();
  }

//DualFuel-BillingAddress getDualFuel

  static Future<DualFuelBillingAddressCredential>
      getDualFuelBillingAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String BillAddress1 = preferences.getString("dfstrBillAddress1");
    String StrSiteTown = preferences.getString("dfstrSiteTown");
    String BillAddress2 = preferences.getString("dfstrBillAddress2");
    String BillPostCode = preferences.getString("dfstrBillPostCode");
    String strBillinTermType = preferences.getString("dfstrBillinTermType");
    String sameAsSite = preferences.getString("dfSameAsSite");

    print('#####Dual Fuel BillAddress########$BillAddress1');
    if (BillAddress1 != null) {
      return new DualFuelBillingAddressCredential(
          strBillAddress1: BillAddress1,
          strSiteTown: StrSiteTown,
          strBillAddress2: BillAddress2,
          strBillPostCode: BillPostCode,
          strBillinTermType: strBillinTermType,
          sameAsSite: sameAsSite);
    } else {
      return null;
    }
  }

  static void clearDFBillAddValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfstrBillAddress1", null);
  }

//DualFuel-BillingAddress setDualFuel
  static void setDualFuelBillingAddressValues(
      DualFuelBillingAddressCredential
          dualFuelInsertAddProspectCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (dualFuelInsertAddProspectCredential.sameAsSite != null) {
      sharedPreferences.setString(
          "dfSameAsSite", dualFuelInsertAddProspectCredential.sameAsSite);
    }
    if (dualFuelInsertAddProspectCredential.strBillAddress1 != null) {
      sharedPreferences.setString("dfstrBillAddress1",
          dualFuelInsertAddProspectCredential.strBillAddress1);
    }
    //BillingCity not given
    if (dualFuelInsertAddProspectCredential.strSiteTown != null) {
      sharedPreferences.setString(
          "dfstrSiteTown", dualFuelInsertAddProspectCredential.strSiteTown);
    }
    if (dualFuelInsertAddProspectCredential.strBillAddress2 != null) {
      sharedPreferences.setString("dfstrBillAddress2",
          dualFuelInsertAddProspectCredential.strBillAddress2);
    }

    if (dualFuelInsertAddProspectCredential.strBillPostCode != null) {
      sharedPreferences.setString("dfstrBillPostCode",
          dualFuelInsertAddProspectCredential.strBillPostCode);
    }

    if (dualFuelInsertAddProspectCredential.strBillinTermType != null) {
      sharedPreferences.setString("dfstrBillinTermType",
          dualFuelInsertAddProspectCredential.strBillinTermType);
    }
    sharedPreferences.commit();
  }

  ///
  // PrimaryContact Details
  static Future<DFPrimaryContactCredential> getDualFuelPrimaryContact() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String primaryTitle = preferences.getString("dfprimaryTitle");
    String primaryFirstName = preferences.getString("dfprimaryFirstName");
    String primaryLastName = preferences.getString("dfprimaryLastName");
    String primaryPhone = preferences.getString("dfprimaryPhone");
    String primaryEmail = preferences.getString("dfprimaryEmail");

    if (primaryTitle != null) {
      return new DFPrimaryContactCredential(
        primaryFirstName: primaryFirstName,
        primaryEmail: primaryEmail,
        primaryLastName: primaryLastName,
        primaryPhone: primaryPhone,
        primaryTitle: primaryTitle,
      );
    } else {
      return null;
    }
  }

  static void setDualFuelPrimaryContact(
      DFPrimaryContactCredential primaryContactCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (primaryContactCredential.primaryTitle != null) {
      sharedPreferences.setString(
          "dfprimaryTitle", primaryContactCredential.primaryTitle);
    }
    if (primaryContactCredential.primaryFirstName != null) {
      sharedPreferences.setString(
          "dfprimaryFirstName", primaryContactCredential.primaryFirstName);
    }
    if (primaryContactCredential.primaryLastName != null) {
      sharedPreferences.setString(
          "dfprimaryLastName", primaryContactCredential.primaryLastName);
    }
    if (primaryContactCredential.primaryPhone != null) {
      sharedPreferences.setString(
          "dfprimaryPhone", primaryContactCredential.primaryPhone);
    }
    if (primaryContactCredential.primaryEmail != null) {
      sharedPreferences.setString(
          "dfprimaryEmail", primaryContactCredential.primaryEmail);
    }
  }

  static void clearDFPrimaryContactValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfprimaryTitle", null);
  }

  ///
//DualFuel-Account Manager getDualFuel

  static Future<DualFuelAccountManagerCredential>
      getDualFuelAccountManagerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String strEAName = preferences.getString("dfstrEAName");
    String strEAEmail = preferences.getString("dfstrEAEmail");
    String strEAPhoneNo = preferences.getString("dfstrEAPhoneNo");
    String strEAMobileNo = preferences.getString("dfstrEAMobileNo");

    print('#####Dual Fuel Energy Account manager########$strEAMobileNo');
    if (strEAName != null) {
      return new DualFuelAccountManagerCredential(
        strEAName: strEAName,
        strEAEmail: strEAEmail,
        strEAPhoneNo: strEAPhoneNo,
        strEAMobileNo: strEAMobileNo,
      );
    } else {
      return null;
    }
  }

  static void clearDFEAMValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfstrEAName", null);
  }

//DualFuel-Account Manager setDualFuel
  static void setDualFuelAccountManagerValues(
      DualFuelAccountManagerCredential
          dualFuelInsertAddProspectCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (dualFuelInsertAddProspectCredential.strEAName != null) {
      sharedPreferences.setString(
          "dfstrEAName", dualFuelInsertAddProspectCredential.strEAName);
    }
    //BillingCity not given
    if (dualFuelInsertAddProspectCredential.strEAEmail != null) {
      sharedPreferences.setString(
          "dfstrEAEmail", dualFuelInsertAddProspectCredential.strEAEmail);
    }
    if (dualFuelInsertAddProspectCredential.strEAPhoneNo != null) {
      sharedPreferences.setString(
          "dfstrEAPhoneNo", dualFuelInsertAddProspectCredential.strEAPhoneNo);
    }
    if (dualFuelInsertAddProspectCredential.strEAMobileNo != null) {
      sharedPreferences.setString(
          "dfstrEAMobileNo", dualFuelInsertAddProspectCredential.strEAMobileNo);
    }

    sharedPreferences.commit();
  }

//DualFuelPaymentDetails getDualFuel

  static Future<DualFuelPaymentCredential> getDualFuelPaymentDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String PaymentType = preferences.getString("dfstrPaymentType");
    String BankACName = preferences.getString("dfstrBankACName");
    String BankACNo = preferences.getString("dfstrBankACNo");
    String BankSortCode = preferences.getString("dfstrBankSortCode");
    String BankName = preferences.getString("dfstrBankName");
    String PaymentTermDays = preferences.getString("dfintPaymentTermDays");
    String dfcardNo = preferences.getString("dfcardNo");
    String dfDDAmout = preferences.getString("dfDDAmount");
    String dfDDDays = preferences.getString("dfDDDays");

    print('#####Dual Fuel Payment########$BankACName');
    if (BankName != null) {
      return new DualFuelPaymentCredential(
          strPaymentType: PaymentType,
          strBankACName: BankACName,
          strBankACNo: BankACNo,
          strBankSortCode: BankSortCode,
          strBankName: BankName,
          intPaymentTermDays: PaymentTermDays,
          dfcardNo: dfcardNo,
          dfddAmounts: dfDDAmout,
          dfddDays: dfDDDays);
    } else {
      return null;
    }
  }

  static void clearDFPaymentValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfstrBankName", null);
  }

//DualFuelPaymentDetails setDualFuel
  static void setDualFuelPaymentDetails(
      DualFuelPaymentCredential dualFuelInsertAddProspectCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    print(dualFuelInsertAddProspectCredential.toJson());

    if (dualFuelInsertAddProspectCredential.strPaymentType != null) {
      sharedPreferences.setString("dfstrPaymentType",
          dualFuelInsertAddProspectCredential.strPaymentType);
    }

    if (dualFuelInsertAddProspectCredential.strBankACName != null) {
      sharedPreferences.setString(
          "dfstrBankACName", dualFuelInsertAddProspectCredential.strBankACName);
    }

    if (dualFuelInsertAddProspectCredential.strBankACNo != null) {
      sharedPreferences.setString(
          "dfstrBankACNo", dualFuelInsertAddProspectCredential.strBankACNo);
    }

    if (dualFuelInsertAddProspectCredential.strBankSortCode != null) {
      sharedPreferences.setString("dfstrBankSortCode",
          dualFuelInsertAddProspectCredential.strBankSortCode);
    }

    if (dualFuelInsertAddProspectCredential.strBankName != null) {
      sharedPreferences.setString(
          "dfstrBankName", dualFuelInsertAddProspectCredential.strBankName);
    }
    if (dualFuelInsertAddProspectCredential.intPaymentTermDays != null) {
      sharedPreferences.setString("dfintPaymentTermDays",
          dualFuelInsertAddProspectCredential.intPaymentTermDays);
    }
    if (dualFuelInsertAddProspectCredential.dfcardNo != null) {
      sharedPreferences.setString(
          "dfcardNo", dualFuelInsertAddProspectCredential.dfcardNo);
    }
    if (dualFuelInsertAddProspectCredential.dfddAmounts != null) {
      sharedPreferences.setString(
          "dfDDAmount", dualFuelInsertAddProspectCredential.dfddAmounts);
    }
    if (dualFuelInsertAddProspectCredential.dfddDays != null) {
      sharedPreferences.setString(
          "dfDDDays", dualFuelInsertAddProspectCredential.dfddDays);
    }

    sharedPreferences.commit();
  }

  /// Dual Fuel Partner Tab
  static void setDualFuelPartnerValues(
      DualFuelPartnerCredential elePartnerCredential) async {
    print(elePartnerCredential.toJson());
    print(elePartnerCredential.partnerName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (elePartnerCredential.partnerName != null) {
      sharedPreferences.setString(
          "dfPartnerName", elePartnerCredential.partnerName);
    }
    if (elePartnerCredential.additionalEmail != null) {
      sharedPreferences.setString(
          "dfAdditionalEmail", elePartnerCredential.additionalEmail);
    }
    if (elePartnerCredential.commissionType != null) {
      sharedPreferences.setString(
          "dfCommissionType", elePartnerCredential.commissionType);
    }
    if (elePartnerCredential.commoneleDayFixed != null) {
      sharedPreferences.setString(
          "commondfEleDayFixed", elePartnerCredential.commoneleDayFixed);
    }
    if (elePartnerCredential.commoneleNightFixed != null) {
      sharedPreferences.setString(
          "commondfEleNightFixed", elePartnerCredential.commoneleNightFixed);
    }
    if (elePartnerCredential.commoneleEweFixed != null) {
      sharedPreferences.setString(
          "commondfEleEweFixed", elePartnerCredential.commoneleEweFixed);
    }
    if (elePartnerCredential.commoneleScFixed != null) {
      sharedPreferences.setString(
          "commondfEleScFixed", elePartnerCredential.commoneleScFixed);
    }
    if (elePartnerCredential.commongasFixed != null) {
      sharedPreferences.setString(
          "commondfGasFixed", elePartnerCredential.commongasFixed);
    }
    if (elePartnerCredential.commongasScFixed != null) {
      sharedPreferences.setString(
          "commondfGasSCFixed", elePartnerCredential.commongasScFixed);
    }

    ///
    if (elePartnerCredential.eleDayFixed != null) {
      sharedPreferences.setString(
          "dfEleDayFixed", elePartnerCredential.eleDayFixed);
    }
    if (elePartnerCredential.eleNightFixed != null) {
      sharedPreferences.setString(
          "dfEleNightFixed", elePartnerCredential.eleNightFixed);
    }
    if (elePartnerCredential.eleEweFixed != null) {
      sharedPreferences.setString(
          "dfEleEweFixed", elePartnerCredential.eleEweFixed);
    }
    if (elePartnerCredential.eleScFixed != null) {
      sharedPreferences.setString(
          "dfEleScFixed", elePartnerCredential.eleScFixed);
    }
    if (elePartnerCredential.gasFixed != null) {
      sharedPreferences.setString("dfGasFixed", elePartnerCredential.gasFixed);
    }
    if (elePartnerCredential.gasScFixed != null) {
      sharedPreferences.setString(
          "dfGasSCFixed", elePartnerCredential.gasScFixed);
    }
  }

////Dual Fuel Tab Partner Detials(Add Prospect) getMethod
  static Future<DualFuelPartnerCredential> getDualFuelPartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String partnerName = preferences.getString("dfPartnerName");
    String additionalEmail = preferences.getString("dfAdditionalEmail");
    String commissionType = preferences.getString("dfCommissionType");
    String commoneleDayFixed = preferences.getString("commondfEleDayFixed");
    String commoneleNightFixed = preferences.getString("commondfEleNightFixed");
    String commoneleEweFixed = preferences.getString("commondfEleEweFixed");
    String commoneleScFixed = preferences.getString("commondfEleScFixed");
    String commongasFixed = preferences.getString("commondfGasFixed");
    String commongasSCFixed = preferences.getString("commondfGasSCFixed");

    String eleDayFixed = preferences.getString("dfEleDayFixed");
    String eleNightFixed = preferences.getString("dfEleNightFixed");
    String eleEweFixed = preferences.getString("dfEleEweFixed");
    String eleScFixed = preferences.getString("dfEleScFixed");
    String gasFixed = preferences.getString("dfGasFixed");
    String gasSCFixed = preferences.getString("dfGasSCFixed");

    print('#####Dual dayyyy Partner########$commoneleEweFixed');
    print('#####Dual gass Partner########$commongasFixed');

    if (partnerName != null) {
      return new DualFuelPartnerCredential(
        partnerName: partnerName,
        additionalEmail: additionalEmail,
        commissionType: commissionType,
        eleDayFixed: eleDayFixed,
        eleNightFixed: eleNightFixed,
        eleEweFixed: eleEweFixed,
        eleScFixed: eleScFixed,
        gasFixed: gasFixed,
        gasScFixed: gasSCFixed,
        commoneleDayFixed: commoneleDayFixed,
        commoneleNightFixed: commoneleNightFixed,
        commoneleEweFixed: commoneleEweFixed,
        commoneleScFixed: commoneleScFixed,
        commongasFixed: commongasFixed,
        commongasScFixed: commongasSCFixed,
      );
    } else {
      return null;
    }
  }

  static void clearDFPartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfPartnerName", null);
  }

////DualFuel Tab Group Details(Add Prospect) setMethod
  static void setDualFuelGroupValues(
      DualFuelGroupCredential eleGroupCredential) async {
    print(eleGroupCredential.toJson());
    print(eleGroupCredential.groupName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleGroupCredential.groupName != null) {
      sharedPreferences.setString("dfGroupName", eleGroupCredential.groupName);
    }
  }

////Dual Fuel Tab Group Details(Add Prospect) getMethod
  static Future<DualFuelGroupCredential> getDualFuelGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String groupName = preferences.getString("dfGroupName");

    print('#####Dual Fuel Group########$groupName');
    if (groupName != null) {
      return new DualFuelGroupCredential(groupName: groupName);
    } else {
      return null;
    }
  }

  static void clearDFGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("dfGroupName", null);
  }
}
