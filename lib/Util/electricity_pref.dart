import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/PrimaryContactCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEleCredentials.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBusCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleBillAddCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEAMCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/ElePartnerCredential.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleGroupCredential.dart';

class ElectricityPref {
  ////Electricity Tab Electricity(Add Prospect) setmethod
  static void setElectricityEleValues(
      EleEleCredentials eleEleCredentials) async {
    print(eleEleCredentials.toJson());

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleEleCredentials.mpanCodeController != null) {
      sharedPreferences.setString(
          "ELEmpanCodeController", eleEleCredentials.mpanCodeController);
    }

    if (eleEleCredentials.wholeMpan != null) {
      sharedPreferences.setString("ELEWholeMpan", eleEleCredentials.wholeMpan);
    }
    if (eleEleCredentials.fullMpan != null) {
      sharedPreferences.setString("ELEFullMpan", eleEleCredentials.wholeMpan);
    }
    if (eleEleCredentials.businessController1 != null) {
      sharedPreferences.setString(
          "ELEbusinessController1", eleEleCredentials.businessController1);
    }
    if (eleEleCredentials.businessController2 != null) {
      sharedPreferences.setString(
          "ELEbusinessController2", eleEleCredentials.businessController2);
    }
    if (eleEleCredentials.businessController3 != null) {
      sharedPreferences.setString(
          "ELEbusinessController3", eleEleCredentials.businessController3);
    }
    if (eleEleCredentials.businessController4 != null) {
      sharedPreferences.setString(
          "ELEbusinessController4", eleEleCredentials.businessController4);
    }
    if (eleEleCredentials.businessController5 != null) {
      sharedPreferences.setString(
          "ELEbusinessController5", eleEleCredentials.businessController5);
    }
    if (eleEleCredentials.businessController6 != null) {
      sharedPreferences.setString(
          "ELEbusinessController6", eleEleCredentials.businessController6);
    }
    /////////////
    if (eleEleCredentials.rhtMpanCodeController != null) {
      sharedPreferences.setString(
          "ELEerhtMpanCodeController", eleEleCredentials.rhtMpanCodeController);
    }

    if (eleEleCredentials.wholeRHTMpan != null) {
      sharedPreferences.setString(
          "ELEewholeRHTMpan", eleEleCredentials.wholeRHTMpan);
    }
    if (eleEleCredentials.fullMpanRHT != null) {
      sharedPreferences.setString(
          "ELEefullMpanRHT", eleEleCredentials.fullMpanRHT);
    }
    if (eleEleCredentials.rhtBusinessController1 != null) {
      sharedPreferences.setString("ELEerhtBusinessController1",
          eleEleCredentials.rhtBusinessController1);
    }
    if (eleEleCredentials.rhtBusinessController2 != null) {
      sharedPreferences.setString("ELEerhtBusinessController2",
          eleEleCredentials.rhtBusinessController2);
    }
    if (eleEleCredentials.rhtBusinessController3 != null) {
      sharedPreferences.setString("ELEerhtBusinessController3",
          eleEleCredentials.rhtBusinessController3);
    }
    if (eleEleCredentials.rhtBusinessController4 != null) {
      sharedPreferences.setString("ELEerhtBusinessController4",
          eleEleCredentials.rhtBusinessController4);
    }
    if (eleEleCredentials.rhtBusinessController5 != null) {
      sharedPreferences.setString("ELEerhtBusinessController5",
          eleEleCredentials.rhtBusinessController5);
    }
    if (eleEleCredentials.rhtBusinessController6 != null) {
      sharedPreferences.setString("ELEerhtBusinessController6",
          eleEleCredentials.rhtBusinessController6);
    }
    if (eleEleCredentials.rhtStandingCharge != null) {
      sharedPreferences.setString(
          "ELEerhtrhtStandingCharge", eleEleCredentials.rhtStandingCharge);
    }
    if (eleEleCredentials.rhtNightUnitCharge != null) {
      sharedPreferences.setString(
          "ELEerhtrhtNightUnitCharge", eleEleCredentials.rhtNightUnitCharge);
    }
    if (eleEleCredentials.rhtNightEac != null) {
      sharedPreferences.setString(
          "ELEerhtrhtNightEacCharge", eleEleCredentials.rhtNightEac);
    }
    if (eleEleCredentials.contractEndDate != null) {
      sharedPreferences.setString(
          "ELEcontractEndDate", eleEleCredentials.contractEndDate);
    }
    //////////

