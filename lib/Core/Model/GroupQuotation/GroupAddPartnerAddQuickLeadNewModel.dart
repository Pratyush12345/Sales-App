class GroupAddPartnerAddQuickLeadNewModel {
  String status;
  String msg;
  Data data;
  String error;

  GroupAddPartnerAddQuickLeadNewModel(
      {this.status, this.msg, this.data, this.error});

  GroupAddPartnerAddQuickLeadNewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['Error'] = this.error;
    return data;
  }
}

class Data {
  int quoteid;
  String accountId;
  String command;
  String basketName;
  String companyName;
  int groupId;
  String groupname;
  Null qouteNotesGroup;
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
  String contractEndDateGroup;
  String requestedDateGroup;
  Null quotedDate;
  Null createdDate;
  String requiredByDate;
  String cRN;
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
  List<Sitelist> sitelist;
  List<LstFormSiteList> lstFormSiteList;
  Null lstError;

  Data(
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
      this.lstFormSiteList,
      this.lstError});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['Sitelist'] != null) {
      sitelist = new List<Sitelist>();
      json['Sitelist'].forEach((v) {
        sitelist.add(new Sitelist.fromJson(v));
      });
    }
    if (json['lstFormSiteList'] != null) {
      lstFormSiteList = new List<LstFormSiteList>();
      json['lstFormSiteList'].forEach((v) {
        lstFormSiteList.add(new LstFormSiteList.fromJson(v));
      });
    }
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
    if (this.sitelist != null) {
      data['Sitelist'] = this.sitelist.map((v) => v.toJson()).toList();
    }
    if (this.lstFormSiteList != null) {
      data['lstFormSiteList'] =
          this.lstFormSiteList.map((v) => v.toJson()).toList();
    }
    data['lstError'] = this.lstError;
    return data;
  }
}

class Sitelist {
  String businessName;
  String strPostCode;
  String fullMpanNumber;
  String gasMprn;
  String electricityNightEAC;
  String electricityDayEAC;
  String gASEAC;
  String dteContractStartDate;
  String dteContractEndDate;
  Null preferedStartDate;
  Null preferedEndDate;
  Null businessNameErr;
  Null postCodeErr;
  Null mpanErr;
  Null nightEACErr;
  Null dayEACErr;
  String electricityEveningEAC;
  Null eveningEACErr;
  Null mprnErr;
  Null gASEACErr;
  String startDateErr;
  Null endDateErr;
  Null bothMissErr;
  String strMPANStatus;
  Null singleRateErr;
  String strSingleRate;
  Null strSiteAdrr1;
  Null strSiteAdrr2;
  Null strSiteCity;
  Null strSitePostCode;
  bool singleRate;
  Null strBillAdrr1;
  Null strBillAdrr2;
  Null strBillCity;
  Null strBillPostCode;
  Null strParentMPAN;
  bool bisGreenCertificate;
  bool bIsSingleRate;
  Null energyErr;
  Null mPANCore;
  Null eACDay;
  Null eACNight;
  Null eACEWE;
  Null mPRN;
  Null eACGAS;

  Sitelist(
      {this.businessName,
      this.strPostCode,
      this.fullMpanNumber,
      this.gasMprn,
      this.electricityNightEAC,
      this.electricityDayEAC,
      this.gASEAC,
      this.dteContractStartDate,
      this.dteContractEndDate,
      this.preferedStartDate,
      this.preferedEndDate,
      this.businessNameErr,
      this.postCodeErr,
      this.mpanErr,
      this.nightEACErr,
      this.dayEACErr,
      this.electricityEveningEAC,
      this.eveningEACErr,
      this.mprnErr,
      this.gASEACErr,
      this.startDateErr,
      this.endDateErr,
      this.bothMissErr,
      this.strMPANStatus,
      this.singleRateErr,
      this.strSingleRate,
      this.strSiteAdrr1,
      this.strSiteAdrr2,
      this.strSiteCity,
      this.strSitePostCode,
      this.singleRate,
      this.strBillAdrr1,
      this.strBillAdrr2,
      this.strBillCity,
      this.strBillPostCode,
      this.strParentMPAN,
      this.bisGreenCertificate,
      this.bIsSingleRate,
      this.energyErr,
      this.mPANCore,
      this.eACDay,
      this.eACNight,
      this.eACEWE,
      this.mPRN,
      this.eACGAS});

