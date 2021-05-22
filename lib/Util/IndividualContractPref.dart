import 'package:shared_preferences/shared_preferences.dart';
import 'package:pozitive/Core/Model/Api/Electricity-InsertAddProspect/EleEleCredentials.dart';
import 'package:pozitive/Core/Model/Api/SaveAndGenerateContractAddMethodCredential.dart';

class IndividualContractPref {
  static void setElectricityEleValues(
      EleEleCredentials eleEleCredentials) async {
    print(eleEleCredentials.toJson());
    print(eleEleCredentials.dteElecStartDate);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (eleEleCredentials.mpanCodeController != null) {
      sharedPreferences.setString(
          "mpanCodeController", eleEleCredentials.mpanCodeController);
    }

    if (eleEleCredentials.wholeMpan != null) {
      sharedPreferences.setString("WholeMpan", eleEleCredentials.wholeMpan);
    }
    if (eleEleCredentials.fullMpan != null) {
      sharedPreferences.setString("FullMpan", eleEleCredentials.fullMpan);
    }
    if (eleEleCredentials.businessController1 != null) {
      sharedPreferences.setString(
          "businessController1", eleEleCredentials.businessController1);
    }
    if (eleEleCredentials.businessController2 != null) {
      sharedPreferences.setString(
          "businessController2", eleEleCredentials.businessController2);
    }
    if (eleEleCredentials.businessController3 != null) {
      sharedPreferences.setString(
          "businessController3", eleEleCredentials.businessController3);
    }
    if (eleEleCredentials.businessController4 != null) {
      sharedPreferences.setString(
          "businessController4", eleEleCredentials.businessController4);
    }
    if (eleEleCredentials.businessController5 != null) {
      sharedPreferences.setString(
          "businessController5", eleEleCredentials.businessController5);
    }
    if (eleEleCredentials.businessController6 != null) {
      sharedPreferences.setString(
          "businessController6", eleEleCredentials.businessController6);
    }
    if (eleEleCredentials.rhtcheckbox != null) {
      sharedPreferences.setString("RHTCheckbox", eleEleCredentials.rhtcheckbox);
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
          "EleEleRhtCheckbox", eleEleCredentials.rhtcheckbox);
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

    String fullMpan = preferences.getString("FullMpan");
    String mpanCodeController = preferences.getString('mpanCodeController');
    String businessController1 = preferences.getString("businessController1");
    String businessController2 = preferences.getString("businessController2");
    String businessController3 = preferences.getString("businessController3");
    String businessController4 = preferences.getString("businessController4");
    String businessController5 = preferences.getString("businessController5");
    String businessController6 = preferences.getString("businessController6");
    String wholeMpan = preferences.getString("WholeMpan");

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
    String rhtCheckBox = preferences.getString("RHTCheckbox");
    String bteCustomerMop = preferences.getString("EleEleMopCustomer");
    String bteCustomerDaDc = preferences.getString("EleEleMopCustomerDADC");

    print('#####Electricity Electricity########$fullMpan');
    print('#####Electricity Electricity########$wholeMpan');
    if (fullMpan != null) {
      return new EleEleCredentials(
        mpanCodeController: mpanCodeController,
        wholeMpan: wholeMpan,
        rhtcheckbox: rhtCheckBox,
        fullMpan: fullMpan,
        businessController1: businessController1,
        businessController2: businessController2,
        businessController3: businessController3,
        businessController4: businessController4,
        businessController5: businessController5,
        businessController6: businessController6,
        dteElecStartDate: contractStartDate,
        dtContractEndDateEle: contractEndDate,
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
    preferences.setString("FullMpan", null);
  }

//Individual Contract UniqueRefNo

  static void setContractUniqueRefNo(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    print(credentials.toJson());
    print(credentials.strUniqueRefNo);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (credentials.strUniqueRefNo != null) {
      sharedPreferences.setString(
          "contractUniqueRefNo", credentials.strUniqueRefNo);
    }
    // if (credentials.letter != null) {
    //   sharedPreferences.setBool("contractLetter", credentials.letter);
    // }
    // if (credentials.email != null) {
    //   sharedPreferences.setBool("contractEmail", credentials.email);
    // }
    // if (credentials.phone != null) {
    //   sharedPreferences.setBool("contractPhone", credentials.phone);
    // }
    if (credentials.bitLtd != null) {
      sharedPreferences.setString("contractLtd", credentials.bitLtd);
    }
    if (credentials.bitPlc != null) {
      sharedPreferences.setString("contractPlc", credentials.bitPlc);
    }
    if (credentials.bitCharity != null) {
      sharedPreferences.setString("contractCharity", credentials.bitCharity);
    }
    if (credentials.bitPublicSector != null) {
      sharedPreferences.setString(
          "contractPublicSector", credentials.bitPublicSector);
    }
    if (credentials.bitST != null) {
      sharedPreferences.setString("contractSoleProp", credentials.bitST);
    }
    if (credentials.bteMicroBusiness != null) {
      sharedPreferences.setString(
          "contractMicroBusiness", credentials.bteMicroBusiness);
    }
    if (credentials.bitLlc != null) {
      sharedPreferences.setString("contractLlc", credentials.bitLlc);
    }
    if (credentials.bitLlp != null) {
      sharedPreferences.setString("contractLlp", credentials.bitLlp);
    }
    if (credentials.bitOther != null) {
      sharedPreferences.setString("contractOther", credentials.bitOther);
    }
    if (credentials.bitpPPC != null) {
      sharedPreferences.setString("contractPpc", credentials.bitpPPC);
    }
    //Partnership
    // if (credentials.bitPublicSector != null) {
    //   sharedPreferences.setString(
    //       "contractPublicSector", credentials.bitPublicSector);
    // }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractUniqueRefNo() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractUniqueRefNo = preferences.getString("contractUniqueRefNo");
    String contractLtd = preferences.getString("contractLtd");
    String contractPlc = preferences.getString("contractPlc");
    String contractCharity = preferences.getString("contractCharity");
    String contractPublicSector = preferences.getString("contractPublicSector");
    String contractSoleProp = preferences.getString("contractSoleProp");
    String contractMicroBusiness =
        preferences.getString("contractMicroBusiness");
    String contractLlc = preferences.getString("contractLlc");
    String contractLlp = preferences.getString("contractLlp");
    String contractOther = preferences.getString("contractOther");
    String contractPpc = preferences.getString("contractPpc");
    bool letter = preferences.getBool("letter");
    bool email = preferences.getBool("email");
    bool phone = preferences.getBool("phone");

    print('#####Contaract Unique Ref########$contractOther');

    //  if (contractUniqueRefNo != null) {
    return new SaveAndGenerateContractAddMethodCredential(
        strUniqueRefNo: contractUniqueRefNo,
        bitLtd: contractLtd,
        bitPlc: contractPlc,
        bitCharity: contractCharity,
        bitPublicSector: contractPublicSector,
        bitST: contractSoleProp,
        bteMicroBusiness: contractMicroBusiness,
        bitLlc: contractLlc,
        bitLlp: contractLlp,
        bitOther: contractOther,
        bitpPPC: contractPpc
        // letter: letter,
        // phone: phone,
        // email: email,
        );
    // } else {
    //   return null;
    // }
  }

  static void clearContractUniqueRefValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractUniqueRefNo", null);
  }

  static void setContractBusinessDetails(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    print(credentials.toJson());
    print(credentials.strBusinessnames);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strBusinessnames != null) {
      sharedPreferences.setString(
          "contractBusinessName", credentials.strBusinessnames);
    }
    if (credentials.RegisterCompanyName != null) {
      sharedPreferences.setString(
          "contractRegCompanyName", credentials.RegisterCompanyName);
    }
    if (credentials.RegisterCompanyNo != null) {
      sharedPreferences.setString(
          "contractRegCompanyNo", credentials.RegisterCompanyNo);
    }
    if (credentials.RegisterCharityNo != null) {
      sharedPreferences.setString(
          "contractCharityRegNo", credentials.RegisterCharityNo);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractBusinessDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractBusinessName = preferences.getString("contractBusinessName");
    String contractRegCompanyName =
        preferences.getString("contractRegCompanyName");
    String contractRegCompanyNo = preferences.getString("contractRegCompanyNo");
    String contractCharityRegNo = preferences.getString("contractCharityRegNo");

    print('#####Contaract Business Details########$contractBusinessName');

    //  if (contractBusinessName != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strBusinessnames: contractBusinessName,
      RegisterCompanyName: contractRegCompanyName,
      RegisterCompanyNo: contractRegCompanyNo,
      RegisterCharityNo: contractCharityRegNo,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractBusinessDetailsValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractBusinessName", null);
  }

  static void setContractSiteAddress(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    print(credentials.toJson());
    print(credentials.strSiteAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strSiteAddress1 != null) {
      sharedPreferences.setString(
          "contractSiteAddress", credentials.strSiteAddress1);
    }
    if (credentials.strSiteTown != null) {
      sharedPreferences.setString("contractSiteTown", credentials.strSiteTown);
    }
    if (credentials.strPostcodeHome != null) {
      sharedPreferences.setString(
          "contractSitePostCode", credentials.strPostcodeBusiness);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractSiteAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractSiteAddress = preferences.getString("contractSiteAddress");
    String contractSiteTown = preferences.getString("contractSiteTown");
    String contractSitePostCode = preferences.getString("contractSitePostCode");

    print('#####Contaract Site Address########$contractSiteAddress');

    //  if (contractSiteAddress != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strSiteAddress1: contractSiteAddress,
      strSiteTown: contractSiteTown,
      strPostcodeHome: contractSitePostCode,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractSiteAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractSiteAddress", null);
  }

  static void setContractBillingAddress(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    print(credentials.toJson());
    print(credentials.strAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strAddress1 != null) {
      sharedPreferences.setString(
          "contractBillingAddress", credentials.strAddress1);
    }
    if (credentials.strTown != null) {
      sharedPreferences.setString("contractBillingTown", credentials.strTown);
    }
    if (credentials.strPostcodeHome != null) {
      sharedPreferences.setString(
          "contractBillingPostCode", credentials.strPostcodeHome);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractBillingAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractBillingAddress =
        preferences.getString("contractBillingAddress");
    String contractBillingTown = preferences.getString("contractBillingTown");
    String contractBillingPostCode =
        preferences.getString("contractBillingPostCode");

    print('#####Contaract Billing Details########$contractBillingAddress');

    //  if (contractBillingAddress != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strAddress1: contractBillingAddress,
      strTown: contractBillingTown,
      strPostcodeHome: contractBillingPostCode,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractBillingAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractBillingAddress", null);
  }

  static void setContractEam(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    // print(credentials.toJson());
    print(credentials.strFullName);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strFullName != null) {
      sharedPreferences.setString("contractEamName", credentials.strFullName);
    }
    if (credentials.strEmailHome != null) {
      sharedPreferences.setString("contractEamEmail", credentials.strEmailHome);
    }
    if (credentials.strPhoneHome != null) {
      sharedPreferences.setString("contractEamPhone", credentials.strPhoneHome);
    }
    if (credentials.MobileNo != null) {
      sharedPreferences.setString("contractEamMobile", credentials.MobileNo);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractEam() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractEamName = preferences.getString("contractEamName");
    String contractEamEmail = preferences.getString("contractEamEmail");
    String contractEamPhone = preferences.getString("contractEamPhone");
    String contractEamMobile = preferences.getString("contractEamMobile");

    print('#####Contaract EAM########$contractEamName');

    //  if (contractEamName != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strFullName: contractEamName,
      strEmailHome: contractEamEmail,
      strPhoneHome: contractEamPhone,
      MobileNo: contractEamMobile,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractEam() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractEamName", null);
  }

//Contract Electricity

  static void setContractElectricity(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    // print(credentials.toJson());
    print(credentials.strDayUnitE + 'test day credential');
    print(credentials.strNightUnit + '...NIGHT...');

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strMPAN1 != null) {
      sharedPreferences.setString("contractMpanCode", credentials.strMPAN1);
    }
    if (credentials.strMPAN2 != null) {
      sharedPreferences.setString("contractMpan1", credentials.strMPAN2);
    }
    if (credentials.strMPAN3 != null) {
      sharedPreferences.setString("contractMpan2", credentials.strMPAN3);
    }
    if (credentials.strMPAN4 != null) {
      sharedPreferences.setString("contractMpan3", credentials.strMPAN4);
    }
    if (credentials.strMPAN5 != null) {
      sharedPreferences.setString("contractMpan4", credentials.strMPAN5);
    }
    if (credentials.strMPAN6 != null) {
      sharedPreferences.setString("contractMpan5", credentials.strMPAN6);
    }
    if (credentials.strMPAN7 != null) {
      sharedPreferences.setString("contractMpan6", credentials.strMPAN7);
    }
    if (credentials.strSCE != null) {
      sharedPreferences.setString(
          "contractEleStandingCharge", credentials.strSCE);
    }
    if (credentials.strDayUnitE != null) {
      sharedPreferences.setString(
          "contractgEleDayUnitCharge", credentials.strDayUnitE);
    }
    if (credentials.strNightUnit != null) {
      sharedPreferences.setString(
          "contractgEleNightUnitCharge", credentials.strNightUnit);
    }
    if (credentials.strEweUnit != null) {
      sharedPreferences.setString(
          "contractEleEweUnitCharge", credentials.strEweUnit);
    }
    if (credentials.strcapacitycharge != null) {
      sharedPreferences.setString(
          "contractEleCapacityCharge", credentials.strcapacitycharge);
    }

    //Supply Capacity Not present in Api
    if (credentials.strexcesscapacity != null) {
      sharedPreferences.setString(
          "contractEleExcessCapacityCharge", credentials.strexcesscapacity);
    }
    if (credentials.strreactivecharge != null) {
      sharedPreferences.setString(
          "contractEleReactiveCharge", credentials.strreactivecharge);
    }
    if (credentials.strContractStartDate != null) {
      sharedPreferences.setString(
          "contractEleStartDate", credentials.strContractStartDate);
    }
    if (credentials.strContractEndDate != null) {
      sharedPreferences.setString(
          "contractEleEndDate", credentials.strContractEndDate);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractElectricity() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractMpanCode = preferences.getString("contractMpanCode");
    String contractMpan1 = preferences.getString("contractMpan1");
    String contractMpan2 = preferences.getString("contractMpan2");
    String contractMpan3 = preferences.getString("contractMpan3");
    String contractMpan4 = preferences.getString("contractMpan4");
    String contractMpan5 = preferences.getString("contractMpan5");
    String contractMpan6 = preferences.getString("contractMpan6");
    String contractEleStandingCharge =
        preferences.getString("contractEleStandingCharge");
    String contractEleDayUnitCharge =
        preferences.getString("contractgEleDayUnitCharge");
    String contractEleNightUnitCharge =
        preferences.getString("contractgEleNightUnitCharge");
    String contractEleEweUnitCharge =
        preferences.getString("contractEleEweUnitCharge");
    String contractEleCapacityCharge =
        preferences.getString("contractEleCapacityCharge");
    String contractEleExcessCapacityCharge =
        preferences.getString("contractEleExcessCapacityCharge");

    String contractEleReactiveCharge =
        preferences.getString("contractEleReactiveCharge");
    String contractEleStartDate = preferences.getString("contractEleStartDate");
    String contractEleEndDate = preferences.getString("contractEleEndDate");

    print('#####Contaract Electricity########$contractMpanCode');

    //  if (contractMpan1 != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strMPAN1: contractMpanCode,
      strMPAN2: contractMpan1,
      strMPAN3: contractMpan2,
      strMPAN4: contractMpan3,
      strMPAN5: contractMpan4,
      strMPAN6: contractMpan5,
      strMPAN7: contractMpan6,
      strSCE: contractEleStandingCharge,
      strDayUnitE: contractEleDayUnitCharge,
      strNightUnit: contractEleNightUnitCharge,
      strEweUnit: contractEleEweUnitCharge,
      strcapacitycharge: contractEleCapacityCharge,
      strexcesscapacity: contractEleExcessCapacityCharge,
      strreactivecharge: contractEleReactiveCharge,
      strContractStartDate: contractEleStartDate,
      strContractEndDate: contractEleEndDate,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractElectricity() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractMpan1", null);
  }

//Contract Gas

  static void setContractGas(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    print(credentials.toJson());
    print(credentials.strMPRN);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strMPRN != null) {
      sharedPreferences.setString("contractGasMprn", credentials.strMPRN);
    }
    if (credentials.strSCG != null) {
      sharedPreferences.setString(
          "contractGasStandingCharge", credentials.strSCG);
    }
    if (credentials.strDayUnitG != null) {
      sharedPreferences.setString(
          "contractGasUnitCharge", credentials.strDayUnitG);
    }
    if (credentials.strContractStartDateGas != null) {
      sharedPreferences.setString(
          "contractGasStartDate", credentials.strContractStartDateGas);
    }
    if (credentials.strContractEndDateGas != null) {
      sharedPreferences.setString(
          "contractGasEndDate", credentials.strContractEndDateGas);
    }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractGas() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractGasMprn = preferences.getString("contractGasMprn");
    String contractGasStandingCharge =
        preferences.getString("contractGasStandingCharge");
    String contractGasUnitCharge =
        preferences.getString("contractGasUnitCharge");
    String contractGasStartDate = preferences.getString("contractGasStartDate");
    String contractGasEndDate = preferences.getString("contractGasEndDate");

    print('#####Contaract Gas########$contractGasMprn');

    //  if (contractGasMprn != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strMPRN: contractGasMprn,
      strSCG: contractGasStandingCharge,
      strDayUnitG: contractGasUnitCharge,
      strContractStartDateGas: contractGasStartDate,
      strContractEndDateGas: contractGasEndDate,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractGas() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractGasMprn", null);
  }

  //Contract Direct Debit Agreement

  static void setContratDirectDebitAgreement(
      SaveAndGenerateContractAddMethodCredential credentials) async {
    // print(credentials.toJson());
    print(credentials.strUniqueRefNo);

    final sharedPreferences = await SharedPreferences.getInstance();
    if (credentials.strUniqueRefNo != null) {
      sharedPreferences.setString(
          "contractDdaUniqueRef", credentials.strUniqueRefNo);
    }
    if (credentials.strACHolderName != null) {
      sharedPreferences.setString(
          "contractDdaAccountHolderName", credentials.strACHolderName);
    }
    if (credentials.strBusinessnames != null) {
      sharedPreferences.setString(
          "contractDdaBusinessName", credentials.strBusinessnames);
    }
    if (credentials.strACBranchCode1 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode1", credentials.strACBranchCode1);
    }
    if (credentials.strACBranchCode2 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode2", credentials.strACBranchCode2);
    }
    if (credentials.strACBranchCode3 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode3", credentials.strACBranchCode3);
    }
    if (credentials.strACBranchCode4 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode4", credentials.strACBranchCode4);
    }
    if (credentials.strACBranchCode5 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode5", credentials.strACBranchCode5);
    }
    if (credentials.strACBranchCode6 != null) {
      sharedPreferences.setString(
          "contractDdaBranchCode6", credentials.strACBranchCode6);
    }
    if (credentials.strACNumber != null) {
      sharedPreferences.setString(
          "contractDdaAccountNo", credentials.strACNumber);
    }
    // if (credentials.strACOwnerName != null) {
    //   sharedPreferences.setString(
    //       "contractDdaOwnerName", credentials.strACOwnerName);
    //  }
    if (credentials.strACTo != null) {
      sharedPreferences.setString("contractDdaTo", credentials.strACTo);
    }
    // if (credentials.isSeventh != null) {
    //   sharedPreferences.setBool("contractDdaIsSeventh", credentials.isSeventh);
    // }
    // if (credentials.isFourteenth != null) {
    //   sharedPreferences.setBool(
    //       "contractDdaIsFourteenth", credentials.isFourteenth);
    // }
    // if (credentials.isTwentyFirst != null) {
    //   sharedPreferences.setBool(
    //       "contractDdaIsTwentyFirst", credentials.isTwentyFirst);
    // }
    // if (credentials.isTwenthEighth != null) {
    //   sharedPreferences.setBool(
    //       "contractDdaIsTwenthEighth", credentials.isTwenthEighth);
    // }
    // if (credentials.bankOrBuildingAddress != null) {
    //   sharedPreferences.setString("contractDdaBankOrBuildingAddress",
    //       credentials.bankOrBuildingAddress);
    // }
    // if (credentials.sign != null) {
    //   sharedPreferences.setString("contractDdaSign", credentials.sign);
    // }
    // if (credentials.name != null) {
    //   sharedPreferences.setString("contractDdaName", credentials.name);
    // }
    // if (credentials.companyName != null) {
    //   sharedPreferences.setString(
    //       "contractDdaCompanyName", credentials.companyName);
    // }
    // if (credentials.date != null) {
    //   sharedPreferences.setString("contractDdaDate", credentials.date);
    // }
  }

  static Future<SaveAndGenerateContractAddMethodCredential>
      getContractDda() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String contractDdaUniqueRef = preferences.getString("contractDdaUniqueRef");
    String contractDdaAccountHolderName =
        preferences.getString("contractDdaAccountHolderName");
    String contractDdaBusinessName =
        preferences.getString("contractDdaBusinessName");
    String contractDdaBranchCode1 =
        preferences.getString("contractDdaBranchCode1");
    String contractDdaBranchCode2 =
        preferences.getString("contractDdaBranchCode2");
    String contractDdaBranchCode3 =
        preferences.getString("contractDdaBranchCode3");
    String contractDdaBranchCode4 =
        preferences.getString("contractDdaBranchCode4");
    String contractDdaBranchCode5 =
        preferences.getString("contractDdaBranchCode5");
    String contractDdaBranchCode6 =
        preferences.getString("contractDdaBranchCode6");

    String contractDdaAccountNo = preferences.getString("contractDdaAccountNo");

    String contractDdaOwnerName = preferences.getString("contractDdaOwnerName");

    String contractDdaTo = preferences.getString("contractDdaTo");
    bool contractDdaIsSeventh = preferences.getBool("contractDdaIsSeventh");
    bool contractDdaIsFourteenth =
        preferences.getBool("contractDdaIsFourteenth");
    bool contractDdaIsTwentyFirst =
        preferences.getBool("contractDdaIsTwentyFirst");
    bool contractDdaIsTwenthEighth =
        preferences.getBool("contractDdaIsTwenthEighth");
    String contractDdaBankOrBuildingAddress =
        preferences.getString("contractDdaBankOrBuildingAddress");
    String contractDdaSign = preferences.getString("contractDdaSign");
    String contractDdaName = preferences.getString("contractDdaName");
    String contractDdaCompanyName =
        preferences.getString("contractDdaCompanyName");
    String contractDdaDate = preferences.getString("contractDdaDate");

    print('#####Contaract DDA########$contractDdaUniqueRef');

    //  if (contractDdaUniqueRef != null) {
    return new SaveAndGenerateContractAddMethodCredential(
      strUniqueRefNo: contractDdaUniqueRef,
      strACHolderName: contractDdaAccountHolderName,
      strBusinessnames: contractDdaBusinessName,
      strACBranchCode1: contractDdaBranchCode1,
      strACBranchCode2: contractDdaBranchCode2,
      strACBranchCode3: contractDdaBranchCode3,
      strACBranchCode4: contractDdaBranchCode4,
      strACBranchCode5: contractDdaBranchCode5,
      strACBranchCode6: contractDdaBranchCode6,
      strFullName: contractDdaBusinessName,
      strACNumber: contractDdaAccountNo,

      // strACOwnerName: contractDdaOwnerName,
      strACTo: contractDdaTo,

      // isFourteenth: contractDdaIsFourteenth,
      // isSeventh: contractDdaIsSeventh,
      // isTwenthEighth: contractDdaIsTwenthEighth,
      // isTwentyFirst: contractDdaIsTwentyFirst,
      // bankOrBuildingAddress: contractDdaBankOrBuildingAddress,
      // name: contractDdaName,
      // sign: contractDdaSign,
      // date: contractDdaDate,
      // companyName: contractDdaCompanyName,
    );
    // } else {
    //   return null;
    // }
  }

  static void clearContractDda() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("contractDdaUniqueRef", null);
  }
}
