class GroupDetailsTabModel {
  String status;
  String msg;
  Data data;
  String error;

  GroupDetailsTabModel({this.status, this.msg, this.data, this.error});

  GroupDetailsTabModel.fromJson(Map<String, dynamic> json) {
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
  String qouteNotesGroup;
  String notesGroup;
  int termType;
  int blHHstatus;
  String priceAlertmsg;
  String ecoesDataMpanmsg;
  int intCompanyUserId;
  int intCompanyId;
  String status;
  String type;
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
  String quotedDate;
  String createdDate;
  String requiredByDate;
  String cRN;
  String image64GroupFile;
  String sampleFileAttachmentGroup;
  bool thirdPartyMOP;
  bool thirdPartyDADC;
  bool bteIsStarkDADC;
  bool bIsRestrictRefresh;
  String strContractpath;
  bool lastMsgRead;
  String isAbleToAddPrice;
  bool bteContainPriceDetail;
  String dteRestrictRefreshDate;
  String strMaxupliftApply;
  bool showSendEsign;
  bool bteContainHHCustomer;
  bool bteContainRefreshbutton;
  List<AffiliateSubUserList> affiliateSubUserList;
  int intAffiliateSubUserId;
  String flagFrom;
  bool isItbroker;
  String allowElectralink;
  String allowECOES;
  String allowXSOSERVE;
  String allowCreditSafe;
  int intDADCId;
  int bteShowRefreshbutton;
  String electricityDayEAC;
  String electricityNightEAC;
  String electricityEveningEAC;
  String premisesAndPricesContractQuotewithdata;
  String premisesAndPricesContractQuotewithEmpty;
  List<LstGroupMaster> lstGroupMaster;
  List<dynamic> lstPriceList;
  List<dynamic> sitelist;
  List<dynamic> lstFormSiteList;
  String lstError;

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
    if (json['AffiliateSubUserList'] != null) {
      affiliateSubUserList = new List<AffiliateSubUserList>();
      json['AffiliateSubUserList'].forEach((v) {
        affiliateSubUserList.add(new AffiliateSubUserList.fromJson(v));
      });
    }
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
    if (json['lstGroupMaster'] != null) {
      lstGroupMaster = new List<LstGroupMaster>();
      json['lstGroupMaster'].forEach((v) {
        lstGroupMaster.add(new LstGroupMaster.fromJson(v));
      });
    }
    lstPriceList = json['lstPriceList'];
    sitelist = json['Sitelist'];
    lstFormSiteList = json['lstFormSiteList'];
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
    if (this.affiliateSubUserList != null) {
      data['AffiliateSubUserList'] =
          this.affiliateSubUserList.map((v) => v.toJson()).toList();
    }
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
    if (this.lstGroupMaster != null) {
      data['lstGroupMaster'] =
          this.lstGroupMaster.map((v) => v.toJson()).toList();
    }
    data['lstPriceList'] = this.lstPriceList;
    data['Sitelist'] = this.sitelist;
    data['lstFormSiteList'] = this.lstFormSiteList;
    data['lstError'] = this.lstError;
    return data;
  }
}

class AffiliateSubUserList {
  bool selected;
  String text;
  String value;

  AffiliateSubUserList({this.selected, this.text, this.value});

  AffiliateSubUserList.fromJson(Map<String, dynamic> json) {
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Selected'] = this.selected;
    data['Text'] = this.text;
    data['Value'] = this.value;
    return data;
  }
}

class LstGroupMaster {
  int intId;
  String businessName;
  String strEmailId;
  String phoneNo;
  String strPostCode;
  String fullMpanNumber;
  String electricityDayEAC;
  String electricityEveningEAC;
  String electricityNightEAC;
  String gASEAC;
  String dteContractStartDate;
  String dteContractEndDate;
  bool isHHCustomer;
  String gasMprn;
  String decIndustryEACAQ;
  String strCurrentSupplierName;
  String strCurrentSupplierStartDate;
  String strSiteAddress;
  String strMeterType;
  String strRelatedMeter;

  LstGroupMaster(
      {this.intId,
      this.businessName,
      this.strEmailId,
      this.phoneNo,
      this.strPostCode,
      this.fullMpanNumber,
      this.electricityDayEAC,
      this.electricityEveningEAC,
      this.electricityNightEAC,
      this.gASEAC,
      this.dteContractStartDate,
      this.dteContractEndDate,
      this.isHHCustomer,
      this.gasMprn,
      this.decIndustryEACAQ,
      this.strCurrentSupplierName,
      this.strCurrentSupplierStartDate,
      this.strSiteAddress,
      this.strMeterType,
      this.strRelatedMeter});

  LstGroupMaster.fromJson(Map<String, dynamic> json) {
    intId = json['intId'];
    businessName = json['Business_Name'];
    strEmailId = json['strEmailId'];
    phoneNo = json['PhoneNo'];
    strPostCode = json['strPostCode'];
    fullMpanNumber = json['Full_Mpan_Number'];
    electricityDayEAC = json['ElectricityDay_EAC'];
    electricityEveningEAC = json['ElectricityEvening_EAC'];
    electricityNightEAC = json['ElectricityNight_EAC'];
    gASEAC = json['GAS_EAC'];
    dteContractStartDate = json['dteContractStartDate'];
    dteContractEndDate = json['dteContractEndDate'];
    isHHCustomer = json['isHHCustomer'];
    gasMprn = json['Gas_Mprn'];
    decIndustryEACAQ = json['decIndustryEACAQ'];
    strCurrentSupplierName = json['strCurrentSupplierName'];
    strCurrentSupplierStartDate = json['strCurrentSupplierStartDate'];
    strSiteAddress = json['strSiteAddress'];
    strMeterType = json['strMeterType'];
    strRelatedMeter = json['strRelatedMeter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intId'] = this.intId;
    data['Business_Name'] = this.businessName;
    data['strEmailId'] = this.strEmailId;
    data['PhoneNo'] = this.phoneNo;
    data['strPostCode'] = this.strPostCode;
    data['Full_Mpan_Number'] = this.fullMpanNumber;
    data['ElectricityDay_EAC'] = this.electricityDayEAC;
    data['ElectricityEvening_EAC'] = this.electricityEveningEAC;
    data['ElectricityNight_EAC'] = this.electricityNightEAC;
    data['GAS_EAC'] = this.gASEAC;
    data['dteContractStartDate'] = this.dteContractStartDate;
    data['dteContractEndDate'] = this.dteContractEndDate;
    data['isHHCustomer'] = this.isHHCustomer;
    data['Gas_Mprn'] = this.gasMprn;
    data['decIndustryEACAQ'] = this.decIndustryEACAQ;
    data['strCurrentSupplierName'] = this.strCurrentSupplierName;
    data['strCurrentSupplierStartDate'] = this.strCurrentSupplierStartDate;
    data['strSiteAddress'] = this.strSiteAddress;
    data['strMeterType'] = this.strMeterType;
    data['strRelatedMeter'] = this.strRelatedMeter;
    return data;
  }
}