  Sitelist.fromJson(Map<String, dynamic> json) {
    businessName = json['Business_Name'];
    strPostCode = json['strPostCode'];
    fullMpanNumber = json['Full_Mpan_Number'];
    gasMprn = json['Gas_Mprn'];
    electricityNightEAC = json['ElectricityNight_EAC'];
    electricityDayEAC = json['ElectricityDay_EAC'];
    gASEAC = json['GAS_EAC'];
    dteContractStartDate = json['dteContractStartDate'];
    dteContractEndDate = json['dteContractEndDate'];
    preferedStartDate = json['PreferedStartDate'];
    preferedEndDate = json['PreferedEndDate'];
    businessNameErr = json['Business_NameErr'];
    postCodeErr = json['PostCodeErr'];
    mpanErr = json['MpanErr'];
    nightEACErr = json['Night_EACErr'];
    dayEACErr = json['Day_EACErr'];
    electricityEveningEAC = json['ElectricityEvening_EAC'];
    eveningEACErr = json['Evening_EACErr'];
    mprnErr = json['MprnErr'];
    gASEACErr = json['GAS_EACErr'];
    startDateErr = json['StartDateErr'];
    endDateErr = json['EndDateErr'];
    bothMissErr = json['BothMissErr'];
    strMPANStatus = json['strMPANStatus'];
    singleRateErr = json['SingleRateErr'];
    strSingleRate = json['strSingleRate'];
    strSiteAdrr1 = json['strSiteAdrr1'];
    strSiteAdrr2 = json['strSiteAdrr2'];
    strSiteCity = json['strSiteCity'];
    strSitePostCode = json['strSitePostCode'];
    singleRate = json['SingleRate'];
    strBillAdrr1 = json['strBillAdrr1'];
    strBillAdrr2 = json['strBillAdrr2'];
    strBillCity = json['strBillCity'];
    strBillPostCode = json['strBillPostCode'];
    strParentMPAN = json['strParentMPAN'];
    bisGreenCertificate = json['bisGreenCertificate'];
    bIsSingleRate = json['bIsSingleRate'];
    energyErr = json['EnergyErr'];
    mPANCore = json['MPANCore'];
    eACDay = json['EAC_Day'];
    eACNight = json['EAC_Night'];
    eACEWE = json['EAC_EWE'];
    mPRN = json['MPRN'];
    eACGAS = json['EAC_GAS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Business_Name'] = this.businessName;
    data['strPostCode'] = this.strPostCode;
    data['Full_Mpan_Number'] = this.fullMpanNumber;
    data['Gas_Mprn'] = this.gasMprn;
    data['ElectricityNight_EAC'] = this.electricityNightEAC;
    data['ElectricityDay_EAC'] = this.electricityDayEAC;
    data['GAS_EAC'] = this.gASEAC;
    data['dteContractStartDate'] = this.dteContractStartDate;
    data['dteContractEndDate'] = this.dteContractEndDate;
    data['PreferedStartDate'] = this.preferedStartDate;
    data['PreferedEndDate'] = this.preferedEndDate;
    data['Business_NameErr'] = this.businessNameErr;
    data['PostCodeErr'] = this.postCodeErr;
    data['MpanErr'] = this.mpanErr;
    data['Night_EACErr'] = this.nightEACErr;
    data['Day_EACErr'] = this.dayEACErr;
    data['ElectricityEvening_EAC'] = this.electricityEveningEAC;
    data['Evening_EACErr'] = this.eveningEACErr;
    data['MprnErr'] = this.mprnErr;
    data['GAS_EACErr'] = this.gASEACErr;
    data['StartDateErr'] = this.startDateErr;
    data['EndDateErr'] = this.endDateErr;
    data['BothMissErr'] = this.bothMissErr;
    data['strMPANStatus'] = this.strMPANStatus;
    data['SingleRateErr'] = this.singleRateErr;
    data['strSingleRate'] = this.strSingleRate;
    data['strSiteAdrr1'] = this.strSiteAdrr1;
    data['strSiteAdrr2'] = this.strSiteAdrr2;
    data['strSiteCity'] = this.strSiteCity;
    data['strSitePostCode'] = this.strSitePostCode;
    data['SingleRate'] = this.singleRate;
    data['strBillAdrr1'] = this.strBillAdrr1;
    data['strBillAdrr2'] = this.strBillAdrr2;
    data['strBillCity'] = this.strBillCity;
    data['strBillPostCode'] = this.strBillPostCode;
    data['strParentMPAN'] = this.strParentMPAN;
    data['bisGreenCertificate'] = this.bisGreenCertificate;
    data['bIsSingleRate'] = this.bIsSingleRate;
    data['EnergyErr'] = this.energyErr;
    data['MPANCore'] = this.mPANCore;
    data['EAC_Day'] = this.eACDay;
    data['EAC_Night'] = this.eACNight;
    data['EAC_EWE'] = this.eACEWE;
    data['MPRN'] = this.mPRN;
    data['EAC_GAS'] = this.eACGAS;
    return data;
  }
}

