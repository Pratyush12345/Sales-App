class GroupAskForQuoteFinalCredentials {
  String accountId;
  String command;
  String intCompanyUserId;
  String intCompanyId;
  String groupId;
  String groupname;
  String basketName;
  String thirdPartyMOP;
  String thirdPartyDADC;
  String bteIsStarkDADC;
  String isforFirstyearGroup;
  String isforSecondyearGroup;
  String isforThirdyearGroup;
  String isforFouryearGroup;
  String isforFiveyearGroup;
  String isforOtheryearGroup;
  String isCommonEnddate;
  String requiredByDate;
  String contractEndDateGroup;
  String requestedDateGroup;
  String companyName;
  String cRN;
  List<ListFormSiteListFinal> lstFormSiteListFinal;

  GroupAskForQuoteFinalCredentials({
    this.accountId,
    this.command,
    this.intCompanyUserId,
    this.intCompanyId,
    this.groupId,
    this.groupname,
    this.basketName,
    this.thirdPartyMOP,
    this.thirdPartyDADC,
    this.bteIsStarkDADC,
    this.isforFirstyearGroup,
    this.isforSecondyearGroup,
    this.isforThirdyearGroup,
    this.isforFouryearGroup,
    this.isforFiveyearGroup,
    this.isforOtheryearGroup,
    this.isCommonEnddate,
    this.requiredByDate,
    this.contractEndDateGroup,
    this.requestedDateGroup,
    this.companyName,
    this.cRN,
    this.lstFormSiteListFinal,
  });

  GroupAskForQuoteFinalCredentials.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    command = json['Command'];
    intCompanyUserId = json['IntCompanyUserId'];
    intCompanyId = json['IntCompanyId'];
    groupId = json['GroupId'];
    groupname = json['Groupname'];
    basketName = json['BasketName'];
    thirdPartyMOP = json['ThirdPartyMOP'];
    thirdPartyDADC = json['ThirdPartyDADC'];
    bteIsStarkDADC = json['bteIsStarkDADC'];
    isforFirstyearGroup = json['IsforFirstyearGroup'];
    isforSecondyearGroup = json['IsforSecondyearGroup'];
    isforThirdyearGroup = json['IsforThirdyearGroup'];
    isforFouryearGroup = json['IsforFouryearGroup'];
    isforFiveyearGroup = json['IsforFiveyearGroup'];
    isforOtheryearGroup = json['IsforOtheryearGroup'];
    isCommonEnddate = json['IsCommonEnddate'];
    requiredByDate = json['RequiredByDate'];
    contractEndDateGroup = json['ContractEndDateGroup'];
    requestedDateGroup = json['RequestedDateGroup'];
    companyName = json['CompanyName'];
    cRN = json['CRN'];
    if (json['lstFormSiteList'] != null) {
      lstFormSiteListFinal = new List<ListFormSiteListFinal>();
      json['lstFormSiteList'].forEach((v) {
        lstFormSiteListFinal.add(new ListFormSiteListFinal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Command'] = this.command;
    data['IntCompanyUserId'] = this.intCompanyUserId;
    data['IntCompanyId'] = this.intCompanyId;
    data['GroupId'] = this.groupId;
    data['Groupname'] = this.groupname;
    data['BasketName'] = this.basketName;
    data['ThirdPartyMOP'] = this.thirdPartyMOP;
    data['ThirdPartyDADC'] = this.thirdPartyDADC;
    data['bteIsStarkDADC'] = this.bteIsStarkDADC;
    data['IsforFirstyearGroup'] = this.isforFirstyearGroup;
    data['IsforSecondyearGroup'] = this.isforSecondyearGroup;
    data['IsforThirdyearGroup'] = this.isforThirdyearGroup;
    data['IsforFouryearGroup'] = this.isforFouryearGroup;
    data['IsforFiveyearGroup'] = this.isforFiveyearGroup;
    data['IsforOtheryearGroup'] = this.isforOtheryearGroup;
    data['IsCommonEnddate'] = this.isCommonEnddate;
    data['RequiredByDate'] = this.requiredByDate;
    data['ContractEndDateGroup'] = this.contractEndDateGroup;
    data['RequestedDateGroup'] = this.requestedDateGroup;
    data['CompanyName'] = this.companyName;
    data['CRN'] = this.cRN;
    if (this.lstFormSiteListFinal != null) {
      data['lstFormSiteList'] =
          this.lstFormSiteListFinal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListFormSiteListFinal {
  String businessName;
  String mPANCore;
  String mPRN;
  String preferedStartDate;

  ListFormSiteListFinal(
      {this.businessName, this.mPANCore, this.mPRN, this.preferedStartDate});

  ListFormSiteListFinal.fromJson(Map<String, dynamic> json) {
    businessName = json['Business_Name'];
    mPANCore = json['Full_Mpan_Number'];
    mPRN = json['Gas_Mprn'];
    preferedStartDate = json['dteContractStartDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Business_Name'] = this.businessName;
    data['Full_Mpan_Number'] = this.mPANCore;
    data['Gas_Mprn'] = this.mPRN;
    data['dteContractStartDate'] = this.preferedStartDate;
    return data;
  }
}