    if (eleEleCredentials.rhtcheckbox != null) {
      sharedPreferences.setString(
          "ELERHTCheckbox", eleEleCredentials.rhtcheckbox);
    }
    if (eleEleCredentials.dteElecStartDate != null) {
      sharedPreferences.setString(
          "EleEleContractStartDate", eleEleCredentials.dteElecStartDate);
    }
    if (eleEleCredentials.dtContractEndDateEle != null) {
      sharedPreferences.setString(
          "EleEleContractEndDate", eleEleCredentials.dtContractEndDateEle);
    }
    if (eleEleCredentials.strStandingCharge != null) {
      sharedPreferences.setString(
          "EleEleStandingCharge", eleEleCredentials.strStandingCharge);
    }
    if (eleEleCredentials.strDayUnit != null) {
      sharedPreferences.setString(
          "EleEleDayUnit", eleEleCredentials.strDayUnit);
    }
    if (eleEleCredentials.strNightUnit != null) {
      sharedPreferences.setString(
          "EleEleNightUnit", eleEleCredentials.strNightUnit);
    }
    if (eleEleCredentials.strEWEUnit != null) {
      sharedPreferences.setString(
          "EleEleEWEUnit", eleEleCredentials.strEWEUnit);
    }
    if (eleEleCredentials.strCapacitycharges != null) {
      sharedPreferences.setString(
          "EleEleCapacityCharge", eleEleCredentials.strCapacitycharges);
    }
    if (eleEleCredentials.strExceesCapacityCharegs != null) {
      sharedPreferences.setString(
          "EleEleExcessCapacity", eleEleCredentials.strExceesCapacityCharegs);
    }
    if (eleEleCredentials.strEMRCFD != null) {
      sharedPreferences.setString(
          "EleEleEMRCharge", eleEleCredentials.strEMRCFD);
    }
    if (eleEleCredentials.strEnergizationstatus != null) {
      sharedPreferences.setString(
          "EleEleEnergizationStatus", eleEleCredentials.strEnergizationstatus);
    }
    if (eleEleCredentials.electricityDay_EAC != null) {
      sharedPreferences.setString(
          "EleEleDayEac", eleEleCredentials.electricityDay_EAC);
    }
    if (eleEleCredentials.electricityNight_EAC != null) {
      sharedPreferences.setString(
          "EleEleNightEac", eleEleCredentials.electricityNight_EAC);
    }
    if (eleEleCredentials.electricityEvening_EAC != null) {
      sharedPreferences.setString(
          "EleEleEveEac", eleEleCredentials.electricityEvening_EAC);
    }
    // //site capacity not present
    if (eleEleCredentials.strSiteCharge != null) {
      sharedPreferences.setString(
          "EleEleSiteCharge", eleEleCredentials.strSiteCharge);
    }
    if (eleEleCredentials.strReactiveCharges != null) {
      sharedPreferences.setString(
          "EleEleReactiveCharge", eleEleCredentials.strReactiveCharges);
    }
    if (eleEleCredentials.strFITcharge != null) {
      sharedPreferences.setString(
          "EleEleFitCharge", eleEleCredentials.strFITcharge);
    }
    if (eleEleCredentials.strNewConnection != null) {
      sharedPreferences.setString(
          "EleEleNewConn", eleEleCredentials.strNewConnection);
    }
    if (eleEleCredentials.rhtcheckbox != null) {
      sharedPreferences.setString(
          "EleeEleRhtCheckbox", eleEleCredentials.rhtcheckbox);
    }
    if (eleEleCredentials.bteMopCustomer != null) {
      sharedPreferences.setString(
          "EleEleMopCustomer", eleEleCredentials.bteMopCustomer);
    }
    if (eleEleCredentials.bteMopDADCCustomer != null) {
      sharedPreferences.setString(
          "EleEleMopCustomerDADC", eleEleCredentials.bteMopDADCCustomer);
    }
  }

