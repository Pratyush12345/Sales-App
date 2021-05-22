class QuotationDetailsDataModel {
  String groupId;
  String groupname;
  String basketName;
  bool thirdPartyMOP;
  bool thirdPartyDADC;
  bool bteIsStarkDADC;
  bool isforFirstyearGroup;
  bool isforSecondyearGroup;
  bool isforThirdyearGroup;
  bool isforFouryearGroup;
  bool isforFiveyearGroup;
  bool isforOtheryearGroup;
  bool isCommonEnddate;
  String requiredByDate;
  String contractEndDateGroup;
  String requestedDateGroup;
  String companyName;
  String cRN;

  QuotationDetailsDataModel({
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
  });

  QuotationDetailsDataModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}
