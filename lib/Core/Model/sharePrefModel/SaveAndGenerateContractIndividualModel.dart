class SaveAndGenerateContractIndividualModel {
  String accountId;
  String type;
  int quoteId;
  int intGroupid;
  Null message;
  int intCustomerId;
  String strUniqueRefNo;
  String strFullName;
  String strBusinessnames;
  Null strHomeaddress;
  String strAddress1;
  Null strAddress2;
  String strTown;
  String mobileNo;
  String registerCompanyName;
  String registerCompanyNo;
  String registerCharityNo;
  String strexcesscapacity;
  String strreactivecharge;
  String strSiteAddress1;
  Null strSiteAddress2;
  String strSiteTown;
  String strPostcodeHome;
  String strPostcodeBusiness;
  String strPhoneHome;
  Null strPhoneBusiness;
  Null strEmailBusiness;
  String strEmailHome;
  String strsitecapacity;
  String strcapacitycharge;
  String strContractStartDate;
  String strContractEndDate;
  String strContractStartDateGas;
  String strContractEndDateGas;
  String strMPRN;
  String strMPAN1;
  String strMPAN2;
  String strMPAN3;
  String strMPAN4;
  String strMPAN5;
  String strMPAN6;
  String strMPAN7;
  Null strTariffNameE;
  String strSCE;
  String strDayUnitE;
  String strNightUnit;
  String strEweUnit;
  Null strTariffNameG;
  String strDayUnitG;
  String strSCG;
  Null strACTo;
  Null strACAddress;
  String strACHolderName;
  String strACNumber;
  Null strACBranchCode1;
  Null strACBranchCode2;
  Null strACBranchCode3;
  Null strACBranchCode4;
  Null strACBranchCode5;
  Null strACBranchCode6;
  Null strEMR;
  Null strSupplyCapacity;
  bool bitLtd;
  bool bitPlc;
  bool bitCharity;
  bool bitPublicSector;
  bool bitST;
  bool bitLlp;
  bool bitLlpPPC;
  bool bitpPPC;
  bool bitLlc;
  bool bitOther;
  bool bteMicroBusiness;
  bool bitWithDD;
  Null imagebase64Premisescontract;
  bool bitLtdPPC;
  bool bitPlcPPC;
  bool bitCharityPPC;
  bool bitPublicSectorPPC;
  bool bitSTPPC;
  bool chkBillAddr;
  Null strUniqueRefNoPPC;
  Null strName1PPC;
  Null strName2PPC;
  Null strJobTitle1PPC;
  Null strJobTitle2PPC;
  Null strCompanyNamePPC;
  Null strBusinessNamePPC;
  Null strHomeAddress1PPC;
  Null strHomeAddress2PPC;
  Null strAddress1PPC;
  Null strAddress2PPC;
  Null strTownPPC;
  Null strPostcodeHomePPC;
  Null strPostcodeBusinessPPC;
  Null strPhoneBusinessPPC;
  Null strEmailBusinessPPC;
  Null landLineNo;
  Null mobileNoPPC;
  Null registerCompanyNamePPC;
  Null registerCompanyNoPPC;
  Null registerCharityNoPPC;
  Null strSitePostCodePPC;
  Null strSiteTownPPC;
  int intLeadType;
  int intcompanyid;
  String strACBusinessName;
  String strACOwnername;
  String bitIsRHT;

  SaveAndGenerateContractIndividualModel(
      {this.accountId,
      this.type,
      this.quoteId,
      this.intGroupid,
      this.message,
      this.intCustomerId,
      this.strUniqueRefNo,
      this.strFullName,
      this.strBusinessnames,
      this.strHomeaddress,
      this.strAddress1,
      this.strAddress2,
      this.strTown,
      this.mobileNo,
      this.registerCompanyName,
      this.registerCompanyNo,
      this.registerCharityNo,
      this.strexcesscapacity,
      this.strreactivecharge,
      this.strSiteAddress1,
      this.strSiteAddress2,
      this.strSiteTown,
      this.strPostcodeHome,
      this.strPostcodeBusiness,
      this.strPhoneHome,
      this.strPhoneBusiness,
      this.strEmailBusiness,
      this.strEmailHome,
      this.strsitecapacity,
      this.strcapacitycharge,
      this.strContractStartDate,
      this.strContractEndDate,
      this.strContractStartDateGas,
      this.strContractEndDateGas,
      this.strMPRN,
      this.strMPAN1,
      this.strMPAN2,
      this.strMPAN3,
      this.strMPAN4,
      this.strMPAN5,
      this.strMPAN6,
      this.strMPAN7,
      this.strTariffNameE,
      this.strSCE,
      this.strDayUnitE,
      this.strNightUnit,
      this.strEweUnit,
      this.strTariffNameG,
      this.strDayUnitG,
      this.strSCG,
      this.strACTo,
      this.strACAddress,
      this.strACHolderName,
      this.strACNumber,
      this.strACBranchCode1,
      this.strACBranchCode2,
      this.strACBranchCode3,
      this.strACBranchCode4,
      this.strACBranchCode5,
      this.strACBranchCode6,
      this.strEMR,
      this.strSupplyCapacity,
      this.bitLtd,
      this.bitPlc,
      this.bitCharity,
      this.bitPublicSector,
      this.bitST,
      this.bitLlp,
      this.bitLlpPPC,
      this.bitpPPC,
      this.bitLlc,
      this.bitOther,
      this.bteMicroBusiness,
      this.bitWithDD,
      this.imagebase64Premisescontract,
      this.bitLtdPPC,
      this.bitPlcPPC,
      this.bitCharityPPC,
      this.bitPublicSectorPPC,
      this.bitSTPPC,
      this.chkBillAddr,
      this.strUniqueRefNoPPC,
      this.strName1PPC,
      this.strName2PPC,
      this.strJobTitle1PPC,
      this.strJobTitle2PPC,
      this.strCompanyNamePPC,
      this.strBusinessNamePPC,
      this.strHomeAddress1PPC,
      this.strHomeAddress2PPC,
      this.strAddress1PPC,
      this.strAddress2PPC,
      this.strTownPPC,
      this.strPostcodeHomePPC,
      this.strPostcodeBusinessPPC,
      this.strPhoneBusinessPPC,
      this.strEmailBusinessPPC,
      this.landLineNo,
      this.mobileNoPPC,
      this.registerCompanyNamePPC,
      this.registerCompanyNoPPC,
      this.registerCharityNoPPC,
      this.strSitePostCodePPC,
      this.strSiteTownPPC,
      this.intLeadType,
      this.intcompanyid,
      this.strACBusinessName,
      this.strACOwnername,
      this.bitIsRHT});

  SaveAndGenerateContractIndividualModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    type = json['Type'];
    quoteId = json['QuoteId'];
    intGroupid = json['intGroupid'];
    message = json['Message'];
    intCustomerId = json['intCustomerId'];
    strUniqueRefNo = json['strUniqueRefNo'];
    strFullName = json['strFullName'];
    strBusinessnames = json['strBusinessnames'];
    strHomeaddress = json['strHomeaddress'];
    strAddress1 = json['strAddress1'];
    strAddress2 = json['strAddress2'];
    strTown = json['strTown'];
    mobileNo = json['MobileNo'];
    registerCompanyName = json['RegisterCompanyName'];
    registerCompanyNo = json['RegisterCompanyNo'];
    registerCharityNo = json['RegisterCharityNo'];
    strexcesscapacity = json['strexcesscapacity'];
    strreactivecharge = json['strreactivecharge'];
    strSiteAddress1 = json['strSiteAddress1'];
    strSiteAddress2 = json['strSiteAddress2'];
    strSiteTown = json['strSiteTown'];
    strPostcodeHome = json['strPostcodeHome'];
    strPostcodeBusiness = json['strPostcodeBusiness'];
    strPhoneHome = json['strPhoneHome'];
    strPhoneBusiness = json['strPhoneBusiness'];
    strEmailBusiness = json['strEmailBusiness'];
    strEmailHome = json['strEmailHome'];
    strsitecapacity = json['strsitecapacity'];
    strcapacitycharge = json['strcapacitycharge'];
    strContractStartDate = json['strContractStartDate'];
    strContractEndDate = json['strContractEndDate'];
    strContractStartDateGas = json['strContractStartDateGas'];
    strContractEndDateGas = json['strContractEndDateGas'];
    strMPRN = json['strMPRN'];
    strMPAN1 = json['strMPAN1'];
    strMPAN2 = json['strMPAN2'];
    strMPAN3 = json['strMPAN3'];
    strMPAN4 = json['strMPAN4'];
    strMPAN5 = json['strMPAN5'];
    strMPAN6 = json['strMPAN6'];
    strMPAN7 = json['strMPAN7'];
    strTariffNameE = json['strTariffNameE'];
    strSCE = json['strSCE'];
    strDayUnitE = json['strDayUnitE'];
    strNightUnit = json['strNightUnit'];
    strEweUnit = json['strEweUnit'];
    strTariffNameG = json['strTariffNameG'];
    strDayUnitG = json['strDayUnitG'];
    strSCG = json['strSCG'];
    strACTo = json['strACTo'];
    strACAddress = json['strACAddress'];
    strACHolderName = json['strACHolderName'];
    strACNumber = json['strACNumber'];
    strACBranchCode1 = json['strACBranchCode1'];
    strACBranchCode2 = json['strACBranchCode2'];
    strACBranchCode3 = json['strACBranchCode3'];
    strACBranchCode4 = json['strACBranchCode4'];
    strACBranchCode5 = json['strACBranchCode5'];
    strACBranchCode6 = json['strACBranchCode6'];
    strEMR = json['strEMR'];
    strSupplyCapacity = json['strSupplyCapacity'];
    bitLtd = json['bitLtd'];
    bitPlc = json['bitPlc'];
    bitCharity = json['bitCharity'];
    bitPublicSector = json['bitPublicSector'];
    bitST = json['bitST'];
    bitLlp = json['bitLlp'];
    bitLlpPPC = json['bitLlpPPC'];
    bitpPPC = json['bitpPPC'];
    bitLlc = json['bitLlc'];
    bitOther = json['bitOther'];
    bteMicroBusiness = json['bteMicroBusiness'];
    bitWithDD = json['bitWithDD'];
    imagebase64Premisescontract = json['Imagebase64Premisescontract'];
    bitLtdPPC = json['bitLtdPPC'];
    bitPlcPPC = json['bitPlcPPC'];
    bitCharityPPC = json['bitCharityPPC'];
    bitPublicSectorPPC = json['bitPublicSectorPPC'];
    bitSTPPC = json['bitSTPPC'];
    chkBillAddr = json['chkBillAddr'];
    strUniqueRefNoPPC = json['strUniqueRefNoPPC'];
    strName1PPC = json['strName1PPC'];
    strName2PPC = json['strName2PPC'];
    strJobTitle1PPC = json['strJobTitle1PPC'];
    strJobTitle2PPC = json['strJobTitle2PPC'];
    strCompanyNamePPC = json['strCompanyNamePPC'];
    strBusinessNamePPC = json['strBusinessNamePPC'];
    strHomeAddress1PPC = json['strHomeAddress1PPC'];
    strHomeAddress2PPC = json['strHomeAddress2PPC'];
    strAddress1PPC = json['strAddress1PPC'];
    strAddress2PPC = json['strAddress2PPC'];
    strTownPPC = json['strTownPPC'];
    strPostcodeHomePPC = json['strPostcodeHomePPC'];
    strPostcodeBusinessPPC = json['strPostcodeBusinessPPC'];
    strPhoneBusinessPPC = json['strPhoneBusinessPPC'];
    strEmailBusinessPPC = json['strEmailBusinessPPC'];
    landLineNo = json['LandLineNo'];
    mobileNoPPC = json['MobileNoPPC'];
    registerCompanyNamePPC = json['RegisterCompanyNamePPC'];
    registerCompanyNoPPC = json['RegisterCompanyNoPPC'];
    registerCharityNoPPC = json['RegisterCharityNoPPC'];
    strSitePostCodePPC = json['strSitePostCodePPC'];
    strSiteTownPPC = json['strSiteTownPPC'];
    intLeadType = json['IntLeadType'];
    intcompanyid = json['intcompanyid'];
    strACBusinessName = json['strACBusinessName'];
    strACOwnername = json['strACOwnername'];
    bitIsRHT = json['bitIsRHT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Type'] = this.type;
    data['QuoteId'] = this.quoteId;
    data['intGroupid'] = this.intGroupid;
    data['Message'] = this.message;
    data['intCustomerId'] = this.intCustomerId;
    data['strUniqueRefNo'] = this.strUniqueRefNo;
    data['strFullName'] = this.strFullName;
    data['strBusinessnames'] = this.strBusinessnames;
    data['strHomeaddress'] = this.strHomeaddress;
    data['strAddress1'] = this.strAddress1;
    data['strAddress2'] = this.strAddress2;
    data['strTown'] = this.strTown;
    data['MobileNo'] = this.mobileNo;
    data['RegisterCompanyName'] = this.registerCompanyName;
    data['RegisterCompanyNo'] = this.registerCompanyNo;
    data['RegisterCharityNo'] = this.registerCharityNo;
    data['strexcesscapacity'] = this.strexcesscapacity;
    data['strreactivecharge'] = this.strreactivecharge;
    data['strSiteAddress1'] = this.strSiteAddress1;
    data['strSiteAddress2'] = this.strSiteAddress2;
    data['strSiteTown'] = this.strSiteTown;
    data['strPostcodeHome'] = this.strPostcodeHome;
    data['strPostcodeBusiness'] = this.strPostcodeBusiness;
    data['strPhoneHome'] = this.strPhoneHome;
    data['strPhoneBusiness'] = this.strPhoneBusiness;
    data['strEmailBusiness'] = this.strEmailBusiness;
    data['strEmailHome'] = this.strEmailHome;
    data['strsitecapacity'] = this.strsitecapacity;
    data['strcapacitycharge'] = this.strcapacitycharge;
    data['strContractStartDate'] = this.strContractStartDate;
    data['strContractEndDate'] = this.strContractEndDate;
    data['strContractStartDateGas'] = this.strContractStartDateGas;
    data['strContractEndDateGas'] = this.strContractEndDateGas;
    data['strMPRN'] = this.strMPRN;
    data['strMPAN1'] = this.strMPAN1;
    data['strMPAN2'] = this.strMPAN2;
    data['strMPAN3'] = this.strMPAN3;
    data['strMPAN4'] = this.strMPAN4;
    data['strMPAN5'] = this.strMPAN5;
    data['strMPAN6'] = this.strMPAN6;
    data['strMPAN7'] = this.strMPAN7;
    data['strTariffNameE'] = this.strTariffNameE;
    data['strSCE'] = this.strSCE;
    data['strDayUnitE'] = this.strDayUnitE;
    data['strNightUnit'] = this.strNightUnit;
    data['strEweUnit'] = this.strEweUnit;
    data['strTariffNameG'] = this.strTariffNameG;
    data['strDayUnitG'] = this.strDayUnitG;
    data['strSCG'] = this.strSCG;
    data['strACTo'] = this.strACTo;
    data['strACAddress'] = this.strACAddress;
    data['strACHolderName'] = this.strACHolderName;
    data['strACNumber'] = this.strACNumber;
    data['strACBranchCode1'] = this.strACBranchCode1;
    data['strACBranchCode2'] = this.strACBranchCode2;
    data['strACBranchCode3'] = this.strACBranchCode3;
    data['strACBranchCode4'] = this.strACBranchCode4;
    data['strACBranchCode5'] = this.strACBranchCode5;
    data['strACBranchCode6'] = this.strACBranchCode6;
    data['strEMR'] = this.strEMR;
    data['strSupplyCapacity'] = this.strSupplyCapacity;
    data['bitLtd'] = this.bitLtd;
    data['bitPlc'] = this.bitPlc;
    data['bitCharity'] = this.bitCharity;
    data['bitPublicSector'] = this.bitPublicSector;
    data['bitST'] = this.bitST;
    data['bitLlp'] = this.bitLlp;
    data['bitLlpPPC'] = this.bitLlpPPC;
    data['bitpPPC'] = this.bitpPPC;
    data['bitLlc'] = this.bitLlc;
    data['bteMicroBusiness'] = this.bteMicroBusiness;
    data['bitWithDD'] = this.bitWithDD;
    data['Imagebase64Premisescontract'] = this.imagebase64Premisescontract;
    data['bitLtdPPC'] = this.bitLtdPPC;
    data['bitPlcPPC'] = this.bitPlcPPC;
    data['bitCharityPPC'] = this.bitCharityPPC;
    data['bitPublicSectorPPC'] = this.bitPublicSectorPPC;
    data['bitSTPPC'] = this.bitSTPPC;
    data['chkBillAddr'] = this.chkBillAddr;
    data['strUniqueRefNoPPC'] = this.strUniqueRefNoPPC;
    data['strName1PPC'] = this.strName1PPC;
    data['strName2PPC'] = this.strName2PPC;
    data['strJobTitle1PPC'] = this.strJobTitle1PPC;
    data['strJobTitle2PPC'] = this.strJobTitle2PPC;
    data['strCompanyNamePPC'] = this.strCompanyNamePPC;
    data['strBusinessNamePPC'] = this.strBusinessNamePPC;
    data['strHomeAddress1PPC'] = this.strHomeAddress1PPC;
    data['strHomeAddress2PPC'] = this.strHomeAddress2PPC;
    data['strAddress1PPC'] = this.strAddress1PPC;
    data['strAddress2PPC'] = this.strAddress2PPC;
    data['strTownPPC'] = this.strTownPPC;
    data['strPostcodeHomePPC'] = this.strPostcodeHomePPC;
    data['strPostcodeBusinessPPC'] = this.strPostcodeBusinessPPC;
    data['strPhoneBusinessPPC'] = this.strPhoneBusinessPPC;
    data['strEmailBusinessPPC'] = this.strEmailBusinessPPC;
    data['LandLineNo'] = this.landLineNo;
    data['MobileNoPPC'] = this.mobileNoPPC;
    data['RegisterCompanyNamePPC'] = this.registerCompanyNamePPC;
    data['RegisterCompanyNoPPC'] = this.registerCompanyNoPPC;
    data['RegisterCharityNoPPC'] = this.registerCharityNoPPC;
    data['strSitePostCodePPC'] = this.strSitePostCodePPC;
    data['strSiteTownPPC'] = this.strSiteTownPPC;
    data['IntLeadType'] = this.intLeadType;
    data['intcompanyid'] = this.intcompanyid;
    data['strACBusinessName'] = this.strACBusinessName;
    data['strACOwnername'] = this.strACOwnername;
    data['bitIsRHT'] = this.bitIsRHT;
    return data;
  }
}