////Electricity Tab Electricity(Add Prospect) getMethod

  static Future<EleEleCredentials> getElectricityEleValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String fullMpan = preferences.getString("ELEFullMpan");
    String mpanCodeController = preferences.getString('ELEmpanCodeController');
    String businessController1 =
        preferences.getString("ELEbusinessController1");
    String businessController2 =
        preferences.getString("ELEbusinessController2");
    String businessController3 =
        preferences.getString("ELEbusinessController3");
    String businessController4 =
        preferences.getString("ELEbusinessController4");
    String businessController5 =
        preferences.getString("ELEbusinessController5");
    String businessController6 =
        preferences.getString("ELEbusinessController6");

    String wholeMpan = preferences.getString("ELEWholeMpan");

    String rhtMpanCodeController =
        preferences.getString("ELEerhtMpanCodeController");
    String rhtBusinessController1 =
        preferences.getString("ELEerhtBusinessController1");
    String rhtBusinessController2 =
        preferences.getString("ELEerhtBusinessController2");
    String rhtBusinessController3 =
        preferences.getString("ELEerhtBusinessController3");
    String rhtBusinessController4 =
        preferences.getString("ELEerhtBusinessController4");
    String rhtBusinessController5 =
        preferences.getString("ELEerhtBusinessController5");
    String rhtBusinessController6 =
        preferences.getString("ELEerhtBusinessController6");

    String rhtStanding = preferences.getString("ELEerhtrhtStandingCharge");
    String rhtnightUnit = preferences.getString("ELEerhtrhtNightUnitCharge");
    String rhtNightEac = preferences.getString("ELEerhtrhtNightEacCharge");

    String wholeRHTMpan = preferences.getString("ELEewholeRHTMpan");
    String fullMpanRHT = preferences.getString("ELEefullMpanRHT");

    String othercontractEndDate = preferences.getString("ELEcontractEndDate");

    String contractStartDate = preferences.getString("EleEleContractStartDate");
    String contractEndDate = preferences.getString("EleEleContractEndDate");
    String standingCharge = preferences.getString("EleEleStandingCharge");
    String dayUnitCharge = preferences.getString("EleEleDayUnit");
    String nightUnitCharge = preferences.getString("EleEleNightUnit");
    String eweUnitCharge = preferences.getString("EleEleEWEUnit");
    String capacityCharge = preferences.getString("EleEleCapacityCharge");
    String excessCapacityCharge = preferences.getString("EleEleExcessCapacity");
    String emrCharge = preferences.getString("EleEleEMRCharge");
    String energizationStatus =
        preferences.getString("EleEleEnergizationStatus");
    String dayEac = preferences.getString("EleEleDayEac");
    String nightEac = preferences.getString("EleEleNightEac");
    String eveEac = preferences.getString("EleEleEveEac");
    String siteCapacity = preferences.getString("EleEleSiteCharge");
    String reactiveCharges = preferences.getString("EleEleReactiveCharge");
    String fitCharge = preferences.getString("EleEleFitCharge");
    String newConnection = preferences.getString("EleEleNewConn");
    String rhtCheckBox = preferences.getString("EleeEleRhtCheckbox");
    String bteCustomerMop = preferences.getString("EleEleMopCustomer");
    String bteCustomerDaDc = preferences.getString("EleEleMopCustomerDADC");

    print('#####Electricity Electricity########$wholeMpan');

    print('rHTettregr$wholeRHTMpan');

    if (fullMpan != null) {
      return new EleEleCredentials(
        mpanCodeController: mpanCodeController,
        wholeMpan: wholeMpan,
        wholeRHTMpan: wholeRHTMpan,
        fullMpanRHT: fullMpanRHT,
        rhtcheckbox: rhtCheckBox,
        fullMpan: fullMpan,
        businessController1: businessController1,
        businessController2: businessController2,
        businessController3: businessController3,
        businessController4: businessController4,
        businessController5: businessController5,
        businessController6: businessController6,
        rhtMpanCodeController: rhtMpanCodeController,
        rhtBusinessController1: rhtBusinessController1,
        rhtBusinessController2: rhtBusinessController2,
        rhtBusinessController3: rhtBusinessController3,
        rhtBusinessController4: rhtBusinessController4,
        rhtBusinessController5: rhtBusinessController5,
        rhtBusinessController6: rhtBusinessController6,
        rhtStandingCharge: rhtStanding,
        rhtNightUnitCharge: rhtnightUnit,
        rhtNightEac: rhtNightEac,
        dteElecStartDate: contractStartDate,
        dtContractEndDateEle: contractEndDate,
        contractEndDate: othercontractEndDate,
        strStandingCharge: standingCharge,
        strDayUnit: dayUnitCharge,
        strNightUnit: nightUnitCharge,
        strEWEUnit: eweUnitCharge,
        strCapacitycharges: capacityCharge,
        strExceesCapacityCharegs: excessCapacityCharge,
        strEMRCFD: emrCharge,
        strEnergizationstatus: energizationStatus,
        electricityDay_EAC: dayEac,
        electricityNight_EAC: nightEac,
        electricityEvening_EAC: eveEac,
        strSiteCharge: siteCapacity,
        strReactiveCharges: reactiveCharges,
        strFITcharge: fitCharge,
        strNewConnection: newConnection,
        bteMopCustomer: bteCustomerMop,
        bteMopDADCCustomer: bteCustomerDaDc,
      );
    } else {
      return null;
    }
  }

  static void clearEleEleValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ELEFullMpan", null);
  }