class LstFormSiteList {
  String businessName;
  Null strPostCode;
  Null fullMpanNumber;
  Null gasMprn;
  Null electricityNightEAC;
  Null electricityDayEAC;
  Null gASEAC;
  Null dteContractStartDate;
  Null dteContractEndDate;
  String preferedStartDate;
  Null preferedEndDate;
  Null businessNameErr;
  Null postCodeErr;
  Null mpanErr;
  Null nightEACErr;
  Null dayEACErr;
  Null electricityEveningEAC;
  Null eveningEACErr;
  Null mprnErr;
  Null gASEACErr;
  Null startDateErr;
  Null endDateErr;
  Null bothMissErr;
  Null strMPANStatus;
  Null singleRateErr;
  Null strSingleRate;
  Null strSiteAdrr1;
  Null strSiteAdrr2;
  Null strSiteCity;
  Null strSitePostCode;
  bool singleRate;
  Null strBillAdrr1;
  Null strBillAdrr2;
  Null strBillCity;
  Null strBillPostCode;
  Null strParentMPAN;
  bool bisGreenCertificate;
  bool bIsSingleRate;
  Null energyErr;
  String mPANCore;
  Null eACDay;
  Null eACNight;
  Null eACEWE;
  String mPRN;
  Null eACGAS;

  LstFormSiteList(
      {this.businessName,
      this.strPostCode,
      this.fullMpanNumber,
      this.gasMprn,
      this.electricityNightEAC,
      this.electricityDayEAC,
      this.gASEAC,
      this.dteContractStartDate,
      this.dteContractEndDate,
      this.preferedStartDate,
      this.preferedEndDate,
      this.businessNameErr,
      this.postCodeErr,
      this.mpanErr,
      this.nightEACErr,
      this.dayEACErr,
      this.electricityEveningEAC,
      this.eveningEACErr,
      this.mprnErr,
      this.gASEACErr,
      this.startDateErr,
      this.endDateErr,
      this.bothMissErr,
      this.strMPANStatus,
      this.singleRateErr,
      this.strSingleRate,
      this.strSiteAdrr1,
      this.strSiteAdrr2,
      this.strSiteCity,
      this.strSitePostCode,
      this.singleRate,
      this.strBillAdrr1,
      this.strBillAdrr2,
      this.strBillCity,
      this.strBillPostCode,
      this.strParentMPAN,
      this.bisGreenCertificate,
      this.bIsSingleRate,
      this.energyErr,
      this.mPANCore,
      this.eACDay,
      this.eACNight,
      this.eACEWE,
      this.mPRN,
      this.eACGAS});

