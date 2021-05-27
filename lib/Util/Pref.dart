import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelSiteAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPaymentCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBillingAddressCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelAccountManagerCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelPartnerCredential.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelGroupCredential.dart';
import 'package:pozitive/Core/Model/request_quote_history_group_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_gas_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_price_electricity_gas_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_individual_model_Rq.dart';
import 'package:pozitive/Core/Model/sharePrefModel/quotation_electricity_model_Rq.dart';
import 'package:pozitive/Core/Model/Api/quotation_invidual/save_button_credentials.dart';
import 'package:pozitive/Core/Model/site_list_model.dart';

class Prefs {
  static Future<User> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String AccountId = preferences.getString("AccountId");
    String EmailId = preferences.getString("EmailId");
    String UserName = preferences.getString("UserName");
    String FirstName = preferences.getString('FirstName');
    String MiddleName = preferences.getString('MiddleName');
    String LastName = preferences.getString('LastName');
    String PhoneNo = preferences.getString('PhoneNo');
    String Address1 = preferences.getString('Address1');
    String Address2 = preferences.getString('Address2');
    String Postcode = preferences.getString('Postcode');
    String City = preferences.getString('City');

    print('#####pre#########$UserName');

    return new User(
        accountId: AccountId,
        firstName: FirstName,
        lastName: LastName,
        userName: UserName,
        address1: Address1,
        address2: Address2,
        emailId: EmailId,
        middleName: MiddleName,
        postcode: Postcode,
        phoneNo: PhoneNo,
        city: City);
  }

  static Future<RequestQuoteHistoryGroupModel>
      getGroupQuoteHistoryUserData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String AccountId = preferences.getString("AccountId");
    String CreatedAt = preferences.getString('strCreatedDate');
    String CreatedBy = preferences.getString('strCreatedBy');

    return new RequestQuoteHistoryGroupModel(
      accountId: AccountId,
      strCreatedDate: CreatedAt,
      strCreatedBy: CreatedBy,
    );
  }

  static void setUserProfile(User user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("AccountId", user.accountId);
    preferences.setString("EmailId", user.emailId);
    preferences.setString("UserName", user.userName);
    preferences.setString("FirstName", user.firstName);
    preferences.setString("MiddleName", user.middleName);
    preferences.setString("LastName", user.lastName);
    preferences.setString("PhoneNo", user.phoneNo);
    preferences.setString("Address1", user.address1);
    preferences.setString("Address2", user.address2);
    preferences.setString("Postcode", user.postcode);
    preferences.setString("City", user.city);
    preferences.commit();
  }

  static void setQuotationInvidualDetails(
      QuotationIndividualModel model) async {
    print(model.toJson());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("businessName", model.businessName);
    preferences.setString("postCode", model.postCode);
    preferences.setString("terms", model.terms);

    preferences.setString("requireByDate", model.requireByDate);
    preferences.setString("preferredByDate", model.preferredByDate);
    preferences.setString("endDate", model.endDate);
    //  preferences.setString("rateType", model.rateType);
    preferences.setString('isforFirstyear', model.isforFirstyear);
    preferences.setString('isforSecondyear', model.isforSecondyear);
    preferences.setString('isforThirdyear', model.isforThirdyear);
    preferences.setString('isforOtheryear', model.isforOtheryear);
    preferences.setString('isforAllyear', model.isForAllYearTerms);

    preferences.setString('singleRate', model.singleRate);
    preferences.setString('isStarkDADC', model.isStarkDADC);
    preferences.setString('intDADCId', model.intDADCId);
    preferences.setString('thirdPartyMOP', model.thirdPartyMOP);
    preferences.setString('thirdPartyDADC', model.thirdPartyDADC);
    preferences.setString('isforFourthyear', model.isforFourthyear);
    preferences.setString('isForFifthyear', model.isForFifthyear);
    // preferences.setString('otherString', model.otherString);

    preferences.commit();
  }

  static void setQuotationInvidualDetailsRq(
      QuotationIndividualModelRq model) async {
    print(model.toJson());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("businessNameRq", model.businessNameRq);
    preferences.setString("postCodeRq", model.postCodeRq);
    preferences.setString("termsRq", model.termsRq);
    preferences.setString("requireByDateRq", model.requireByDateRq);
    preferences.setString("preferredByDateRq", model.preferredByDateRq);
    preferences.setString('isforFirstyearRq', model.isforFirstyearRq);
    preferences.setString('isforSecondyearRq', model.isforSecondyearRq);
    preferences.setString('isforThirdyearRq', model.isforThirdyearRq);
    preferences.setString('isforFourthyearRq', model.isforFourthyearRq);
    preferences.setString('isForFifthyearRq', model.isForFifthyearRq);
    preferences.setString('isforOtheryearRq', model.isforOtheryearRq);
    preferences.setString('singleRateRq', model.singleRateRq);
    preferences.setString('isStarkDADCRq', model.isStarkDADCRq);
    preferences.setString('intDADCIdRq', model.intDADCIdRq);
    preferences.setString('thirdPartyMOPRq', model.thirdPartyMOPRq);
    preferences.setString('thirdPartyDADCRq', model.thirdPartyDADCRq);
    preferences.setString('preferredEndDateRq', model.preferredEndDateRq);

    preferences.commit();
  }

  static Future<QuotationIndividualModel> getQuotationInvidualDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String businessName = preferences.getString("businessName");
    String postCode = preferences.getString("postCode");
    String terms = preferences.getString("terms");
    String requireByDate = preferences.getString('requireByDate');
    String preferredByDate = preferences.getString('preferredByDate');
    String endDate = preferences.getString('endDate');
    String rateType = preferences.getString('rateType');
    String isforFirstyear = preferences.getString('isforFirstyear');
    String isforSecondyear = preferences.getString('isforSecondyear');
    String isforThirdyear = preferences.getString('isforThirdyear');
    String isforFourthyear = preferences.getString('isforFourthyear');
    String isForFifthyear = preferences.getString('isForFifthyear');
    String isforOtheryear = preferences.getString('isforOtheryear');
    String isforAllyear = preferences.getString('isforAllyear');

    String singleRate = preferences.getString('singleRate');
    String isStarkDADC = preferences.getString('isStarkDADC');
    String intDADCId = preferences.getString('intDADCId');
    String thirdPartyMOP = preferences.getString('thirdPartyMOP');
    String thirdPartyDADC = preferences.getString('thirdPartyDADC');

    if (businessName != null) {
      return QuotationIndividualModel(
        businessName: businessName,
        postCode: postCode,
        terms: terms,
        requireByDate: requireByDate,
        preferredByDate: preferredByDate,
        endDate: endDate,
        // rateType: rateType,
        isforFirstyear: isforFirstyear,
        isforSecondyear: isforSecondyear,
        isforThirdyear: isforThirdyear,
        isforFourthyear: isforFourthyear,
        isForFifthyear: isForFifthyear,
        isforOtheryear: isforOtheryear,
        isForAllYearTerms: isforAllyear,
        singleRate: singleRate,
        isStarkDADC: isStarkDADC,
        intDADCId: intDADCId,
        thirdPartyMOP: thirdPartyMOP,
        thirdPartyDADC: thirdPartyDADC,
      );
      // otherString: otherString);
    } else {
      return null;
    }
  }

  static Future<QuotationIndividualModelRq>
      getQuotationInvidualDetailsRq() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String businessNameRq = preferences.getString("businessNameRq");
    String postCodeRq = preferences.getString("postCodeRq");
    String termsRq = preferences.getString("termsRq");
    String requireByDateRq = preferences.getString('requireByDateRq');
    String preferredByDateRq = preferences.getString('preferredByDateRq');
    String isforFirstyearRq = preferences.getString('isforFirstyearRq');
    String isforSecondyearRq = preferences.getString('isforSecondyearRq');
    String isforThirdyearRq = preferences.getString('isforThirdyearRq');
    String isforFourthyearRq = preferences.getString('isforFourthyearRq');
    String isForFifthyearRq = preferences.getString('isForFifthyearRq');
    String isforOtheryearRq = preferences.getString('isforOtheryearRq');
    String singleRateRq = preferences.getString('singleRateRq');
    String isStarkDADCRq = preferences.getString('intDADCIdRq');
    String intDADCIdRq = preferences.getString('intDADCIdRq');
    String thirdPartyMOPRq = preferences.getString('thirdPartyMOPRq');
    String thirdPartyDADCRq = preferences.getString('thirdPartyDADCRq');
    String preferredEndDateRq = preferences.getString('preferredEndDateRq');

    if (postCodeRq != null) {
      return QuotationIndividualModelRq(
        businessNameRq: businessNameRq,
        postCodeRq: postCodeRq,
        termsRq: termsRq,
        requireByDateRq: requireByDateRq,
        preferredByDateRq: preferredByDateRq,
        isforFirstyearRq: isforFirstyearRq,
        isforSecondyearRq: isforSecondyearRq,
        isforThirdyearRq: isforThirdyearRq,
        isforFourthyearRq: isforFourthyearRq,
        isForFifthyearRq: isForFifthyearRq,
        isforOtheryearRq: isforOtheryearRq,
        singleRateRq: singleRateRq,
        isStarkDADCRq: isStarkDADCRq,
        intDADCIdRq: intDADCIdRq,
        thirdPartyMOPRq: thirdPartyMOPRq,
        thirdPartyDADCRq: thirdPartyDADCRq,
        preferredEndDateRq: preferredEndDateRq,
      );
      // otherString: otherString);
    } else {
      return null;
    }
  }

  static void clearIndividualQuotationValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("businessName", null);
  }

  static void clearIndividualQuotationValuesRq() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("postCodeRq", null);
  }

  static void setQuotationGasDetails(QuotationGasModel model) async {
    print(model.toJson());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print(model.toJson());
    preferences.setString("mPrn", model.mPrn);
    preferences.setString("aQ", model.aQ);

    preferences.commit();
  }

  static Future<QuotationGasModel> getQuotationGasDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String mPrn = preferences.getString("mPrn");
    String aQ = preferences.getString("aQ");

    if (mPrn != null) {
      return QuotationGasModel(
        mPrn: mPrn,
        aQ: aQ,
      );
    } else {
      return null;
    }
  }

  static void clearGasQuotationValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("mPrn", null);
  }

  static void setQuotationGasElectricityDetails(
      QuotationPriceElectricityGasModel model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("electricityUplift", model.electricityUplift);
    preferences.setString("electricityScUplift", model.electricityScUplift);
    preferences.setString("gasUplift", model.gasUplift);
    preferences.setString("gasScUplift", model.gasScUplift);
    preferences.setString("eAUplift", model.eAUplift);
    preferences.setString("eAScUplift", model.eAScUplift);
    preferences.setString("gAUplift", model.gAUplift);
    preferences.setString("gAScUplift", model.gAScUplift);
    preferences.setString("selectPartner", model.selectPartner);
    preferences.setString("subUserID", model.subUserID);
    preferences.commit();
  }

  static void setGroupQuotationGasElectricityDetails(
      GroupQuotationPriceElectricityGasModel model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();


    preferences.setString("elecCommonUnit", model.elecCommonUnit);
    preferences.setString("elecCommonSc", model.elecCommonSc);
    preferences.setString("elecAffiliateUnit", model.elecAffiliateUnit);
    preferences.setString("elecAffiliateSc", model.elecAffiliateSc);
    preferences.setString("gasCommonUnit", model.gasCommonUnit);
    preferences.setString("gasCommonSc", model.gasCommonSc);
    preferences.setString("gasAffiliateUnit", model.gasAffiliateUnit);
    preferences.setString("gasAffiliateSc", model.gasAffiliateSc);
    preferences.setString("getGroupVolumeDataModel", model.getGroupVolumeDataModel);

    preferences.commit();
  }

  static Future<QuotationPriceElectricityGasModel>
      getQuotationGasElectricityDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String electricityUplift = preferences.getString("electricityUplift");
    String electricityScUplift = preferences.getString("electricityScUplift");
    String gasUplift = preferences.getString("gasUplift");
    String gasScUplift = preferences.getString("gasScUplift");
    String eAUplift = preferences.getString("eAUplift");
    String eAScUplift = preferences.getString("eAScUplift");
    String gAUplift = preferences.getString("gAUplift");
    String gAScUplift = preferences.getString("gAScUplift");
    String selectPartner = preferences.getString("selectPartner");
    String subUserID = preferences.getString("subUserID");