////Electricity Tab Business Details(Add Prospect) setMethod

  static void setElectricityBusValues(EleBusCredential eleBusCredential) async {
    print(eleBusCredential.toJson());
    print(eleBusCredential.business_Name);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleBusCredential.business_Name != null) {
      sharedPreferences.setString(
          "eleBusinessName", eleBusCredential.business_Name);
    }
    if (eleBusCredential.business_Type != null) {
      sharedPreferences.setString(
          "eleBusinessType", eleBusCredential.business_Type);
    }
    if (eleBusCredential.alternative_Number != null) {
      sharedPreferences.setString(
          "eleLandlineNo", eleBusCredential.alternative_Number);
    }
    if (eleBusCredential.email != null) {
      sharedPreferences.setString("eleEmailAddress", eleBusCredential.email);
    }
    if (eleBusCredential.strNameOfBill != null) {
      sharedPreferences.setString(
          "eleNameOnBill", eleBusCredential.strNameOfBill);
    }
    if (eleBusCredential.strSupplyName != null) {
      sharedPreferences.setString(
          "eleSupplyName", eleBusCredential.strSupplyName);
    }
    if (eleBusCredential.strCompanyRegNo != null) {
      sharedPreferences.setString(
          "eleCompanyRegNo", eleBusCredential.strCompanyRegNo);
    }
    if (eleBusCredential.strEAMobileNo != null) {
      sharedPreferences.setString(
          "eleMobileNo", eleBusCredential.strEAMobileNo);
    }
    if (eleBusCredential.registeredCompanyName != null) {
      sharedPreferences.setString(
          "eleRegCompanyName", eleBusCredential.registeredCompanyName);
    }
    if (eleBusCredential.btePaperBill != null) {
      sharedPreferences.setString(
          "elePaperBill", eleBusCredential.btePaperBill);
    }
    if (eleBusCredential.btemicrobuisnes != null) {
      sharedPreferences.setString(
          "eleMicroBusiness", eleBusCredential.btemicrobuisnes);
    }
    if (eleBusCredential.strPropertOwnerShip != null) {
      sharedPreferences.setString(
          "elePropertyOwnerShip", eleBusCredential.strPropertOwnerShip);
    }
    if (eleBusCredential.strCustomerRefNo != null) {
      sharedPreferences.setString(
          "eleCustomerRefId", eleBusCredential.strCustomerRefNo);
    }
  }

