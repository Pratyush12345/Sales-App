import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/PrimaryContactC%20redential.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Gas_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Business_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_SiteAdd_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_BillAdd_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_EAM_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Payment_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Partner_Credential.dart';
import 'package:pozitive/Core/Model/Api/Gas-Insert-AddProspect/Gas_Group_Credential.dart';

class GasPref {
// Gas -> Gas Tab setMethod
  static void setGasGasValues(GasGasCredential credential) async {
    print('Gas setGas${credential.toJson()}');
    print(credential.fullMprn);
    final sharedPreferences = await SharedPreferences.getInstance();

    if (credential.fullMprn != null) {
      sharedPreferences.setString("GfullMprn", credential.fullMprn);
    }
    if (credential.intContractEndDateSelected != null) {
      sharedPreferences.setString(
          "GintContractEndDateSelected", credential.intContractEndDateSelected);
    }
    if (credential.dteGasStartDate != null) {
      sharedPreferences.setString(
          "GdteGasStartDate", credential.dteGasStartDate);
    }
    if (credential.strContractTermGas != null) {
      sharedPreferences.setString(
          "GstrContractTermGas", credential.strContractTermGas);
    }
    if (credential.strStandingChargeGas != null) {
      sharedPreferences.setString(
          "GstrStandingChargeGas", credential.strStandingChargeGas);
    }
    if (credential.strUnitPriceGas != null) {
      sharedPreferences.setString(
          "GstrUnitPriceGas", credential.strUnitPriceGas);
    }
    if (credential.endDate != null) {
      sharedPreferences.setString("GaqGasOtherEndDate", credential.endDate);
    }
    //For AQChrarge
    if (credential.aqGasCharge != null) {
      sharedPreferences.setString("GaqGasCharge", credential.aqGasCharge);
    }
  }

// Gas -> Gas Tab getMethod

  static Future<GasGasCredential> getGasGasValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String gasintContractEndDateSelected =
        preferences.getString("GintContractEndDateSelected");
    String gasfullMprn = preferences.getString("GfullMprn");
    String gasdteGasStartDate = preferences.getString("GdteGasStartDate");
    String gasstrContractTermGas = preferences.getString("GstrContractTermGas");
    String gasstrStandingChargeGas =
        preferences.getString("GstrStandingChargeGas");
    String gasstrUnitPriceGas = preferences.getString("GstrUnitPriceGas");
    String gasaqGasCharge = preferences.getString("GaqGasCharge");
    String gaqGasOtherEndDate = preferences.getString("GaqGasOtherEndDate");

    print('#######Gas Gas Values#######$gasfullMprn');
    if (gasfullMprn != null) {
      return new GasGasCredential(
        fullMprn: gasfullMprn,
        dteGasStartDate: gasdteGasStartDate,
        strUnitPriceGas: gasstrUnitPriceGas,
        strContractTermGas: gasstrContractTermGas,
        aqGasCharge: gasaqGasCharge,
        intContractEndDateSelected: gasintContractEndDateSelected,
        strStandingChargeGas: gasstrStandingChargeGas,
        endDate: gaqGasOtherEndDate,
      );
    } else {
      return null;
    }
  }

  static void clearGasGasValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("GfullMprn", null);
  }