//    if (selectPartner != null) {
    return QuotationPriceElectricityGasModel(
        electricityUplift: electricityUplift,
        electricityScUplift: electricityScUplift,
        gasUplift: gasUplift,
        gasScUplift: gasScUplift,
        eAUplift: eAUplift,
        eAScUplift: eAScUplift,
        gAUplift: gAUplift,
        gAScUplift: gAScUplift,
        selectPartner: selectPartner,
        subUserID: subUserID);
    // } else {
    //   return null;
    // }
  }
  static Future<GroupQuotationPriceElectricityGasModel>
  getGroupQuotationGasElectricityDetails() async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String elecCommonUnit = preferences.getString("elecCommonUnit");
    String elecCommonSc = preferences.getString("elecCommonSc");
    String elecAffiliateUnit = preferences.getString("elecAffiliateUnit");
    String elecAffiliateSc = preferences.getString("elecAffiliateSc");
    String gasCommonUnit = preferences.getString("gasCommonUnit");
    String gasCommonSc = preferences.getString("gasCommonSc");
    String gasAffiliateUnit = preferences.getString("gasAffiliateUnit");
    String gasAffiliateSc = preferences.getString("gasAffiliateSc");
    String getGroupVolumeDataModel = preferences.getString("getGroupVolumeDataModel");