////Electricity Tab Business Details(Add Prospect) getMethod

  static Future<EleBusCredential> getElectricityBusValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String businessName = preferences.getString("eleBusinessName");
    String businessType = preferences.getString("eleBusinessType");
    String landlineNo = preferences.getString("eleLandlineNo");
    String emailAddress = preferences.getString("eleEmailAddress");
    String nameOnBill = preferences.getString("eleNameOnBill");
    String supplyName = preferences.getString("eleSupplyName");
    String companyRegNo = preferences.getString("eleCompanyRegNo");
    String mobileNo = preferences.getString("eleMobileNo");
    String regCompanyName = preferences.getString("eleRegCompanyName");
    String paperBill = preferences.getString("elePaperBill");
    String microBusiness = preferences.getString("eleMicroBusiness");
    String propertyOwnership = preferences.getString("elePropertyOwnerShip");
    String customerRefId = preferences.getString("eleCustomerRefId");

    print('#####Electricity Business########$regCompanyName');
    if (businessName != null) {
      return new EleBusCredential(
        business_Name: businessName,
        business_Type: businessType,
        alternative_Number: landlineNo,
        email: emailAddress,
        strNameOfBill: nameOnBill,
        strSupplyName: supplyName,
        strCompanyRegNo: companyRegNo,
        strEAMobileNo: mobileNo,
        registeredCompanyName: regCompanyName,
        btePaperBill: paperBill,
        btemicrobuisnes: microBusiness,
        strPropertOwnerShip: propertyOwnership,
        strCustomerRefNo: customerRefId,
      );
    } else {
      return null;
    }
  }

  static void clearEleBusinessValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("eleBusinessName", null);
  }

////Electricity Tab Site Address (Add Prospect) setMethod

  static void setElectricitySiteAddressValues(
      EleSiteAddressCredential eleSiteAddressCredential) async {
    print(eleSiteAddressCredential.toJson());
    print(eleSiteAddressCredential.strSiteAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleSiteAddressCredential.strSiteAddress1 != null) {
      sharedPreferences.setString(
          "ELESiteAddress1", eleSiteAddressCredential.strSiteAddress1);
    }
    if (eleSiteAddressCredential.strSiteTown != null) {
      sharedPreferences.setString(
          "ELESiteTown", eleSiteAddressCredential.strSiteTown);
    }
    if (eleSiteAddressCredential.strSiteAddress2 != null) {
      sharedPreferences.setString(
          "ELESiteAddress2", eleSiteAddressCredential.strSiteAddress2);
    }
    if (eleSiteAddressCredential.strSitePostCode != null) {
      sharedPreferences.setString(
          "ELESitePostCode", eleSiteAddressCredential.strSitePostCode);
    }
  }
////Electricity Tab Site Address (Add Prospect) getMethod

  static Future<EleSiteAddressCredential>
      getElectricitySiteAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String siteAddress1 = preferences.getString("ELESiteAddress1");
    String city = preferences.getString("ELESiteTown");
    String siteAddress2 = preferences.getString("ELESiteAddress2");
    String strSitePostCode = preferences.getString("ELESitePostCode");

    print('#####Electricity Site Address########$siteAddress1');
    if (siteAddress1 != null) {
      return new EleSiteAddressCredential(
        strSiteAddress1: siteAddress1,
        strSiteTown: city,
        strSiteAddress2: siteAddress2,
        strSitePostCode: strSitePostCode,
      );
    } else {
      return null;
    }
  }

  static void clearEleSiteAddValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ELESiteAddress1", null);
  }

////Electricity Tab Billing Address(Add Prospect) setMethod

  static void setElectricityBillingAddressValues(
      EleBillAddCredential eleBillAddCredential) async {
    print(eleBillAddCredential.toJson());
    print(eleBillAddCredential.elestrBillAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleBillAddCredential.elesameAsSite != null) {
      sharedPreferences.setString(
          "ELESameAsSite", eleBillAddCredential.elesameAsSite);
    }
    if (eleBillAddCredential.elestrBillAddress1 != null) {
      sharedPreferences.setString(
          "ELEBillAddress1", eleBillAddCredential.elestrBillAddress1);
    }
    if (eleBillAddCredential.eletown1 != null) {
      sharedPreferences.setString("ELEBillCity", eleBillAddCredential.eletown1);
    }
    if (eleBillAddCredential.elestrBillAddress2 != null) {
      sharedPreferences.setString(
          "ELEBillAddress2", eleBillAddCredential.elestrBillAddress2);
    }
    if (eleBillAddCredential.elestrBillPostCode != null) {
      sharedPreferences.setString(
          "ElEBillPostcode", eleBillAddCredential.elestrBillPostCode);
    }
    if (eleBillAddCredential.elestrBillinTermType != null) {
      sharedPreferences.setString(
          "ELEBillTermType", eleBillAddCredential.elestrBillinTermType);
    }
  }