// Gas -> Business Details Tab setMethod

  static void setGasBusinessValues(GasBusinessCredential credential) async {
    print(credential.toJson());
    print(credential.gbusiness_Name);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (credential.gbusiness_Name != null) {
      sharedPreferences.setString("gbusiness_Name", credential.gbusiness_Name);
    }
    if (credential.gbusiness_Type != null) {
      sharedPreferences.setString("gbusiness_Type", credential.gbusiness_Type);
    }
    if (credential.galternative_Number != null) {
      sharedPreferences.setString("gtelNo", credential.galternative_Number);
    }
    if (credential.gemail != null) {
      sharedPreferences.setString("gemail", credential.gemail);
    }
    if (credential.gstrNameOfBill != null) {
      sharedPreferences.setString("gstrNameOfBill", credential.gstrNameOfBill);
    }
    if (credential.gstrSupplyName != null) {
      sharedPreferences.setString("gstrSupplyName", credential.gstrSupplyName);
    }
    if (credential.gstrCompanyRegNo != null) {
      sharedPreferences.setString(
          "gstrCompanyRegNo", credential.gstrCompanyRegNo);
    }
    if (credential.gstrEAMobileNo != null) {
      sharedPreferences.setString("ggasMobileNo", credential.gstrEAMobileNo);
    }
    if (credential.gregisteredCompanyName != null) {
      sharedPreferences.setString(
          "gregisteredCompanyName", credential.gregisteredCompanyName);
    }
    if (credential.gbtePaperBill != null) {
      sharedPreferences.setString("gbtePaperBill", credential.gbtePaperBill);
    }
    if (credential.gbtemicrobuisnes != null) {
      sharedPreferences.setString(
          "gbtemicrobuisnes", credential.gbtemicrobuisnes);
    }
    if (credential.gstrPropertOwnerShip != null) {
      sharedPreferences.setString(
          "gstrPropertOwnerShip", credential.gstrPropertOwnerShip);
    }
    if (credential.gstrCustomerRefNo != null) {
      sharedPreferences.setString(
          "gstrCustomerRefNo", credential.gstrCustomerRefNo);
    }
  }

// Gas -> Business Details Tab getMethod

  static Future<GasBusinessCredential> getGasBusinessValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String gbusiness_Name = preferences.getString("gbusiness_Name");
    String gbusiness_Type = preferences.getString("gbusiness_Type");
    String gtelNo = preferences.getString("gtelNo");
    String gemail = preferences.getString("gemail");
    String gstrNameOfBill = preferences.getString("gstrNameOfBill");
    String gstrSupplyName = preferences.getString("gstrSupplyName");
    String gstrCompanyRegNo = preferences.getString("gstrCompanyRegNo");
    String ggasMobileNo = preferences.getString("ggasMobileNo");
    String gregisteredCompanyName =
        preferences.getString("gregisteredCompanyName");
    String gbtePaperBill = preferences.getString("gbtePaperBill");
    String gbtemicrobuisnes = preferences.getString("gbtemicrobuisnes");
    String gstrPropertOwnerShip = preferences.getString("gstrPropertOwnerShip");
    String gstrCustomerRefNo = preferences.getString("gstrCustomerRefNo");

    print('#####Gas Business Details########$gbusiness_Name');
    if (gbusiness_Name != null) {
      return new GasBusinessCredential(
        gbusiness_Name: gbusiness_Name,
        gbusiness_Type: gbusiness_Type,
        galternative_Number: gtelNo,
        gemail: gemail,
        gstrNameOfBill: gstrNameOfBill,
        gstrSupplyName: gstrSupplyName,
        gstrCompanyRegNo: gstrCompanyRegNo,
        gstrEAMobileNo: ggasMobileNo,
        gregisteredCompanyName: gregisteredCompanyName,
        gbtePaperBill: gbtePaperBill,
        gbtemicrobuisnes: gbtemicrobuisnes,
        gstrPropertOwnerShip: gstrPropertOwnerShip,
        gstrCustomerRefNo: gstrCustomerRefNo,
      );
    } else {
      return null;
    }
  }

  static void clearGasBusinessValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gbusiness_Name", null);
  }

  ////Gas -> Site Address Tab setMethod

  static void setGasSiteAddressValues(
      GasSiteAddressCredential credential) async {
    print(credential.toJson());
    print(credential.strSiteAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (credential.strSiteAddress1 != null) {
      sharedPreferences.setString("gSiteAddress1", credential.strSiteAddress1);
    }
    if (credential.strSiteTown != null) {
      sharedPreferences.setString("gSiteTown", credential.strSiteTown);
    }
    if (credential.strSiteAddress2 != null) {
      sharedPreferences.setString("gSiteAddress2", credential.strSiteAddress2);
    }
    if (credential.strSitePostCode != null) {
      sharedPreferences.setString("gSitePostCode", credential.strSitePostCode);
    }
  }
//Gas -> Site Address Tab getMethod

  static Future<GasSiteAddressCredential> getGasSiteAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String siteAddress1 = preferences.getString("gSiteAddress1");
    String city = preferences.getString("gSiteTown");
    String siteAddress2 = preferences.getString("gSiteAddress2");
    String strSitePostCode = preferences.getString("gSitePostCode");

    print('#####Gas Site Address########$siteAddress1');
    if (siteAddress1 != null) {
      return new GasSiteAddressCredential(
        strSiteAddress1: siteAddress1,
        strSiteTown: city,
        strSiteAddress2: siteAddress2,
        strSitePostCode: strSitePostCode,
      );
    } else {
      return null;
    }
  }

  static void clearGasSiteAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gSiteAddress1", null);
  }