//    if (selectPartner != null) {
    return GroupQuotationPriceElectricityGasModel(
        elecCommonUnit: elecCommonUnit,
        elecCommonSc: elecCommonSc,
        elecAffiliateUnit: elecAffiliateUnit,
        elecAffiliateSc: elecAffiliateSc,
        gasCommonUnit: gasCommonUnit,
        gasCommonSc: gasCommonSc,
        gasAffiliateUnit: gasAffiliateUnit,
        gasAffiliateSc: gasAffiliateSc,
        getGroupVolumeDataModel: getGroupVolumeDataModel,);
    // } else {
    //   return null;
    // }
  }

  static void setQuotationElectricityDetails(
      QuotationElectricityModel model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print(model.toJson());
    preferences.setString("wholeMpan", model.wholeMpan);
    preferences.setString("mPanCode", model.mPanCode);
    preferences.setString("mPanOne", model.mPanOne);
    preferences.setString("mPanTwo", model.mPanTwo);
    preferences.setString("mPanThree", model.mPanThree);
    preferences.setString("mPanFour", model.mPanFour);
    preferences.setString("mPanFive", model.mPanFive);
    preferences.setString("mPanSix", model.mPanSix);
    preferences.setString("eACDay", model.eACDay);
    preferences.setString("eACNight", model.eACNight);
    preferences.setString("eWE", model.eWE);
    preferences.setString("hhFilePath", model.hhFilePath);
    preferences.commit();
  }

  static Future<QuotationElectricityModel>
      getQuotationElectricityDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String wholeMpan = preferences.getString("wholeMpan");
    String mPanCode = preferences.getString("mPanCode");
    String mPanOne = preferences.getString("mPanOne");
    String mPanTwo = preferences.getString("mPanTwo");
    String mPanThree = preferences.getString('mPanThree');
    String mPanFour = preferences.getString('mPanFour');
    String mPanFive = preferences.getString('mPanFive');
    String mPanSix = preferences.getString('mPanSix');
    String eACDay = preferences.getString('eACDay');
    String eACNight = preferences.getString('eACNight');
    String eWE = preferences.getString('eWE');
    String hhFilePath = preferences.getString('hhFilePath');
    if (mPanCode != null) {
      return QuotationElectricityModel(
          wholeMpan: wholeMpan,
          mPanCode: mPanCode,
          mPanOne: mPanOne,
          mPanTwo: mPanTwo,
          mPanThree: mPanThree,
          mPanFour: mPanFour,
          mPanFive: mPanFive,
          mPanSix: mPanSix,
          eACDay: eACDay,
          eACNight: eACNight,
          eWE: eWE,
          hhFilePath: hhFilePath);
    } else {
      return null;
    }
  }

  static void setQuotationElectricityDetailsRq(
      QuotationElectricityModelRq model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print(model.toJson());
    preferences.setString("wholeMpanRq", model.wholeMpanRq);
    preferences.setString("mPanCodeRq", model.mPanCodeRq);
    preferences.setString("mPanOneRq", model.mPanOneRq);
    preferences.setString("mPanTwoRq", model.mPanTwoRq);
    preferences.setString("mPanThreeRq", model.mPanThreeRq);
    preferences.setString("mPanFourRq", model.mPanFourRq);
    preferences.setString("mPanFiveRq", model.mPanFiveRq);
    preferences.setString("mPanSixRq", model.mPanSixRq);
    preferences.setString("eACDayRq", model.eACDayRq);
    preferences.setString("eACNightRq", model.eACNightRq);
    preferences.setString("eWERq", model.eWERq);
    preferences.setString("hhFilePathRq", model.hhFilePathRq);
    preferences.commit();
  }

  static Future<QuotationElectricityModelRq>
      getQuotationElectricityDetailsRq() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String wholeMpanRq = preferences.getString("wholeMpanRq");
    String mPanCodeRq = preferences.getString("mPanCodeRq");
    String mPanOneRq = preferences.getString("mPanOneRq");
    String mPanTwoRq = preferences.getString("mPanTwoRq");
    String mPanThreeRq = preferences.getString('mPanThreeRq');
    String mPanFourRq = preferences.getString('mPanFourRq');
    String mPanFiveRq = preferences.getString('mPanFiveRq');
    String mPanSixRq = preferences.getString('mPanSixRq');
    String eACDayRq = preferences.getString('eACDayRq');
    String eACNightRq = preferences.getString('eACNightRq');
    String eWERq = preferences.getString('eWERq');
    String hhFilePathRq = preferences.getString('hhFilePathRq');
    if (mPanCodeRq != null) {
      return QuotationElectricityModelRq(
          wholeMpanRq: wholeMpanRq,
          mPanCodeRq: mPanCodeRq,
          mPanOneRq: mPanOneRq,
          mPanTwoRq: mPanTwoRq,
          mPanThreeRq: mPanThreeRq,
          mPanFourRq: mPanFourRq,
          mPanFiveRq: mPanFiveRq,
          mPanSixRq: mPanSixRq,
          eACDayRq: eACDayRq,
          eACNightRq: eACNightRq,
          eWERq: eWERq,
          hhFilePathRq: hhFilePathRq);
    } else {
      return null;
    }
  }

  static void setSaveQuotationGas(SaveButtonCredentials model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    print(model.toJson());

    preferences.setString("requiredUpliftGas1Y", model.requiredUpliftGas1Y);
    preferences.setString("requiredUpliftGasSC1Y", model.requiredUpliftGasSC1Y);
    preferences.setString("affiliateUpliftGas1Y", model.affiliateUpliftGas1Y);
    preferences.setString(
        "affiliateUpliftGasSC1Y", model.affiliateUpliftGasSC1Y);

    preferences.commit();
  }

  static Future<SaveButtonCredentials> getSaveQuotationGas() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String requiredUpliftGas1Y = preferences.getString("requiredUpliftGas1Y");
    String requiredUpliftGasSC1Y =
        preferences.getString("requiredUpliftGasSC1Y");
    String affiliateUpliftGas1Y = preferences.getString("affiliateUpliftGas1Y");
    String affiliateUpliftGasSC1Y =
        preferences.getString("affiliateUpliftGasSC1Y");

    return SaveButtonCredentials(
      requiredUpliftGas1Y: requiredUpliftGas1Y,
      requiredUpliftGasSC1Y: requiredUpliftGasSC1Y,
      affiliateUpliftGas1Y: affiliateUpliftGas1Y,
      affiliateUpliftGasSC1Y: affiliateUpliftGasSC1Y,
    );
  }

  static void clearElectricityQuotationValuesRq() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("mPanCodeRq", null);
  }

  static void clearElectricityQuotationValues() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("mPanCode", null);
  }

  static void logIn(bool logIn) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("logout", logIn);
    preferences.commit();
  }

  static void logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("remember", false);
    preferences.setString("AccountId", null);
    preferences.setString("EmailId", null);
    preferences.setString("UserName", null);
    preferences.setString("FirstName", null);
    preferences.setString("phone", null);
    preferences.setString("username", null);
    preferences.setString("firstname", null);
    preferences.setString("MiddleName", null);
    preferences.setString("LastName", null);
    preferences.setString("PhoneNo", null);
    preferences.setString("Address1", null);
    preferences.setString("Address2", null);
    preferences.setString("Postcode", null);
    preferences.setString("City", null);
    preferences.commit();
  }
}
