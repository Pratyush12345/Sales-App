import 'package:pozitive/Core/Model/Api/GroupAddPartnerAddQuickLeadCredential.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pozitive/Core/Model/Api/Group-Quotation/GroupAddPartnerAddQuickLeadNewCredential.dart';
import 'package:pozitive/Pages/Group-Quotation-addButton/common_wids_group/site_shared_pref_data_model.dart';

class PrefGroupQuote {
  static Future<GroupAddPartnerAddQuickLeadCrential>
      getQuotationGroupDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String basketName = preferences.getString("groupbasketName");
    String groupname = preferences.getString("groupgroupname");
    String isforFirstyearGroup =
        preferences.getString("groupisforFirstyearGroup");
    String isforSecondyearGroup =
        preferences.getString('groupisforSecondyearGroup');
    String isforThirdyearGroup =
        preferences.getString('groupisforThirdyearGroup');
    String isforFouryearGroup =
        preferences.getString('groupisforFouryearGroup');
    String isforFiveyearGroup =
        preferences.getString('groupisforFiveyearGroup');
    String isforOtheryearGroup =
        preferences.getString('groupisforOtheryearGroup');
    String imageFile = preferences.getString('groupimageFile');
    String blHHstatus = preferences.getString('groupblHHstatus');
    String isCommonEnddate = preferences.getString('groupisCommonEnddate');
    String requiredByDate = preferences.getString('grouprequiredByDate');
    String contractEndDateGroup =
        preferences.getString('groupcontractEndDateGroup');
    // String intDADCId = preferences.getString('groupintDADCId');
    String thirdPartyMOP = preferences.getString('groupthirdPartyMOP');
    String thirdPartyDADC = preferences.getString('groupthirdPartyDADC');
    String bteIsStarkDADC = preferences.getString('groupbteIsStarkDADC');
    String qouteNotesGroup = preferences.getString('groupqouteNotesGroup');
    String filePath = preferences.getString('filePath');