////Electricity Tab Billing Address(Add Prospect) getMethod

  static Future<EleBillAddCredential>
      getElectricityBillingAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String billingAddress1 = preferences.getString("ELEBillAddress1");
    String billingCity = preferences.getString("ELEBillCity");
    String billingAddress2 = preferences.getString("ELEBillAddress2");
    String billingPostCode = preferences.getString("ElEBillPostcode");
    String billTermType = preferences.getString("ELEBillTermType");
    String sameAsSite = preferences.getString("ELESameAsSite");

    print('#####Electricity  Bill Address########$billingCity');
    if (billingAddress1 != null) {
      return new EleBillAddCredential(
        elestrBillAddress1: billingAddress1,
        eletown1: billingCity,
        elestrBillAddress2: billingAddress2,
        elestrBillPostCode: billingPostCode,
        elestrBillinTermType: billTermType,
        elesameAsSite: sameAsSite,
      );
    } else {
      return null;
    }
  }

  static void clearEleBillAddValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ELEBillAddress1", null);
  }

  ///
  // PrimaryContact Details
  static Future<ELPrimaryContactCredential> getELEPrimaryContact() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String primaryTitle = preferences.getString("elePrimaryTitle");
    String primaryFirstName = preferences.getString("elePrimaryFirstName");
    String primaryLastName = preferences.getString("elePrimaryLastName");
    String primaryPhone = preferences.getString("elePrimaryPhone");
    String primaryEmail = preferences.getString("elePrimaryEmail");

    if (primaryTitle != null) {
      return new ELPrimaryContactCredential(
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

  static void setELEPrimaryContact(
      ELPrimaryContactCredential primaryContactCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (primaryContactCredential.primaryTitle != null) {
      sharedPreferences.setString(
          "elePrimaryTitle", primaryContactCredential.primaryTitle);
    }
    if (primaryContactCredential.primaryFirstName != null) {
      sharedPreferences.setString(
          "elePrimaryFirstName", primaryContactCredential.primaryFirstName);
    }
    if (primaryContactCredential.primaryLastName != null) {
      sharedPreferences.setString(
          "elePrimaryLastName", primaryContactCredential.primaryLastName);
    }
    if (primaryContactCredential.primaryPhone != null) {
      sharedPreferences.setString(
          "elePrimaryPhone", primaryContactCredential.primaryPhone);
    }
    if (primaryContactCredential.primaryEmail != null) {
      sharedPreferences.setString(
          "elePrimaryEmail", primaryContactCredential.primaryEmail);
    }
  }

  static void clearELEPrimaryContactValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("elePrimaryTitle", null);
  }

  ///

////Electricity Tab Energy Account Manager (Add Prospect) setMethod

  static void setElectricityEAMValues(EleEAMCredential eleEAMCredential) async {
    print(eleEAMCredential.toJson());
    print(eleEAMCredential.strEAName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleEAMCredential.strEAName != null) {
      sharedPreferences.setString("EAName", eleEAMCredential.strEAName);
    }
    if (eleEAMCredential.strEAEmail != null) {
      sharedPreferences.setString("EAEmail", eleEAMCredential.strEAEmail);
    }
    if (eleEAMCredential.strEAPhoneNo != null) {
      sharedPreferences.setString("EAPhoneNO", eleEAMCredential.strEAPhoneNo);
    }
    if (eleEAMCredential.strEAMobileNo != null) {
      sharedPreferences.setString("EAMobileNo", eleEAMCredential.strEAMobileNo);
    }
  }

////Electricity Tab Energy Account Manager (Add Prospect) getMethod

  static Future<EleEAMCredential> getElectricityEAMValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String eaName = preferences.getString("EAName");
    String eaEmail = preferences.getString("EAEmail");
    String eaPhoneNo = preferences.getString("EAPhoneNO");
    String eaMobileNo = preferences.getString("EAMobileNo");

    print('#####Electricity EAM########$eaName');
    if (eaName != null) {
      return new EleEAMCredential(
        strEAName: eaName,
        strEAEmail: eaEmail,
        strEAPhoneNo: eaPhoneNo,
        strEAMobileNo: eaMobileNo,
      );
    } else {
      return null;
    }
  }

  static void clearEleEAMValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("EAName", null);
  }

