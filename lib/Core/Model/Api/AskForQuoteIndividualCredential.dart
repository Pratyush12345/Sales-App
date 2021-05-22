import 'package:pozitive/Core/Model/sendable.dart';

class AskForQuoteIndividualCredential extends Sendable {
  String wholeMpan;
  String AccountId;
  String FullMPAN;
  String MPRN;
  String Quoteid;
  String BusinessName;
  String PostCode;
  String EACDay;
  String EACNight;
  String EACEWE;
  String IsforFirstyear;
  String IsforSecondyear;
  String IsforThirdyear;
  String IsforFourthyear;
  String RequiredByDate;
  String AQ;
  String PreferredStartDate;
  String ThirdPartyMOP;
  String ThirdPartyDADC;
  String SingleRate;
  String Image64HHFile;
  String IsforFifthyear;
  String IsforOtheryear;
  String IsStarkDADC;
  String intDADCId;
  String PreferredEndDate;
  String PreferredEndDate1;
  String PreferredEndDate2;

  AskForQuoteIndividualCredential({
    this.wholeMpan,
    this.AccountId,
    this.FullMPAN,
    this.MPRN,
    this.Quoteid,
    this.BusinessName,
    this.PostCode,
    this.EACDay,
    this.EACNight,
    this.EACEWE,
    this.IsforFirstyear,
    this.IsforSecondyear,
    this.IsforThirdyear,
    this.IsforFourthyear,
    this.RequiredByDate,
    this.AQ,
    this.PreferredStartDate,
    this.ThirdPartyMOP,
    this.ThirdPartyDADC,
    this.SingleRate,
    this.Image64HHFile,
    this.IsforFifthyear,
    this.IsforOtheryear,
    this.IsStarkDADC,
    this.intDADCId,
    this.PreferredEndDate,
    this.PreferredEndDate1,
    this.PreferredEndDate2,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wholeMpan'] = this.wholeMpan ?? '';
    data['AccountId'] = this.AccountId;
    data['FullMPAN'] = this.FullMPAN ?? '';
    data['MPRN'] = this.MPRN ?? '';
    data['Quoteid'] = this.Quoteid;
    data['BusinessName'] = this.BusinessName;
    data['PostCode'] = this.PostCode;
    data['EACDay'] = this.EACDay ?? '';
    data['EACNight'] = this.EACNight ?? '';
    data['EACEWE'] = this.EACEWE ?? '';
    data['IsforFirstyear'] = this.IsforFirstyear;
    data['IsforSecondyear'] = this.IsforSecondyear;
    data['IsforThirdyear'] = this.IsforThirdyear;
    data['IsforFourthyear'] = this.IsforFourthyear;
    data['RequiredByDate'] = this.RequiredByDate;
    data['AQ'] = this.AQ ?? '';
    data['PreferredStartDate'] = this.PreferredStartDate;
    data['ThirdPartyMOP'] = this.ThirdPartyMOP;
    data['ThirdPartyDADC'] = this.ThirdPartyDADC;
    data['SingleRate'] = this.SingleRate;
    data['Image64HHFile'] = this.Image64HHFile;
    data['IsforFifthyear'] = this.IsforFifthyear;
    data['IsforOtheryear'] = this.IsforOtheryear;
    data['IsStarkDADC'] = this.IsStarkDADC;
    data['intDADCId'] = this.intDADCId;
    data['PreferredEndDate'] = this.PreferredEndDate;
    data['PreferredEndDate1'] = this.PreferredEndDate1;
    data['PreferredEndDate2'] = this.PreferredEndDate2;

    return data;
  }
}
