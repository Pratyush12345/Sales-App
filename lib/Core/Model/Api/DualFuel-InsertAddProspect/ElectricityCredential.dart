class DualFuelELECTRICITYCredential {
  String dfmpanCodeController;
  String dfbusinessController1;
  String dfbusinessController2;
  String dfbusinessController3;
  String dfbusinessController4;
  String dfbusinessController5;
  String dfbusinessController6;
  String dfrhtMpanCodeController;
  String dfrhtBusinessController1;
  String dfrhtBusinessController2;
  String dfrhtBusinessController3;
  String dfrhtBusinessController4;
  String dfrhtBusinessController5;
  String dfrhtBusinessController6;
  String rhtStandingCharge;
  String rhtNightUnit;
  String rhtNightEac;
  String dfwholeMpan;
  String dffullMpan;
  String dfwholeRHTMpan;
  String dffullMpanRHT;
  String dfdteElecStartDate;
  String dfdtContractEndDateEle;
  String dfOthercontractEndDate;
  String dfstrStandingCharge;
  String dfstrDayUnit;
  String dfstrNightUnit;
  String dfstrEWEUnit;
  String dfstrCapacitycharges;
  String dfstrExceesCapacityCharegs;
  String dfstrEMRCFD;
  String dfstrEnergizationstatus;
  String dfelectricityDay_EAC;
  String dfelectricityNight_EAC;
  String dfelectricityEvening_EAC;
  String dfstrSiteCharge;
  String dfstrReactiveCharges;
  String dfstrFITcharge;
  String dfstrNewConnection;
  String dfrhtcheckbox;
  String dfbteMopCustomer;
  String dfbteMopDADCCustomer;

  DualFuelELECTRICITYCredential({
    this.dfmpanCodeController,
    this.dfwholeMpan,
    this.dffullMpan,
    this.dfwholeRHTMpan,
    this.dffullMpanRHT,
    this.dfdteElecStartDate,
    this.dfdtContractEndDateEle,
    this.dfOthercontractEndDate,
    this.dfstrStandingCharge,
    this.dfstrDayUnit,
    this.dfstrNightUnit,
    this.dfstrEWEUnit,
    this.dfstrCapacitycharges,
    this.dfstrExceesCapacityCharegs,
    this.dfstrEMRCFD,
    this.dfstrEnergizationstatus,
    this.dfelectricityDay_EAC,
    this.dfelectricityNight_EAC,
    this.dfelectricityEvening_EAC,
    this.dfstrSiteCharge,
    this.dfstrReactiveCharges,
    this.dfstrFITcharge,
    this.dfstrNewConnection,
    this.dfrhtcheckbox,
    this.dfbteMopCustomer,
    this.dfbteMopDADCCustomer,
    this.dfbusinessController1,
    this.dfbusinessController2,
    this.dfbusinessController3,
    this.dfbusinessController4,
    this.dfbusinessController5,
    this.dfbusinessController6,
    this.dfrhtMpanCodeController,
    this.dfrhtBusinessController1,
    this.dfrhtBusinessController2,
    this.dfrhtBusinessController3,
    this.dfrhtBusinessController4,
    this.dfrhtBusinessController5,
    this.dfrhtBusinessController6,
    this.rhtStandingCharge,
    this.rhtNightUnit,
    this.rhtNightEac,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['wholeMpan'] = this.dfwholeMpan ?? "";
    data['fullMpan'] = this.dffullMpan ?? "";
    data['wholeRHTMpan'] = this.dfwholeRHTMpan ?? "";
    data['fullMpanRHT'] = this.dffullMpanRHT ?? "";
    data['dteElecStartDate'] = this.dfdteElecStartDate ?? "";
    data['dtContractEndDateEle'] = this.dfdtContractEndDateEle ?? "";
    data['dfOthercontractEndDt'] = this.dfOthercontractEndDate ?? "";

    data['strStandingCharge'] = this.dfstrStandingCharge ?? "";
    data['strDayUnit'] = this.dfstrDayUnit ?? "";
    data['strNightUnit'] = this.dfstrNightUnit ?? "";
    data['strEWEUnit'] = this.dfstrEWEUnit ?? "";
    data['strCapacitycharges'] = this.dfstrCapacitycharges ?? "";
    data['strExceesCapacityCharegs'] = this.dfstrExceesCapacityCharegs ?? "";
    data['strEMRCFD'] = this.dfstrEMRCFD ?? "";
    data['strEnergizationstatus'] = this.dfstrEnergizationstatus ?? "";
    data['electricityDay_EAC'] = this.dfelectricityDay_EAC ?? "";
    data['electricityNight_EAC'] = this.dfelectricityNight_EAC ?? "";
    data['electricityEvening_EAC'] = this.dfelectricityEvening_EAC ?? "";
    data['strSiteCharge'] = this.dfstrSiteCharge ?? "";
    data['strReactiveCharges'] = this.dfstrReactiveCharges ?? "";
    data['strFITcharge'] = this.dfstrFITcharge ?? "";
    data['strNewConnection'] = this.dfstrNewConnection ?? "";
    data['rhtcheckbox'] = this.dfrhtcheckbox ?? "";
    data['bteMopCustomer'] = this.dfbteMopCustomer ?? "";
    data['bteCustomerDaDc'] = this.dfbteMopDADCCustomer ?? "";
    data['mpanCodeController'] = this.dfmpanCodeController ?? "";
    data['businessController1'] = this.dfbusinessController1 ?? "";
    data['businessController2'] = this.dfbusinessController2 ?? "";
    data['businessController3'] = this.dfbusinessController3 ?? "";
    data['businessController4'] = this.dfbusinessController4 ?? "";
    data['businessController5'] = this.dfbusinessController5 ?? "";
    data['rhtMpanCodeController'] = this.dfrhtMpanCodeController ?? "";
    data['rhtBusinessController1'] = this.dfrhtBusinessController1 ?? "";
    data['rhtBusinessController2'] = this.dfrhtBusinessController2 ?? "";
    data['rhtBusinessController3'] = this.dfrhtBusinessController3 ?? "";
    data['rhtBusinessController4'] = this.dfrhtBusinessController4 ?? "";
    data['rhtBusinessController5'] = this.dfrhtBusinessController5 ?? "";
    data['rhtBusinessController6'] = this.dfrhtBusinessController6 ?? "";
    data['rhtStandingCharge'] = this.rhtStandingCharge ?? "";
    data['rhtNightUnit'] = this.rhtNightUnit ?? "";
    data['rhtNightEac'] = this.rhtNightEac ?? "";

    return data;
  }
}