//Gas ->Billing Address Tab setMethod

  static void setGasBillAddValues(
      GasBillAddCredential gasBillAddCredential) async {
    print(gasBillAddCredential.toJson());
    print(gasBillAddCredential.strBillAddress1);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasBillAddCredential.sameAsSite != null) {
      sharedPreferences.setString(
          "gSameAsSite", gasBillAddCredential.sameAsSite);
    }
    if (gasBillAddCredential.strBillAddress1 != null) {
      sharedPreferences.setString(
          "gBillAddress1", gasBillAddCredential.strBillAddress1);
    }
    if (gasBillAddCredential.town1 != null) {
      sharedPreferences.setString("gBillCity", gasBillAddCredential.town1);
    }
    if (gasBillAddCredential.strBillAddress2 != null) {
      sharedPreferences.setString(
          "gBillAddress2", gasBillAddCredential.strBillAddress2);
    }
    if (gasBillAddCredential.strBillPostCode != null) {
      sharedPreferences.setString(
          "gBillPostCode", gasBillAddCredential.strBillPostCode);
    }
    if (gasBillAddCredential.strBillinTermType != null) {
      sharedPreferences.setString(
          "gBillTermType", gasBillAddCredential.strBillinTermType);
    }
  }
//Gas ->Billing Address Tab getMethod

  static Future<GasBillAddCredential> getGasBillAddValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String billingAddress1 = preferences.getString("gBillAddress1");
    String billingCity = preferences.getString("gBillCity");
    String billingAddress2 = preferences.getString("gBillAddress2");
    String billingPostCode = preferences.getString("gBillPostCode");
    String billTermType = preferences.getString("gBillTermType");
    String sameAsSite = preferences.getString("gSameAsSite");

    print('#####Gas Bill Address########$billingAddress1');
    if (billingAddress1 != null) {
      return new GasBillAddCredential(
        strBillAddress1: billingAddress1,
        town1: billingCity,
        strBillAddress2: billingAddress2,
        strBillPostCode: billingPostCode,
        strBillinTermType: billTermType,
        sameAsSite: sameAsSite,
      );
    } else {
      return null;
    }
  }

  static void clearGasBillAddressValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gBillAddress1", null);
  }

  ///
  // PrimaryContact Details
  static Future<GASPrimaryContactCredential> getGASPrimaryContact() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String primaryTitle = preferences.getString("gasPrimaryTitle");
    String primaryFirstName = preferences.getString("gasPrimaryFirstName");
    String primaryLastName = preferences.getString("gasPrimaryLastName");
    String primaryPhone = preferences.getString("gasPrimaryPhone");
    String primaryEmail = preferences.getString("gasPrimaryEmail");

    if (primaryTitle != null) {
      return new GASPrimaryContactCredential(
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

  static void setGASPrimaryContact(
      GASPrimaryContactCredential primaryContactCredential) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (primaryContactCredential.primaryTitle != null) {
      sharedPreferences.setString(
          "gasPrimaryTitle", primaryContactCredential.primaryTitle);
    }
    if (primaryContactCredential.primaryFirstName != null) {
      sharedPreferences.setString(
          "gasPrimaryFirstName", primaryContactCredential.primaryFirstName);
    }
    if (primaryContactCredential.primaryLastName != null) {
      sharedPreferences.setString(
          "gasPrimaryLastName", primaryContactCredential.primaryLastName);
    }
    if (primaryContactCredential.primaryPhone != null) {
      sharedPreferences.setString(
          "gasPrimaryPhone", primaryContactCredential.primaryPhone);
    }
    if (primaryContactCredential.primaryEmail != null) {
      sharedPreferences.setString(
          "gasPrimaryEmail", primaryContactCredential.primaryEmail);
    }
  }

  static void clearGASPrimaryContactValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gasPrimaryTitle", null);
  }

  ///
