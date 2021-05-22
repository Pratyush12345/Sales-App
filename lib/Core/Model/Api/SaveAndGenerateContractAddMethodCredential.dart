import 'package:pozitive/Core/Model/sendable.dart';

class SaveAndGenerateContractAddMethodCredential extends Sendable {
  String AccountId;
  String Type;
  String intCustomerId;
  String strUniqueRefNo;
  String strBusinessnames;
  String MobileNo;
  String RegisterCompanyName;
  String RegisterCompanyNo;
  String RegisterCharityNo;
  String strexcesscapacity;
  String strreactivecharge;
  String strSiteAddress1;
  String strSiteAddress2;
  String strSiteTown;
  String strPostcodeHome;
  String strPostcodeBusiness;
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
  String strSCE;
  String strDayUnitE;
  String strNightUnit;
  String strEweUnit;
  String strDayUnitG;
  String strSCG;
  String strACTo;
  String strACAddress;
  String strACHolderName;
  String strACNumber;
  String strACBranchCode1;
  String strACBranchCode2;
  String strACBranchCode3;
  String strACBranchCode4;
  String strACBranchCode5;
  String strACBranchCode6;
  String bitLtd;
  String bitPlc;
  String bitCharity;
  String bitPublicSector;
  String bitST;
  String bitLlp;
  String bitpPPC;
  String bitLlc;
  String bitOther;
  String bteMicroBusiness;
  String strPhoneHome;
  String strEmailHome;
  String strFullName;
  String strTown;
  String strAddress1;

  SaveAndGenerateContractAddMethodCredential({
    this.AccountId,
    this.Type,
    this.intCustomerId,
    this.strUniqueRefNo,
    this.strBusinessnames,
    this.MobileNo,
    this.RegisterCompanyName,
    this.RegisterCompanyNo,
    this.RegisterCharityNo,
    this.strexcesscapacity,
    this.strreactivecharge,
    this.strSiteAddress1,
    this.strSiteAddress2,
    this.strSiteTown,
    this.strPostcodeHome,
    this.strPostcodeBusiness,
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
    this.strSCE,
    this.strDayUnitE,
    this.strNightUnit,
    this.strEweUnit,
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
    this.bitLtd,
    this.bitPlc,
    this.bitCharity,
    this.bitPublicSector,
    this.bitST,
    this.bitLlp,
    this.bitpPPC,
    this.bitLlc,
    this.bitOther,
    this.bteMicroBusiness,
    this.strPhoneHome,
    this.strEmailHome,
    this.strFullName,
    this.strTown,
    this.strAddress1,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['AccountId'] = this.AccountId;
    data['Type'] = this.Type;
    data['intCustomerId'] = this.intCustomerId;
    data['strUniqueRefNo'] = this.strUniqueRefNo;
    data['strBusinessnames'] = this.strBusinessnames;
    data['MobileNo'] = this.MobileNo;
    data['RegisterCompanyName'] = this.RegisterCompanyName;
    data['RegisterCompanyNo'] = this.RegisterCompanyNo;
    data['RegisterCharityNo'] = this.RegisterCharityNo;
    data['strexcesscapacity'] = this.strexcesscapacity;
    data['strreactivecharge'] = this.strreactivecharge;
    data['strSiteAddress1'] = this.strSiteAddress1;
    data['strSiteAddress2'] = this.strSiteAddress2;
    data['strSiteTown'] = this.strSiteTown;
    data['strPostcodeHome'] = this.strPostcodeHome;
    data['strPostcodeBusiness'] = this.strPostcodeBusiness;
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
    data['strSCE'] = this.strSCE;
    data['strDayUnitE'] = this.strDayUnitE;
    data['strNightUnit'] = this.strNightUnit;
    data['strEweUnit'] = this.strEweUnit;
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
    data['bitLtd'] = this.bitLtd;
    data['bitPlc'] = this.bitPlc;
    data['bitCharity'] = this.bitCharity;
    data['bitPublicSector'] = this.bitPublicSector;
    data['bitST'] = this.bitST;
    data['bitLlp'] = this.bitLlp;
    data['bitpPPC'] = this.bitpPPC;
    data['bitLlc'] = this.bitLlc;
        data['bitOther'] = this.bitOther;
    data['bteMicroBusiness'] = this.bteMicroBusiness;
    data['strPhoneHome'] = this.strPhoneHome;
    data['strEmailHome'] = this.strEmailHome;
    data['strFullName'] = this.strFullName;
    data['strTown'] = this.strTown;
    data['strAddress1'] = this.strAddress1;

    return data;
  }
}
