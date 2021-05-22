import 'package:pozitive/Core/Model/sendable.dart';

class GroupAddPartnerAddQuickLeadCrential extends Sendable {
  String accountId;
  String command;
  String intCompanyUserId;
  String intCompanyId;
  String groupId;
  String qouteNotesGroup;
  String image64GroupFile;
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
  String blHHstatus;
  String isCommonEnddate;
  String requiredByDate;
  String contractEndDateGroup;
  String intDADCId;
  String filePath;

  GroupAddPartnerAddQuickLeadCrential({
    this.accountId,
    this.command,
    this.intCompanyUserId,
    this.intCompanyId,
    this.groupId,
    this.qouteNotesGroup,
    this.image64GroupFile,
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
    this.blHHstatus,
    this.isCommonEnddate,
    this.requiredByDate,
    this.contractEndDateGroup,
    this.intDADCId,
    this.filePath,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Command'] = this.command;
    data['IntCompanyUserId'] = this.intCompanyUserId;
    data['IntCompanyId'] = this.intCompanyId;
    data['GroupId'] = this.groupId;
    data['QouteNotesGroup'] = this.qouteNotesGroup;
    data['Image64GroupFile'] = this.image64GroupFile ?? '';
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
    data['blHHstatus'] = this.blHHstatus;
    data['IsCommonEnddate'] = this.isCommonEnddate;
    data['RequiredByDate'] = this.requiredByDate;
    data['ContractEndDateGroup'] = this.contractEndDateGroup;
    data['intDADCId'] = this.intDADCId;
    data['filePath'] = this.filePath;
    
    return data;
  }
}