//Gas-> Energy Account Manager Tab setMethod

  static void setGasEAMValues(GasEAMCredential gasEAMCredential) async {
    print(gasEAMCredential.toJson());
    print(gasEAMCredential.strEAName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasEAMCredential.strEAName != null) {
      sharedPreferences.setString("gEAName", gasEAMCredential.strEAName);
    }
    if (gasEAMCredential.strEAEmail != null) {
      sharedPreferences.setString("gEAEmail", gasEAMCredential.strEAEmail);
    }
    if (gasEAMCredential.strEAPhoneNo != null) {
      sharedPreferences.setString("gEAPhoneNO", gasEAMCredential.strEAPhoneNo);
    }
    if (gasEAMCredential.strEAMobileNo != null) {
      sharedPreferences.setString(
          "gEAMobileNo", gasEAMCredential.strEAMobileNo);
    }
  }

//Gas-> Energy Account Manager Tab getMethod

  static Future<GasEAMCredential> getGasEAMValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String eaName = preferences.getString("gEAName");
    String eaEmail = preferences.getString("gEAEmail");
    String eaPhoneNo = preferences.getString("gEAPhoneNO");
    String eaMobileNo = preferences.getString("gEAMobileNo");

    print('#####Gas EAM ########$eaName');
    if (eaName != null) {
      return new GasEAMCredential(
        strEAName: eaName,
        strEAEmail: eaEmail,
        strEAPhoneNo: eaPhoneNo,
        strEAMobileNo: eaMobileNo,
      );
    } else {
      return null;
    }
  }

  static void clearGasEAMValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gEAName", null);
  }

  ///Gas Tab Payment Details (Add Prospect) setMethod

  static void setGasPaymentValues(
      GasPaymentCredential gasPaymentCredential) async {
    print(gasPaymentCredential.toJson());
    print(gasPaymentCredential.gasstrBankACName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasPaymentCredential.gasstrPaymentType != null) {
      sharedPreferences.setString(
          "gasPaymentMethod", gasPaymentCredential.gasstrPaymentType);
    }
    if (gasPaymentCredential.gasstrBankACName != null) {
      sharedPreferences.setString(
          "gasAccountName", gasPaymentCredential.gasstrBankACName);
    }
    if (gasPaymentCredential.gasstrBankACNo != null) {
      sharedPreferences.setString(
          "gasAccountNumber", gasPaymentCredential.gasstrBankACNo);
    }
    if (gasPaymentCredential.gasstrBankSortCode != null) {
      sharedPreferences.setString(
          "gasSortCode", gasPaymentCredential.gasstrBankSortCode);
    }
    if (gasPaymentCredential.gasstrBankName != null) {
      sharedPreferences.setString(
          "gasBankName", gasPaymentCredential.gasstrBankName);
    }
    if (gasPaymentCredential.gasgasPaymentTermDays != null) {
      sharedPreferences.setString(
          "gasgasPaymentTermDays", gasPaymentCredential.gasgasPaymentTermDays);
    }
    if (gasPaymentCredential.gascardNo != null) {
      sharedPreferences.setString("gasCardNo", gasPaymentCredential.gascardNo);
    }
    if (gasPaymentCredential.gasddAmounts != null) {
      sharedPreferences.setString(
          "gasDDAmount", gasPaymentCredential.gasddAmounts);
    }
    if (gasPaymentCredential.gasddDays != null) {
      sharedPreferences.setString("gasDDDays", gasPaymentCredential.gasddDays);
    }
  }

//Gas Tab Payment Details (Add Prospect) getMethod

  static Future<GasPaymentCredential> getGasPaymentValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String gaspaymentMethod = preferences.getString("gasPaymentMethod");
    String gasaccountName = preferences.getString("gasAccountName");
    String gasaccountNo = preferences.getString("gasAccountNumber");
    String gassortCode = preferences.getString("gasSortCode");
    String gasbankName = preferences.getString("gasBankName");
    String gasCardNo = preferences.getString("gasCardNo");
    String gasDDAmount = preferences.getString("gasDDAmount");
    String gasDDDays = preferences.getString("gasDDDays");

    String gasgasPaymentTermDays =
        preferences.getString("gasgasPaymentTermDays");

    print('####Gas Payment########$gasaccountName');
    if (gasaccountName != null) {
      return new GasPaymentCredential(
          gasstrPaymentType: gaspaymentMethod,
          gasstrBankACName: gasaccountName,
          gasstrBankACNo: gasaccountNo,
          gasstrBankSortCode: gassortCode,
          gasstrBankName: gasbankName,
          gasgasPaymentTermDays: gasgasPaymentTermDays,
          gascardNo: gasCardNo,
          gasddAmounts: gasDDAmount,
          gasddDays: gasDDDays);
    } else {
      return null;
    }
  }

  static void clearGasPaymentValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gasAccountName", null);
  }