////Electricity Tab Payment Details (Add Prospect) setMethod

  static void setElectricityPaymentValues(
      ElePaymentCredential elePaymentCredential) async {
    print(elePaymentCredential.toJson());
    print(elePaymentCredential.strBankACName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (elePaymentCredential.strPaymentType != null) {
      sharedPreferences.setString(
          "elePaymentMethod", elePaymentCredential.strPaymentType);
    }
    if (elePaymentCredential.strBankACName != null) {
      sharedPreferences.setString(
          "eleAccountName", elePaymentCredential.strBankACName);
    }
    if (elePaymentCredential.strBankACNo != null) {
      sharedPreferences.setString(
          "eleAccountNumber", elePaymentCredential.strBankACNo);
    }
    if (elePaymentCredential.strBankSortCode != null) {
      sharedPreferences.setString(
          "eleSortCode", elePaymentCredential.strBankSortCode);
    }
    if (elePaymentCredential.strBankName != null) {
      sharedPreferences.setString(
          "eleBankName", elePaymentCredential.strBankName);
    }
    if (elePaymentCredential.intPaymentTermDays != null) {
      sharedPreferences.setString(
          "elePaymentTermDays", elePaymentCredential.intPaymentTermDays);
    }
    if (elePaymentCredential.elecardNo != null) {
      sharedPreferences.setString("eleCardNo", elePaymentCredential.elecardNo);
    }
    if (elePaymentCredential.eleddDays != null) {
      sharedPreferences.setString("eleDDDays", elePaymentCredential.eleddDays);
    }
    if (elePaymentCredential.eleddAmounts != null) {
      sharedPreferences.setString(
          "eleDDAmount", elePaymentCredential.eleddAmounts);
    }
  }

////Electricity Tab Payment Details (Add Prospect) getMethod

  static Future<ElePaymentCredential> getElectricityPaymentValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String paymentMethod = preferences.getString("elePaymentMethod");
    String accountName = preferences.getString("eleAccountName");
    String accountNo = preferences.getString("eleAccountNumber");
    String sortCode = preferences.getString("eleSortCode");
    String bankName = preferences.getString("eleBankName");
    String paymentTermDays = preferences.getString("elePaymentTermDays");
    String eleCardNo = preferences.getString("eleCardNo");
    String eleDDDays = preferences.getString("eleDDDays");
    String eleDDAmount = preferences.getString("eleDDAmount");

    print('#####Electricity Payment########$accountName');
    if (accountName != null) {
      return new ElePaymentCredential(
        strPaymentType: paymentMethod,
        strBankACName: accountName,
        strBankACNo: accountNo,
        strBankSortCode: sortCode,
        strBankName: bankName,
        intPaymentTermDays: paymentTermDays,
        elecardNo: eleCardNo,
        eleddDays: eleDDDays,
        eleddAmounts: eleDDAmount,
      );
    } else {
      return null;
    }
  }

  static void clearElePaymentValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("eleAccountName", null);
  }

