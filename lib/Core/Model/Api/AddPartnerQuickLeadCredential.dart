
import 'package:pozitive/Core/Model/sendable.dart';

class AddPartnerQuickLeadCredential extends Sendable {
  String accountId;
  String fullMPAN;
  String fPRN;
  String quoteid;
  String businessName;
  String postCode;
  String eACDay;
  String eACNight;
  String eACEWE;
  String isforFirstyear;
  String isforSecondyear;
  String isforThirdyear;
  String isforFourthyear;
  String requiredByDate;
  String aQ;
  String preferredStartDate;
  String thirdPartyMOP;
  String thirdPartyDADC;
  String singleRate;
  String image64HHFile;
  String isforFifthyear;
  String isforOtheryear;
  String isStarkDADC;
  String intDADCId;
  String preferredEndDate;
  String preferredEndDate1;
  String preferredEndDate2;

  AddPartnerQuickLeadCredential({
    this.accountId,
    this.fullMPAN,
    this.fPRN,
    this.quoteid,
    this.businessName,
    this.postCode,
    this.eACDay,
    this.eACNight,
    this.eACEWE,
    this.isforFirstyear,
    this.isforSecondyear,
    this.isforThirdyear,
    this.isforFourthyear,
    this.requiredByDate,
    this.aQ,
    this.preferredStartDate,
    this.thirdPartyMOP,
    this.thirdPartyDADC,
    this.singleRate,
    this.image64HHFile,
   this.isforFifthyear,
   this.isforOtheryear,
   this.isStarkDADC,
   this.intDADCId,
   this.preferredEndDate,
   this.preferredEndDate1,
   this.preferredEndDate2,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['FullMPAN'] = this.fullMPAN;
    data['Quoteid']=this.quoteid;
    data['BusinessName']=this.businessName;
    data['PostCode']=this.postCode;
    data['EACDay']=this.eACDay;
    data['EACNight']=this.eACNight;
    data['EACEWE']=this.eACEWE;
    data['IsforFirstyear']=this.isforFirstyear;
    data['IsforSecondyear']=this.isforSecondyear;
    data['IsforThirdyear']=this.isforThirdyear;
    data['IsforFourthyear']=this.isforFourthyear;
    data['RequiredByDate']=this.requiredByDate;
    data['AQ']=this.aQ;
    data['PreferredStartDate']=this.preferredStartDate;
    data['ThirdPartyMOP']=this.thirdPartyMOP;
    data['ThirdPartyDADC']=this.thirdPartyDADC;
    data['SingleRate']=this.singleRate;
    data['Image64HHFile']=this.image64HHFile;
    data['IsforFifthyear']=this.isforFifthyear;
    data['IsforOtheryear']=this.isforOtheryear;
    data['IsStarkDADC']=this.isStarkDADC;
    data['intDADCId']=this.intDADCId;
    data['PreferredEndDate']=this.preferredEndDate;
    data['PreferredEndDate1']=this.preferredEndDate1;
    data['PreferredEndDate2']=this.preferredEndDate2;


    return data;
  }
}