  LstFormSiteList.fromJson(Map<String, dynamic> json) {
    businessName = json['Business_Name'];
    strPostCode = json['strPostCode'];
    fullMpanNumber = json['Full_Mpan_Number'];
    gasMprn = json['Gas_Mprn'];
    electricityNightEAC = json['ElectricityNight_EAC'];
    electricityDayEAC = json['ElectricityDay_EAC'];
    gASEAC = json['GAS_EAC'];
    dteContractStartDate = json['dteContractStartDate'];
    dteContractEndDate = json['dteContractEndDate'];
    preferedStartDate = json['PreferedStartDate'];
    preferedEndDate = json['PreferedEndDate'];
    businessNameErr = json['Business_NameErr'];
    postCodeErr = json['PostCodeErr'];
    mpanErr = json['MpanErr'];
    nightEACErr = json['Night_EACErr'];
    dayEACErr = json['Day_EACErr'];
    electricityEveningEAC = json['ElectricityEvening_EAC'];
    eveningEACErr = json['Evening_EACErr'];
    mprnErr = json['MprnErr'];
    gASEACErr = json['GAS_EACErr'];
    startDateErr = json['StartDateErr'];
    endDateErr = json['EndDateErr'];
    bothMissErr = json['BothMissErr'];
    strMPANStatus = json['strMPANStatus'];
    singleRateErr = json['SingleRateErr'];
    strSingleRate = json['strSingleRate'];
    strSiteAdrr1 = json['strSiteAdrr1'];
    strSiteAdrr2 = json['strSiteAdrr2'];
    strSiteCity = json['strSiteCity'];
    strSitePostCode = json['strSitePostCode'];
    singleRate = json['SingleRate'];
    strBillAdrr1 = json['strBillAdrr1'];
    strBillAdrr2 = json['strBillAdrr2'];
    strBillCity = json['strBillCity'];
    strBillPostCode = json['strBillPostCode'];
    strParentMPAN = json['strParentMPAN'];
    bisGreenCertificate = json['bisGreenCertificate'];
    bIsSingleRate = json['bIsSingleRate'];
    energyErr = json['EnergyErr'];
    mPANCore = json['MPANCore'];
    eACDay = json['EAC_Day'];
    eACNight = json['EAC_Night'];
    eACEWE = json['EAC_EWE'];
    mPRN = json['MPRN'];
    eACGAS = json['EAC_GAS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Business_Name'] = this.businessName;
    data['strPostCode'] = this.strPostCode;
    data['Full_Mpan_Number'] = this.fullMpanNumber;
    data['Gas_Mprn'] = this.gasMprn;
    data['ElectricityNight_EAC'] = this.electricityNightEAC;
    data['ElectricityDay_EAC'] = this.electricityDayEAC;
    data['GAS_EAC'] = this.gASEAC;
    data['dteContractStartDate'] = this.dteContractStartDate;
    data['dteContractEndDate'] = this.dteContractEndDate;
    data['PreferedStartDate'] = this.preferedStartDate;
    data['PreferedEndDate'] = this.preferedEndDate;
    data['Business_NameErr'] = this.businessNameErr;
    data['PostCodeErr'] = this.postCodeErr;
    data['MpanErr'] = this.mpanErr;
    data['Night_EACErr'] = this.nightEACErr;
    data['Day_EACErr'] = this.dayEACErr;
    data['ElectricityEvening_EAC'] = this.electricityEveningEAC;
    data['Evening_EACErr'] = this.eveningEACErr;
    data['MprnErr'] = this.mprnErr;
    data['GAS_EACErr'] = this.gASEACErr;
    data['StartDateErr'] = this.startDateErr;
    data['EndDateErr'] = this.endDateErr;
    data['BothMissErr'] = this.bothMissErr;
    data['strMPANStatus'] = this.strMPANStatus;
    data['SingleRateErr'] = this.singleRateErr;
    data['strSingleRate'] = this.strSingleRate;
    data['strSiteAdrr1'] = this.strSiteAdrr1;
    data['strSiteAdrr2'] = this.strSiteAdrr2;
    data['strSiteCity'] = this.strSiteCity;
    data['strSitePostCode'] = this.strSitePostCode;
    data['SingleRate'] = this.singleRate;
    data['strBillAdrr1'] = this.strBillAdrr1;
    data['strBillAdrr2'] = this.strBillAdrr2;
    data['strBillCity'] = this.strBillCity;
    data['strBillPostCode'] = this.strBillPostCode;
    data['strParentMPAN'] = this.strParentMPAN;
    data['bisGreenCertificate'] = this.bisGreenCertificate;
    data['bIsSingleRate'] = this.bIsSingleRate;
    data['EnergyErr'] = this.energyErr;
    data['MPANCore'] = this.mPANCore;
    data['EAC_Day'] = this.eACDay;
    data['EAC_Night'] = this.eACNight;
    data['EAC_EWE'] = this.eACEWE;
    data['MPRN'] = this.mPRN;
    data['EAC_GAS'] = this.eACGAS;
    return data;
  }
}
