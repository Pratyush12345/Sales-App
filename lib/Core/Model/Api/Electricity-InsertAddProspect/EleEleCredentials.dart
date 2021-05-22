class EleEleCredentials {
  String mpanCodeController;
  String businessController1;
  String businessController2;
  String businessController3;
  String businessController4;
  String businessController5;
  String businessController6;
  String rhtMpanCodeController;
  String rhtBusinessController1;
  String rhtBusinessController2;
  String rhtBusinessController3;
  String rhtBusinessController4;
  String rhtBusinessController5;
  String rhtBusinessController6;
  String rhtStandingCharge;
  String rhtNightUnitCharge;
  String rhtNightEac;
  String wholeMpan;
  String fullMpan;
  String wholeRHTMpan;
  String fullMpanRHT;
  String dteElecStartDate;
  String dtContractEndDateEle;
  String strStandingCharge;
  String strDayUnit;
  String strNightUnit;
  String strEWEUnit;
  String strCapacitycharges;
  String strExceesCapacityCharegs;
  String strEMRCFD;
  String strEnergizationstatus;
  String electricityDay_EAC;
  String electricityNight_EAC;
  String electricityEvening_EAC;
  String strSiteCharge;
  String strReactiveCharges;
  String strFITcharge;
  String strNewConnection;
  String rhtcheckbox;
  String bteMopCustomer;
  String bteMopDADCCustomer;
  String contractEndDate;

  EleEleCredentials({
    this.mpanCodeController,
    this.wholeMpan,
    this.fullMpan,
    this.wholeRHTMpan,
    this.fullMpanRHT,
    this.dteElecStartDate,
    this.dtContractEndDateEle,
    this.strStandingCharge,
    this.strDayUnit,
    this.strNightUnit,
    this.strEWEUnit,
    this.strCapacitycharges,
    this.strExceesCapacityCharegs,
    this.strEMRCFD,
    this.strEnergizationstatus,
    this.electricityDay_EAC,
    this.electricityNight_EAC,
    this.electricityEvening_EAC,
    this.strSiteCharge,
    this.strReactiveCharges,
    this.strFITcharge,
    this.strNewConnection,
    this.rhtcheckbox,
    this.bteMopCustomer,
    this.bteMopDADCCustomer,
    this.businessController1,
    this.businessController2,
    this.businessController3,
    this.businessController4,
    this.businessController5,
    this.businessController6,
    this.rhtMpanCodeController,
    this.rhtBusinessController1,
    this.rhtBusinessController2,
    this.rhtBusinessController3,
    this.rhtBusinessController4,
    this.rhtBusinessController5,
    this.rhtBusinessController6,
    this.rhtStandingCharge,
    this.rhtNightUnitCharge,
    this.rhtNightEac,
    this.contractEndDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['wholeMpan'] = this.wholeMpan ?? "";
    data['fullMpan'] = this.fullMpan ?? "";
    data['wholeRHTMpan'] = this.wholeRHTMpan ?? "";
    data['fullMpanRHT'] = this.fullMpanRHT ?? "";
    data['dteElecStartDate'] = this.dteElecStartDate ?? "";
    data['dtContractEndDateEle'] = this.dtContractEndDateEle ?? "";
    data['strStandingCharge'] = this.strStandingCharge ?? "";
    data['strDayUnit'] = this.strDayUnit ?? "";
    data['strNightUnit'] = this.strNightUnit ?? "";
    data['strEWEUnit'] = this.strEWEUnit ?? "";
    data['strCapacitycharges'] = this.strCapacitycharges ?? "";
    data['strExceesCapacityCharegs'] = this.strExceesCapacityCharegs ?? "";
    data['strEMRCFD'] = this.strEMRCFD ?? "";
    data['strEnergizationstatus'] = this.strEnergizationstatus ?? "";
    data['electricityDay_EAC'] = this.electricityDay_EAC ?? "";
    data['electricityNight_EAC'] = this.electricityNight_EAC ?? "";
    data['electricityEvening_EAC'] = this.electricityEvening_EAC ?? "";
    data['strSiteCharge'] = this.strSiteCharge ?? "";
    data['strReactiveCharges'] = this.strReactiveCharges ?? "";
    data['strFITcharge'] = this.strFITcharge ?? "";
    data['strNewConnection'] = this.strNewConnection ?? "";
    data['rhtcheckbox'] = this.rhtcheckbox ?? "";
    data['bteMopCustomer'] = this.bteMopCustomer ?? "";
    data['bteCustomerDaDc'] = this.bteMopDADCCustomer ?? "";
    data['mpanCodeController'] = this.mpanCodeController ?? "";
    data['businessController1'] = this.businessController1 ?? "";
    data['businessController2'] = this.businessController2 ?? "";
    data['businessController3'] = this.businessController3 ?? "";
    data['businessController4'] = this.businessController4 ?? "";
    data['businessController5'] = this.businessController5 ?? "";
    data['rhtMpanCodeController'] = this.rhtMpanCodeController ?? "";
    data['rhtBusinessController1'] = this.rhtBusinessController1 ?? "";
    data['rhtBusinessController2'] = this.rhtBusinessController2 ?? "";
    data['rhtBusinessController3'] = this.rhtBusinessController3 ?? "";
    data['rhtBusinessController4'] = this.rhtBusinessController4 ?? "";
    data['rhtBusinessController5'] = this.rhtBusinessController5 ?? "";
    data['rhtBusinessController6'] = this.rhtBusinessController6 ?? "";
    data['rhtStandingCharge'] = this.rhtStandingCharge ?? "";
    data['rhtNightUnitCharge'] = this.rhtNightUnitCharge ?? "";
    data['rhtNightEac'] = this.rhtNightEac ?? "";
    data['contractEndDate'] = this.contractEndDate ?? "";

    return data;
  }
}
