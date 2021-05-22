class GetPartnerQuoteGroupPriceModel {
  String status;
  String msg;
  Data data;
  String error;

  GetPartnerQuoteGroupPriceModel(
      {this.status, this.msg, this.data, this.error});

  GetPartnerQuoteGroupPriceModel.fromJson(Map<String, dynamic> json) {
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
  List<dynamic> lstGroupMaster;
  List<LstPriceList> lstPriceList;
  String sitelist;
  String lstFormSiteList;
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
    lstGroupMaster = json['lstGroupMaster'];
    if (json['lstPriceList'] != null) {
      lstPriceList = new List<LstPriceList>();
      json['lstPriceList'].forEach((v) {
        lstPriceList.add(new LstPriceList.fromJson(v));
      });
    }
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
    data['lstGroupMaster'] = this.lstGroupMaster;
    if (this.lstPriceList != null) {
      data['lstPriceList'] = this.lstPriceList.map((v) => v.toJson()).toList();
    }
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

class LstPriceList {
  int rNO;
  int intSubUserId;
  String quteId;
  String strMPAN;
  String strMPRN;
  bool bteIsHHCustomer;
  String decChargeDay;
  String decChargeEWE;
  String decChargeNight;
  String decUnitPriceGas;
  String decSCPrice;
  String decChargeDayF;
  String decChargeEWEF;
  String decChargeNightF;
  String decSCPriceF;
  String decCCPriceF;
  String decUnitPriceGasF;
  String decSCPriceGas;
  String decSCPriceGasF;
  String intTermType;
  String acceptedTerm;
  bool isAccepted;
  String decupliftEle;
  String decupliftEleEWE;
  String decupliftEleNight;
  String decUpliftEleSC;
  String decupliftEleSub;
  String decupliftEleEWESub;
  String decupliftEleNightSub;
  String decUpliftEleSCSub;
  String decupliftGas;
  String decUpliftGasSC;
  String decupliftGasSub;
  String decUpliftGasSCSub;
  String strMaxUpliftEle;
  String strMaxUpliftGas;
  int bteShowRefreshbutton;
  int bteShowOptions;
  bool bteCreatedFromGroup;
  List<LstPriceValues> lstPriceValues;
  bool bIsSoldByme;
  bool bIsSoldByOther;
  String strContractpath;
  String strContractStartDate;
  String strContractEndDate;

  LstPriceList(
      {this.rNO,
      this.intSubUserId,
      this.quteId,
      this.strMPAN,
      this.strMPRN,
      this.bteIsHHCustomer,
      this.decChargeDay,
      this.decChargeEWE,
      this.decChargeNight,
      this.decUnitPriceGas,
      this.decSCPrice,
      this.decChargeDayF,
      this.decChargeEWEF,
      this.decChargeNightF,
      this.decSCPriceF,
      this.decCCPriceF,
      this.decUnitPriceGasF,
      this.decSCPriceGas,
      this.decSCPriceGasF,
      this.intTermType,
      this.acceptedTerm,
      this.isAccepted,
      this.decupliftEle,
      this.decupliftEleEWE,
      this.decupliftEleNight,
      this.decUpliftEleSC,
      this.decupliftEleSub,
      this.decupliftEleEWESub,
      this.decupliftEleNightSub,
      this.decUpliftEleSCSub,
      this.decupliftGas,
      this.decUpliftGasSC,
      this.decupliftGasSub,
      this.decUpliftGasSCSub,
      this.strMaxUpliftEle,
      this.strMaxUpliftGas,
      this.bteShowRefreshbutton,
      this.bteShowOptions,
      this.bteCreatedFromGroup,
      this.lstPriceValues,
      this.bIsSoldByme,
      this.bIsSoldByOther,
      this.strContractpath,
      this.strContractStartDate,
      this.strContractEndDate});

  LstPriceList.fromJson(Map<String, dynamic> json) {
    rNO = json['RNO'];
    intSubUserId = json['IntSubUserId'];
    quteId = json['QuteId'];
    strMPAN = json['strMPAN'];
    strMPRN = json['strMPRN'];
    bteIsHHCustomer = json['bteIsHHCustomer'];
    decChargeDay = json['decChargeDay'];
    decChargeEWE = json['decChargeEWE'];
    decChargeNight = json['decChargeNight'];
    decUnitPriceGas = json['decUnitPriceGas'];
    decSCPrice = json['decSCPrice'];
    decChargeDayF = json['decChargeDayF'];
    decChargeEWEF = json['decChargeEWEF'];
    decChargeNightF = json['decChargeNightF'];
    decSCPriceF = json['decSCPriceF'];
    decCCPriceF = json['decCCPriceF'];
    decUnitPriceGasF = json['decUnitPriceGasF'];
    decSCPriceGas = json['decSCPriceGas'];
    decSCPriceGasF = json['decSCPriceGasF'];
    intTermType = json['intTermType'];
    acceptedTerm = json['AcceptedTerm'];
    isAccepted = json['IsAccepted'];
    decupliftEle = json['decupliftEle'];
    decupliftEleEWE = json['decupliftEleEWE'];
    decupliftEleNight = json['decupliftEleNight'];
    decUpliftEleSC = json['decUpliftEleSC'];
    decupliftEleSub = json['decupliftEle_Sub'];
    decupliftEleEWESub = json['decupliftEleEWE_Sub'];
    decupliftEleNightSub = json['decupliftEleNight_Sub'];
    decUpliftEleSCSub = json['decUpliftEleSC_Sub'];
    decupliftGas = json['decupliftGas'];
    decUpliftGasSC = json['decUpliftGasSC'];
    decupliftGasSub = json['decupliftGas_Sub'];
    decUpliftGasSCSub = json['decUpliftGasSC_Sub'];
    strMaxUpliftEle = json['strMaxUpliftEle'];
    strMaxUpliftGas = json['strMaxUpliftGas'];
    bteShowRefreshbutton = json['bteShowRefreshbutton'];
    bteShowOptions = json['bteShowOptions'];
    bteCreatedFromGroup = json['bteCreatedFromGroup'];
    if (json['lstPriceValues'] != null) {
      lstPriceValues = new List<LstPriceValues>();
      json['lstPriceValues'].forEach((v) {
        lstPriceValues.add(new LstPriceValues.fromJson(v));
      });
    }
    bIsSoldByme = json['bIsSoldByme'];
    bIsSoldByOther = json['bIsSoldByOther'];
    strContractpath = json['strContractpath'];
    strContractStartDate = json['strContractStartDate'];
    strContractEndDate = json['strContractEndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RNO'] = this.rNO;
    data['IntSubUserId'] = this.intSubUserId;
    data['QuteId'] = this.quteId;
    data['strMPAN'] = this.strMPAN;
    data['strMPRN'] = this.strMPRN;
    data['bteIsHHCustomer'] = this.bteIsHHCustomer;
    data['decChargeDay'] = this.decChargeDay;
    data['decChargeEWE'] = this.decChargeEWE;
    data['decChargeNight'] = this.decChargeNight;
    data['decUnitPriceGas'] = this.decUnitPriceGas;
    data['decSCPrice'] = this.decSCPrice;
    data['decChargeDayF'] = this.decChargeDayF;
    data['decChargeEWEF'] = this.decChargeEWEF;
    data['decChargeNightF'] = this.decChargeNightF;
    data['decSCPriceF'] = this.decSCPriceF;
    data['decCCPriceF'] = this.decCCPriceF;
    data['decUnitPriceGasF'] = this.decUnitPriceGasF;
    data['decSCPriceGas'] = this.decSCPriceGas;
    data['decSCPriceGasF'] = this.decSCPriceGasF;
    data['intTermType'] = this.intTermType;
    data['AcceptedTerm'] = this.acceptedTerm;
    data['IsAccepted'] = this.isAccepted;
    data['decupliftEle'] = this.decupliftEle;
    data['decupliftEleEWE'] = this.decupliftEleEWE;
    data['decupliftEleNight'] = this.decupliftEleNight;
    data['decUpliftEleSC'] = this.decUpliftEleSC;
    data['decupliftEle_Sub'] = this.decupliftEleSub;
    data['decupliftEleEWE_Sub'] = this.decupliftEleEWESub;
    data['decupliftEleNight_Sub'] = this.decupliftEleNightSub;
    data['decUpliftEleSC_Sub'] = this.decUpliftEleSCSub;
    data['decupliftGas'] = this.decupliftGas;
    data['decUpliftGasSC'] = this.decUpliftGasSC;
    data['decupliftGas_Sub'] = this.decupliftGasSub;
    data['decUpliftGasSC_Sub'] = this.decUpliftGasSCSub;
    data['strMaxUpliftEle'] = this.strMaxUpliftEle;
    data['strMaxUpliftGas'] = this.strMaxUpliftGas;
    data['bteShowRefreshbutton'] = this.bteShowRefreshbutton;
    data['bteShowOptions'] = this.bteShowOptions;
    data['bteCreatedFromGroup'] = this.bteCreatedFromGroup;
    if (this.lstPriceValues != null) {
      data['lstPriceValues'] =
          this.lstPriceValues.map((v) => v.toJson()).toList();
    }
    data['bIsSoldByme'] = this.bIsSoldByme;
    data['bIsSoldByOther'] = this.bIsSoldByOther;
    data['strContractpath'] = this.strContractpath;
    data['strContractStartDate'] = this.strContractStartDate;
    data['strContractEndDate'] = this.strContractEndDate;
    return data;
  }
}

class LstPriceValues {
  String strMaxUpliftEle;
  String strMaxUpliftGas;
  String intTermType;
  String quteId;
  String decChargeDay;
  String decChargeEWE;
  String decChargeNight;
  String decUnitPriceGas;
  String decSCPrice;
  String decChargeDayF;
  String decChargeEWEF;
  String decChargeNightF;
  String decSCPriceF;
  String decCCPriceF;
  String decUnitPriceGasF;
  String decSCPriceGas;
  String decSCPriceGasF;
  String decupliftEle;
  String decupliftEleEWE;
  String decupliftEleNight;
  String decUpliftEleSC;
  String decupliftEleSub;
  String decupliftEleEWESub;
  String decupliftEleNightSub;
  String decUpliftEleSCSub;
  String decupliftGas;
  String decUpliftGasSC;
  String decupliftGasSub;
  String decUpliftGasSCSub;

  LstPriceValues(
      {this.strMaxUpliftEle,
      this.strMaxUpliftGas,
      this.intTermType,
      this.quteId,
      this.decChargeDay,
      this.decChargeEWE,
      this.decChargeNight,
      this.decUnitPriceGas,
      this.decSCPrice,
      this.decChargeDayF,
      this.decChargeEWEF,
      this.decChargeNightF,
      this.decSCPriceF,
      this.decCCPriceF,
      this.decUnitPriceGasF,
      this.decSCPriceGas,
      this.decSCPriceGasF,
      this.decupliftEle,
      this.decupliftEleEWE,
      this.decupliftEleNight,
      this.decUpliftEleSC,
      this.decupliftEleSub,
      this.decupliftEleEWESub,
      this.decupliftEleNightSub,
      this.decUpliftEleSCSub,
      this.decupliftGas,
      this.decUpliftGasSC,
      this.decupliftGasSub,
      this.decUpliftGasSCSub});

  LstPriceValues.fromJson(Map<String, dynamic> json) {
    strMaxUpliftEle = json['strMaxUpliftEle'];
    strMaxUpliftGas = json['strMaxUpliftGas'];
    intTermType = json['intTermType'];
    quteId = json['QuteId'];
    decChargeDay = json['decChargeDay'];
    decChargeEWE = json['decChargeEWE'];
    decChargeNight = json['decChargeNight'];
    decUnitPriceGas = json['decUnitPriceGas'];
    decSCPrice = json['decSCPrice'];
    decChargeDayF = json['decChargeDayF'];
    decChargeEWEF = json['decChargeEWEF'];
    decChargeNightF = json['decChargeNightF'];
    decSCPriceF = json['decSCPriceF'];
    decCCPriceF = json['decCCPriceF'];
    decUnitPriceGasF = json['decUnitPriceGasF'];
    decSCPriceGas = json['decSCPriceGas'];
    decSCPriceGasF = json['decSCPriceGasF'];
    decupliftEle = json['decupliftEle'];
    decupliftEleEWE = json['decupliftEleEWE'];
    decupliftEleNight = json['decupliftEleNight'];
    decUpliftEleSC = json['decUpliftEleSC'];
    decupliftEleSub = json['decupliftEle_Sub'];
    decupliftEleEWESub = json['decupliftEleEWE_Sub'];
    decupliftEleNightSub = json['decupliftEleNight_Sub'];
    decUpliftEleSCSub = json['decUpliftEleSC_Sub'];
    decupliftGas = json['decupliftGas'];
    decUpliftGasSC = json['decUpliftGasSC'];
    decupliftGasSub = json['decupliftGas_Sub'];
    decUpliftGasSCSub = json['decUpliftGasSC_Sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMaxUpliftEle'] = this.strMaxUpliftEle;
    data['strMaxUpliftGas'] = this.strMaxUpliftGas;
    data['intTermType'] = this.intTermType;
    data['QuteId'] = this.quteId;
    data['decChargeDay'] = this.decChargeDay;
    data['decChargeEWE'] = this.decChargeEWE;
    data['decChargeNight'] = this.decChargeNight;
    data['decUnitPriceGas'] = this.decUnitPriceGas;
    data['decSCPrice'] = this.decSCPrice;
    data['decChargeDayF'] = this.decChargeDayF;
    data['decChargeEWEF'] = this.decChargeEWEF;
    data['decChargeNightF'] = this.decChargeNightF;
    data['decSCPriceF'] = this.decSCPriceF;
    data['decCCPriceF'] = this.decCCPriceF;
    data['decUnitPriceGasF'] = this.decUnitPriceGasF;
    data['decSCPriceGas'] = this.decSCPriceGas;
    data['decSCPriceGasF'] = this.decSCPriceGasF;
    data['decupliftEle'] = this.decupliftEle;
    data['decupliftEleEWE'] = this.decupliftEleEWE;
    data['decupliftEleNight'] = this.decupliftEleNight;
    data['decUpliftEleSC'] = this.decUpliftEleSC;
    data['decupliftEle_Sub'] = this.decupliftEleSub;
    data['decupliftEleEWE_Sub'] = this.decupliftEleEWESub;
    data['decupliftEleNight_Sub'] = this.decupliftEleNightSub;
    data['decUpliftEleSC_Sub'] = this.decUpliftEleSCSub;
    data['decupliftGas'] = this.decupliftGas;
    data['decUpliftGasSC'] = this.decUpliftGasSC;
    data['decupliftGas_Sub'] = this.decupliftGasSub;
    data['decUpliftGasSC_Sub'] = this.decUpliftGasSCSub;
    return data;
  }
}