////Gas Tab Par
  ///
  ///
  ///tner Details(Add Prospect) setMethod
  static void setGasPartnerValues(
      GasPartnerCredential gasPartnerCredential) async {
    print(gasPartnerCredential.toJson());
    print(gasPartnerCredential.partnerName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasPartnerCredential.partnerName != null) {
      sharedPreferences.setString(
          "gPartnerName", gasPartnerCredential.partnerName);
    }
    if (gasPartnerCredential.additionalEmail != null) {
      sharedPreferences.setString(
          "gAdditionalEmail", gasPartnerCredential.additionalEmail);
    }
    if (gasPartnerCredential.affiliateDetail != null) {
      sharedPreferences.setString(
          "gAffiliateDetail", gasPartnerCredential.affiliateDetail);
    }
    if (gasPartnerCredential.commissionType != null) {
      sharedPreferences.setString(
          "gCommissionType", gasPartnerCredential.commissionType);
    }
    if (gasPartnerCredential.gasFixed != null) {
      sharedPreferences.setString("ggasFixed", gasPartnerCredential.gasFixed);
    }
    if (gasPartnerCredential.gasScFixed != null) {
      sharedPreferences.setString(
          "ggasScFixed", gasPartnerCredential.gasScFixed);
    }
    if (gasPartnerCredential.commongasFixed != null) {
      sharedPreferences.setString(
          "commonggasFixed", gasPartnerCredential.commongasFixed);
    }
    if (gasPartnerCredential.commongasScFixed != null) {
      sharedPreferences.setString(
          "commonggasScFixed", gasPartnerCredential.commongasScFixed);
    }
  }

////Gas Tab Partner Detials(Add Prospect) getMethod

  static Future<GasPartnerCredential> getGasPartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String partnerName = preferences.getString("gPartnerName");
    String additionalEmail = preferences.getString("gAdditionalEmail");
    String affiliateDetail = preferences.getString("gAffiliateDetail");
    String commissionType = preferences.getString("gCommissionType");
    String gasFixed = preferences.getString("ggasFixed");
    String gasScFixed = preferences.getString("ggasScFixed");

    String commongasFixed = preferences.getString("commonggasFixed");
    String commongasScFixed = preferences.getString("commonggasScFixed");

    print('#####Gas Partner########$partnerName');
    if (partnerName != null) {
      return new GasPartnerCredential(
        partnerName: partnerName,
        additionalEmail: additionalEmail,
        affiliateDetail: affiliateDetail,
        commissionType: commissionType,
        gasFixed: gasFixed,
        gasScFixed: gasScFixed,
        commongasFixed: commongasFixed,
        commongasScFixed: commongasScFixed,
      );
    } else {
      return null;
    }
  }

  static void clearGasPartnerValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gPartnerName", null);
  }

////Gas Tab Group Details(Add Prospect) setMethod

  static void setGasGroupValues(GasGroupCredential gasGroupCredential) async {
    print(gasGroupCredential.toJson());
    print(gasGroupCredential.groupName);

    final sharedPreferences = await SharedPreferences.getInstance();

    if (gasGroupCredential.groupName != null) {
      sharedPreferences.setString("gGroupName", gasGroupCredential.groupName);
    }
  }

////Gas Tab Group Details(Add Prospect) getMethod

  static Future<GasGroupCredential> getGasGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String groupName = preferences.getString("gGroupName");

    print('#####Gas Group########$groupName');
    if (groupName != null) {
      return new GasGroupCredential(groupName: groupName);
    } else {
      return null;
    }
  }

  static void clearGasGroupValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("gGroupName", null);
  }
}