////Electricity Tab Partner Details(Add Prospect) setMethod
  static void setElectricityPartnerValues(
      ElePartnerCredential elePartnerCredential) async {
    print(elePartnerCredential.toJson());
    print(elePartnerCredential.elepartnerName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (elePartnerCredential.elepartnerName != null) {
      sharedPreferences.setString(
          "eleelePartnerName", elePartnerCredential.elepartnerName);
    }
    if (elePartnerCredential.eleadditionalEmail != null) {
      sharedPreferences.setString(
          "eleeleAdditionalEmail", elePartnerCredential.eleadditionalEmail);
    }
    if (elePartnerCredential.eleaffiliateDetail != null) {
      sharedPreferences.setString(
          "eleeleAffiliateDetail", elePartnerCredential.eleaffiliateDetail);
    }
    if (elePartnerCredential.elecommissionType != null) {
      sharedPreferences.setString(
          "eleeleCommissionType", elePartnerCredential.elecommissionType);
    }
    if (elePartnerCredential.eleeleDayFixed != null) {
      sharedPreferences.setString(
          "eleeleEleDayFixed", elePartnerCredential.eleeleDayFixed);
    }
    if (elePartnerCredential.eleeleNightFixed != null) {
      sharedPreferences.setString(
          "eleeleEleNightFixed", elePartnerCredential.eleeleNightFixed);
    }
    if (elePartnerCredential.eleeleEweFixed != null) {
      sharedPreferences.setString(
          "eleeleEleEweFixed", elePartnerCredential.eleeleEweFixed);
    }
    if (elePartnerCredential.eleeleScFixed != null) {
      sharedPreferences.setString(
          "eleeleEleScFixed", elePartnerCredential.eleeleScFixed);
    }
    //common
    if (elePartnerCredential.elecommoneleDayFixed != null) {
      sharedPreferences.setString(
          "eleelecommonEleDayFixed", elePartnerCredential.elecommoneleDayFixed);
    }
    if (elePartnerCredential.elecommoneleNightFixed != null) {
      sharedPreferences.setString("eleelecommoneleEleNightFixed",
          elePartnerCredential.elecommoneleNightFixed);
    }
    if (elePartnerCredential.elecommoneleEweFixed != null) {
      sharedPreferences.setString("eleelecommoneleEleEweFixed",
          elePartnerCredential.elecommoneleEweFixed);
    }
    if (elePartnerCredential.elecommoneleScFixed != null) {
      sharedPreferences.setString("eleelecommoneleEleScFixed",
          elePartnerCredential.elecommoneleScFixed);
    }
  }

////Electricity Tab Partner Detials(Add Prospect) getMethod

  static Future<ElePartnerCredential> getElectricityPartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String partnerName = preferences.getString("eleelePartnerName");
    String additionalEmail = preferences.getString("eleeleAdditionalEmail");
    String affiliateDetail = preferences.getString("eleeleAffiliateDetail");
    String commissionType = preferences.getString("eleeleCommissionType");
    String eleDayFixed = preferences.getString("eleeleEleDayFixed");
    String eleNightFixed = preferences.getString("eleeleEleNightFixed");
    String eleEweFixed = preferences.getString("eleeleEleEweFixed");
    String eleScFixed = preferences.getString("eleeleEleScFixed");
    String commoneleDayFixed = preferences.getString("eleelecommonEleDayFixed");
    String commoneleNightFixed =
        preferences.getString("eleelecommoneleEleNightFixed");
    String commoneleEweFixed =
        preferences.getString("eleelecommoneleEleEweFixed");
    String commoneleScFixed =
        preferences.getString("eleelecommoneleEleScFixed");

    print('#####Electricity Partner########$partnerName');
    if (commoneleDayFixed != null) {
      return new ElePartnerCredential(
        elepartnerName: partnerName,
        eleadditionalEmail: additionalEmail,
        eleaffiliateDetail: affiliateDetail,
        elecommissionType: commissionType,
        eleeleDayFixed: eleDayFixed,
        eleeleNightFixed: eleNightFixed,
        eleeleEweFixed: eleEweFixed,
        eleeleScFixed: eleScFixed,
        elecommoneleDayFixed: commoneleDayFixed,
        elecommoneleNightFixed: commoneleNightFixed,
        elecommoneleEweFixed: commoneleEweFixed,
        elecommoneleScFixed: commoneleScFixed,
      );
    } else {
      return null;
    }
  }

  static void clearElePartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("eleelecommonEleDayFixed", null);
  }

////Electricity Tab Group Details(Add Prospect) setMethod

  static void setElectricityGroupValues(
      EleGroupCredential eleGroupCredential) async {
    print(eleGroupCredential.toJson());
    print(eleGroupCredential.groupName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (eleGroupCredential.groupName != null) {
      sharedPreferences.setString("eleGroupName", eleGroupCredential.groupName);
    }
  }

////Electricity Tab Group Details(Add Prospect) getMethod

  static Future<EleGroupCredential> getElectricityGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String groupName = preferences.getString("eleGroupName");

    print('#####Electricity Group########$groupName');
    if (groupName != null) {
      return new EleGroupCredential(groupName: groupName);
    } else {
      return null;
    }
  }

  static void clearEleGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("eleGroupName", null);
  }
}
