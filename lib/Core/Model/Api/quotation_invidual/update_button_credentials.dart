
class UpdateButtonCredentials{
  String accountId;
  String fullMPAN;
  String mPRN;
  String intCompanyId;
  String quoteid;
  String businessName;
  String postCode;
  String emailId;
  String phoneNo;
  String eACDay;
  String eACNight;
  String eACEWE;
  String isforFirstyear;
  String isforSecondyear;
  String isforThirdyear;
  String isforFourthyear;
  String isforFifthyear;
  String isforOtheryear;
  String requiredByDate;
  String aQ;
  String qouteNotes;
  String preferredStartDate;
  String preferredEndDate;
  String preferredEndDate1;
  String preferredEndDate2;
  String thirdPartyMOP;
  String thirdPartyDADC;
  String isStarkDADC;
  String intDADCId;
  String customerId;
  String singleRate;
  String image64HHFile;
  UpdateButtonCredentials({this.accountId,this.aQ,this.eACNight,this.eACDay,this.postCode,this.businessName,
  this.requiredByDate,this.quoteid,this.singleRate,this.customerId,this.thirdPartyDADC,this.eACEWE,this.emailId,
  this.fullMPAN,this.image64HHFile,this.intCompanyId,this.intDADCId,this.isforFifthyear,this.isforFirstyear,this.isforFourthyear,
  this.isforOtheryear,this.isforSecondyear,this.isforThirdyear,this.isStarkDADC,this.mPRN,this.phoneNo,this.preferredEndDate,
  this.preferredEndDate1,this.preferredEndDate2,this.preferredStartDate,this.qouteNotes,this.thirdPartyMOP});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId??'';
    data['FullMPAN'] = this.fullMPAN??'';
    data['MPRN'] = this.mPRN??'';
    data['IntCompanyId'] = this.intCompanyId??'';
    data['Quoteid'] = this.quoteid??'';
    data['BusinessName'] = this.businessName??'';
    data['PostCode'] = this.postCode??'';
    data['EmailId'] = this.emailId??'';
    data['AccountId'] = this.accountId??'';
    data['PhoneNo'] = this.phoneNo??'';
    data['EACDay'] = this.eACDay??'';
    data['EACNight'] = this.eACNight??'';
    data['EACEWE'] = this.eACEWE??'';
    data['IsforFirstyear'] = this.isforFirstyear??'';
    data['IsforSecondyear'] = this.isforSecondyear??'';
    data['IsforThirdyear'] = this.isforThirdyear??'';
    data['IsforFourthyear'] = this.isforFourthyear??'';
    data['IsforOtheryear'] = this.isforOtheryear??'';
    data['RequiredByDate'] = this.requiredByDate??'';
    data['AQ'] = this.aQ??'';
    data['QouteNotes'] = this.qouteNotes??'';
    data['PreferredStartDate'] = this.preferredStartDate??'';
    data['PreferredEndDate'] = this.preferredEndDate??'';
    data['PreferredEndDate1'] = this.preferredEndDate1??'';
    data['PreferredEndDate2'] = this.preferredEndDate2??'';
    data['ThirdPartyMOP'] = this.thirdPartyMOP??'false';
    data['ThirdPartyDADC'] = this.thirdPartyDADC??'false';
    data['intDADCId'] = this.intDADCId??'';
    data['CustomerId'] = this.customerId??'0';
    data['SingleRate'] = this.singleRate??'';
    data['Image64HHFile'] = this.image64HHFile??'';


    return data;
  }

}