    if (basketName != null) {
      return GroupAddPartnerAddQuickLeadCrential(
        basketName: basketName,
        groupname: groupname,
        isforFirstyearGroup: isforFirstyearGroup,
        isforSecondyearGroup: isforSecondyearGroup,
        isforThirdyearGroup: isforThirdyearGroup,
        isforFouryearGroup: isforFouryearGroup,
        isforFiveyearGroup: isforFiveyearGroup,
        isforOtheryearGroup: isforOtheryearGroup,
        image64GroupFile: imageFile,
        blHHstatus: blHHstatus,
        isCommonEnddate: isCommonEnddate,
        requiredByDate: requiredByDate,
        contractEndDateGroup: contractEndDateGroup,
        thirdPartyMOP: thirdPartyMOP,
        thirdPartyDADC: thirdPartyDADC,
        bteIsStarkDADC: bteIsStarkDADC,
        qouteNotesGroup: qouteNotesGroup,
        filePath: filePath,
      );
    } else {
      return null;
    }
  }

  static Future<GroupAddPartnerAddQuickLeadNewCredential>
      getQuotationGroupDetailsAddQuote() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String gBusinessName = preferences.getString('groupQuoteBusinessName');
    String gGroupName = preferences.getString('groupQuoteGroupName');
    String gCompanyName = preferences.getString('groupQuoteCompanyName');
    String gCompanyRegNo = preferences.getString('groupQuoteCompanyRegNo');
    String gFirstYear = preferences.getString('groupQuoteIsForFirstYear');
    String gSecondYear = preferences.getString('groupQuoteIsForSecondYear');
    String gThirdYear = preferences.getString('groupQuoteIsForThirdYear');
    String gFourthYear = preferences.getString('groupQuoteIsForFourthYear');
    String gFifthYear = preferences.getString('groupQuoteIsForFifthYear');
    String gOtherYear = preferences.getString('groupQuoteIsForOtherYear');
    String gRequiredByDate = preferences.getString('groupQuoteRequiredByDate');
    String gCommonEndDate = preferences.getString('groupQuoteIsCommonEndDate');
    String gContractEndDate =
        preferences.getString('groupQuotePreferredEndDate');
    String gThirdPartyMop = preferences.getString('groupQuoteIsMop');
    String gThirdPartyDADC =
        preferences.getString('groupQuoteIsThirdPartyDADC');
    String gIsStarkDADC = preferences.getString('groupQuoteIsStarkDADC');

    if (gBusinessName != null) {
      return GroupAddPartnerAddQuickLeadNewCredential(
        basketName: gBusinessName,
        groupname: gGroupName,
        companyName: gCompanyName,
        cRN: gCompanyRegNo,
        isforFirstyearGroup: gFirstYear,
        isforSecondyearGroup: gSecondYear,
        isforThirdyearGroup: gThirdYear,
        isforFouryearGroup: gFourthYear,
        isforFiveyearGroup: gFifthYear,
        isforOtheryearGroup: gOtherYear,
        requiredByDate: gRequiredByDate,
        isCommonEnddate: gCommonEndDate,
        contractEndDateGroup: gContractEndDate,
        thirdPartyMOP: gThirdPartyMop,
        thirdPartyDADC: gThirdPartyDADC,
        bteIsStarkDADC: gIsStarkDADC,
      );
    } else {
      return null;
    }
  }

  static Future<void> gRQsetGroupId(String groupId) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('gRQgroupId', groupId);
    preferences.commit();
  }

  static Future<String> gRQgetGroupId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String gQRgrouId = preferences.getString('gRQgroupId');
    if (gQRgrouId != null) {
      return gQRgrouId;
    } else {
      return null;
    }
  }

  static Future<void> gRQclearGroupId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('gRQgroupId', null);
    preferences.commit();
  }

  static Future<void> clearSiteDetails() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('siteBusinessNames', null);
  }

  static Future<void> clearQuotationGroupDetailsAddQuote() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('groupQuoteBusinessName', null);
  }

  static Future<SiteSharedPrefDataModel> getSiteBusinessNames() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> siteBusinessNames =
        preferences.getStringList('siteBusinessNames');
    List<String> siteMpanCore = preferences.getStringList('siteMpanCore');
    List<String> siteMprn = preferences.getStringList('siteMprn');
    List<String> sitePrefStartDate =
        preferences.getStringList('sitePrefStartDate');
    if (siteBusinessNames != null) {
      return SiteSharedPrefDataModel(
        siteBusinessNames: siteBusinessNames,
        siteMpanCore: siteMpanCore,
        siteMprn: siteMprn,
        sitePrefStartDate: sitePrefStartDate,
      );
    } else {
      return null;
    }
  }

  static void setBusinessNameFromSite(SiteSharedPrefDataModel model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList('siteBusinessNames', model.siteBusinessNames);
    preferences.setStringList('siteMpanCore', model.siteMpanCore);
    preferences.setStringList('siteMprn', model.siteMprn);
    preferences.setStringList('sitePrefStartDate', model.sitePrefStartDate);
    preferences.commit();
  }

  static void setQuotationGroupDetailsAddQuote(
      GroupAddPartnerAddQuickLeadNewCredential model) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('groupQuoteBusinessName', model.basketName);
    preferences.setString('groupQuoteGroupName', model.groupname);
    preferences.setString('groupQuoteCompanyName', model.companyName);
    preferences.setString('groupQuoteCompanyRegNo', model.cRN);
    preferences.setString(
        'groupQuoteIsForFirstYear', model.isforFirstyearGroup);
    preferences.setString(
        'groupQuoteIsForSecondYear', model.isforSecondyearGroup);
    preferences.setString(
        'groupQuoteIsForThirdYear', model.isforThirdyearGroup);
    preferences.setString(
        'groupQuoteIsForFourthYear', model.isforFouryearGroup);
    preferences.setString('groupQuoteIsForFifthYear', model.isforFiveyearGroup);
    preferences.setString(
        'groupQuoteIsForOtherYear', model.isforOtheryearGroup);
    preferences.setString('groupQuoteRequiredByDate', model.requiredByDate);
    preferences.setString('groupQuoteIsCommonEndDate', model.isCommonEnddate);
    preferences.setString(
        'groupQuotePreferredEndDate', model.contractEndDateGroup);
    preferences.setString('groupQuoteIsMop', model.thirdPartyMOP);
    preferences.setString('groupQuoteIsThirdPartyDADC', model.thirdPartyDADC);
    preferences.setString('groupQuoteIsStarkDADC', model.bteIsStarkDADC);
    preferences.commit();
  }

  static void setQuotationGroupDetailsRq(
      GroupAddPartnerAddQuickLeadCrential model) async {
    print(model.toJson());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("groupbasketName", model.basketName);
    preferences.setString("groupgroupname", model.groupname);
    preferences.setString(
        "groupisforFirstyearGroup", model.isforFirstyearGroup);
    preferences.setString(
        "groupisforSecondyearGroup", model.isforSecondyearGroup);
    preferences.setString(
        "groupisforThirdyearGroup", model.isforThirdyearGroup);
    preferences.setString('groupisforFouryearGroup', model.isforFouryearGroup);
    preferences.setString('groupisforFiveyearGroup', model.isforFiveyearGroup);
    preferences.setString(
        'groupisforOtheryearGroup', model.isforOtheryearGroup);
    preferences.setString('groupImagefile', model.image64GroupFile);
    preferences.setString('groupblHHstatus', model.blHHstatus);
    preferences.setString('groupisCommonEnddate', model.isCommonEnddate);
    preferences.setString('grouprequiredByDate', model.requiredByDate);
    preferences.setString(
        'groupcontractEndDateGroup', model.contractEndDateGroup);
    // preferences.setString('groupintDADCId', model.intDADCId);
    preferences.setString('groupthirdPartyMOP', model.thirdPartyMOP);
    preferences.setString('groupthirdPartyDADC', model.thirdPartyDADC);
    preferences.setString('groupbteIsStarkDADC', model.bteIsStarkDADC);
    preferences.setString('groupintDADCIdRq', model.qouteNotesGroup);
    preferences.setString('filePath', model.filePath);

    preferences.commit();
  }
}
