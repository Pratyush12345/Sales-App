class GroupAddPartnerAddQuickLeadQuote {
  int quoteid;
  String accountId;
  String command;
  String basketName;
  Null companyName;
  int groupId;
  Null groupname;
  String qouteNotesGroup;
  Null notesGroup;
  int termType;
  int blHHstatus;
  Null priceAlertmsg;
  Null ecoesDataMpanmsg;
  int intCompanyUserId;
  int intCompanyId;
  Null status;
  Null type;
  int hidePriceDiv;
  int internalCreator;
  bool isforFirstyearGroup;
  bool isforSecondyearGroup;
  bool isforThirdyearGroup;
  bool isforFouryearGroup;
  bool isforFiveyearGroup;
  bool isforOtheryearGroup;
  bool isCommonEnddate;
  Null contractEndDateGroup;
  String requestedDateGroup;
  Null quotedDate;
  Null createdDate;
  String requiredByDate;
  Null cRN;
  Null image64GroupFile;
  Null sampleFileAttachmentGroup;
  bool thirdPartyMOP;
  bool thirdPartyDADC;
  bool bteIsStarkDADC;
  bool bIsRestrictRefresh;
  Null strContractpath;
  bool lastMsgRead;
  Null isAbleToAddPrice;
  bool bteContainPriceDetail;
  Null dteRestrictRefreshDate;
  Null strMaxupliftApply;
  bool showSendEsign;
  bool bteContainHHCustomer;
  bool bteContainRefreshbutton;
  Null affiliateSubUserList;
  int intAffiliateSubUserId;
  Null flagFrom;
  bool isItbroker;
  Null allowElectralink;
  Null allowECOES;
  Null allowXSOSERVE;
  Null allowCreditSafe;
  int intDADCId;
  int bteShowRefreshbutton;
  Null electricityDayEAC;
  Null electricityNightEAC;
  Null electricityEveningEAC;
  Null premisesAndPricesContractQuotewithdata;
  Null premisesAndPricesContractQuotewithEmpty;
  Null lstGroupMaster;
  Null lstPriceList;
  Null sitelist;
  Null lstError;

  GroupAddPartnerAddQuickLeadQuote(
      {this.quoteid,
      this.accountId,
      this.command,
      this.basketName,
      this.companyName,
      this.groupId,
      this.groupname,
      this.qouteNotesGroup,
      this.notesGroup,
      this.termType,
      this.blHHstatus,
      this.priceAlertmsg,
      this.ecoesDataMpanmsg,
      this.intCompanyUserId,
      this.intCompanyId,
      this.status,
      this.type,
      this.hidePriceDiv,
      this.internalCreator,
      this.isforFirstyearGroup,
      this.isforSecondyearGroup,
      this.isforThirdyearGroup,
      this.isforFouryearGroup,
      this.isforFiveyearGroup,
      this.isforOtheryearGroup,
      this.isCommonEnddate,
      this.contractEndDateGroup,
      this.requestedDateGroup,
      this.quotedDate,
      this.createdDate,
      this.requiredByDate,
      this.cRN,
      this.image64GroupFile,
      this.sampleFileAttachmentGroup,
      this.thirdPartyMOP,
      this.thirdPartyDADC,
      this.bteIsStarkDADC,
      this.bIsRestrictRefresh,
      this.strContractpath,
      this.lastMsgRead,
      this.isAbleToAddPrice,
      this.bteContainPriceDetail,
      this.dteRestrictRefreshDate,
      this.strMaxupliftApply,
      this.showSendEsign,
      this.bteContainHHCustomer,
      this.bteContainRefreshbutton,
      this.affiliateSubUserList,
      this.intAffiliateSubUserId,
      this.flagFrom,
      this.isItbroker,
      this.allowElectralink,
      this.allowECOES,
      this.allowXSOSERVE,
      this.allowCreditSafe,
      this.intDADCId,
      this.bteShowRefreshbutton,
      this.electricityDayEAC,
      this.electricityNightEAC,
      this.electricityEveningEAC,
      this.premisesAndPricesContractQuotewithdata,
      this.premisesAndPricesContractQuotewithEmpty,
      this.lstGroupMaster,
      this.lstPriceList,
      this.sitelist,
      this.lstError});

  GroupAddPartnerAddQuickLeadQuote.fromJson(Map<String, dynamic> json) {
    quoteid = json['Quoteid'];
    accountId = json['AccountId'];
    command = json['Command'];
    basketName = json['BasketName'];
    companyName = json['CompanyName'];
    groupId = json['GroupId'];
    groupname = json['Groupname'];
    qouteNotesGroup = json['QouteNotesGroup'];
    notesGroup = json['NotesGroup'];
    termType = json['TermType'];
    blHHstatus = json['blHHstatus'];
    priceAlertmsg = json['PriceAlertmsg'];
    ecoesDataMpanmsg = json['EcoesDataMpanmsg'];
    intCompanyUserId = json['IntCompanyUserId'];
    intCompanyId = json['IntCompanyId'];
    status = json['status'];
    type = json['type'];
    hidePriceDiv = json['hidePriceDiv'];
    internalCreator = json['InternalCreator'];
    isforFirstyearGroup = json['IsforFirstyearGroup'];
    isforSecondyearGroup = json['IsforSecondyearGroup'];
    isforThirdyearGroup = json['IsforThirdyearGroup'];
    isforFouryearGroup = json['IsforFouryearGroup'];
    isforFiveyearGroup = json['IsforFiveyearGroup'];
    isforOtheryearGroup = json['IsforOtheryearGroup'];
    isCommonEnddate = json['IsCommonEnddate'];
    contractEndDateGroup = json['ContractEndDateGroup'];
    requestedDateGroup = json['RequestedDateGroup'];
    quotedDate = json['QuotedDate'];
    createdDate = json['CreatedDate'];
    requiredByDate = json['RequiredByDate'];
    cRN = json['CRN'];
    image64GroupFile = json['Image64GroupFile'];
    sampleFileAttachmentGroup = json['SampleFileAttachmentGroup'];
    thirdPartyMOP = json['ThirdPartyMOP'];
    thirdPartyDADC = json['ThirdPartyDADC'];
    bteIsStarkDADC = json['bteIsStarkDADC'];
    bIsRestrictRefresh = json['bIsRestrictRefresh'];
    strContractpath = json['strContractpath'];
    lastMsgRead = json['LastMsgRead'];
    isAbleToAddPrice = json['IsAbleToAddPrice'];
    bteContainPriceDetail = json['bteContainPriceDetail'];
    dteRestrictRefreshDate = json['dteRestrictRefreshDate'];
    strMaxupliftApply = json['strMaxupliftApply'];
    showSendEsign = json['ShowSendEsign'];
    bteContainHHCustomer = json['bteContainHHCustomer'];
    bteContainRefreshbutton = json['bteContainRefreshbutton'];
    affiliateSubUserList = json['AffiliateSubUserList'];
    intAffiliateSubUserId = json['IntAffiliateSubUserId'];
    flagFrom = json['FlagFrom'];
    isItbroker = json['isItbroker'];
    allowElectralink = json['AllowElectralink'];
    allowECOES = json['AllowECOES'];
    allowXSOSERVE = json['AllowXSOSERVE'];
    allowCreditSafe = json['AllowCreditSafe'];
    intDADCId = json['intDADCId'];
    bteShowRefreshbutton = json['bteShowRefreshbutton'];
    electricityDayEAC = json['ElectricityDay_EAC'];
    electricityNightEAC = json['ElectricityNight_EAC'];
    electricityEveningEAC = json['ElectricityEvening_EAC'];
    premisesAndPricesContractQuotewithdata =
        json['PremisesAndPricesContract_Quotewithdata'];
    premisesAndPricesContractQuotewithEmpty =
        json['PremisesAndPricesContract_QuotewithEmpty'];
    lstGroupMaster = json['lstGroupMaster'];
    lstPriceList = json['lstPriceList'];
    sitelist = json['Sitelist'];
    lstError = json['lstError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Quoteid'] = this.quoteid;
    data['AccountId'] = this.accountId;
    data['Command'] = this.command;
    data['BasketName'] = this.basketName;
    data['CompanyName'] = this.companyName;
    data['GroupId'] = this.groupId;
    data['Groupname'] = this.groupname;
    data['QouteNotesGroup'] = this.qouteNotesGroup;
    data['NotesGroup'] = this.notesGroup;
    data['TermType'] = this.termType;
    data['blHHstatus'] = this.blHHstatus;
    data['PriceAlertmsg'] = this.priceAlertmsg;
    data['EcoesDataMpanmsg'] = this.ecoesDataMpanmsg;
    data['IntCompanyUserId'] = this.intCompanyUserId;
    data['IntCompanyId'] = this.intCompanyId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['hidePriceDiv'] = this.hidePriceDiv;
    data['InternalCreator'] = this.internalCreator;
    data['IsforFirstyearGroup'] = this.isforFirstyearGroup;
    data['IsforSecondyearGroup'] = this.isforSecondyearGroup;
    data['IsforThirdyearGroup'] = this.isforThirdyearGroup;
    data['IsforFouryearGroup'] = this.isforFouryearGroup;
    data['IsforFiveyearGroup'] = this.isforFiveyearGroup;
    data['IsforOtheryearGroup'] = this.isforOtheryearGroup;
    data['IsCommonEnddate'] = this.isCommonEnddate;
    data['ContractEndDateGroup'] = this.contractEndDateGroup;
    data['RequestedDateGroup'] = this.requestedDateGroup;
    data['QuotedDate'] = this.quotedDate;
    data['CreatedDate'] = this.createdDate;
    data['RequiredByDate'] = this.requiredByDate;
    data['CRN'] = this.cRN;
    data['Image64GroupFile'] = this.image64GroupFile;
    data['SampleFileAttachmentGroup'] = this.sampleFileAttachmentGroup;
    data['ThirdPartyMOP'] = this.thirdPartyMOP;
    data['ThirdPartyDADC'] = this.thirdPartyDADC;
    data['bteIsStarkDADC'] = this.bteIsStarkDADC;
    data['bIsRestrictRefresh'] = this.bIsRestrictRefresh;
    data['strContractpath'] = this.strContractpath;
    data['LastMsgRead'] = this.lastMsgRead;
    data['IsAbleToAddPrice'] = this.isAbleToAddPrice;
    data['bteContainPriceDetail'] = this.bteContainPriceDetail;
    data['dteRestrictRefreshDate'] = this.dteRestrictRefreshDate;
    data['strMaxupliftApply'] = this.strMaxupliftApply;
    data['ShowSendEsign'] = this.showSendEsign;
    data['bteContainHHCustomer'] = this.bteContainHHCustomer;
    data['bteContainRefreshbutton'] = this.bteContainRefreshbutton;
    data['AffiliateSubUserList'] = this.affiliateSubUserList;
    data['IntAffiliateSubUserId'] = this.intAffiliateSubUserId;
    data['FlagFrom'] = this.flagFrom;
    data['isItbroker'] = this.isItbroker;
    data['AllowElectralink'] = this.allowElectralink;
    data['AllowECOES'] = this.allowECOES;
    data['AllowXSOSERVE'] = this.allowXSOSERVE;
    data['AllowCreditSafe'] = this.allowCreditSafe;
    data['intDADCId'] = this.intDADCId;
    data['bteShowRefreshbutton'] = this.bteShowRefreshbutton;
    data['ElectricityDay_EAC'] = this.electricityDayEAC;
    data['ElectricityNight_EAC'] = this.electricityNightEAC;
    data['ElectricityEvening_EAC'] = this.electricityEveningEAC;
    data['PremisesAndPricesContract_Quotewithdata'] =
        this.premisesAndPricesContractQuotewithdata;
    data['PremisesAndPricesContract_QuotewithEmpty'] =
        this.premisesAndPricesContractQuotewithEmpty;
    data['lstGroupMaster'] = this.lstGroupMaster;
    data['lstPriceList'] = this.lstPriceList;
    data['Sitelist'] = this.sitelist;
    data['lstError'] = this.lstError;
    return data;
  }
}
