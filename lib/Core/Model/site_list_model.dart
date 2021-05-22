class SiteListModel {
  String businessName;
  String strPostCode;
  String fullMpanNumber;
  String gasMprn;
  String electricityNightEAC;
  String electricityDayEAC;
  String gASEAC;
  String dteContractStartDate;
  String dteContractEndDate;
  String preferedStartDate;
  String preferedEndDate;
  String businessNameErr;
  String postCodeErr;
  String mpanErr;
  String nightEACErr;
  String dayEACErr;
  String electricityEveningEAC;
  String eveningEACErr;
  String mprnErr;
  String gASEACErr;
  String startDateErr;
  String endDateErr;
  String bothMissErr;
  String strMPANStatus;
  String singleRateErr;
  String strSingleRate;
  String strSiteAdrr1;
  String strSiteAdrr2;
  String strSiteCity;
  String strSitePostCode;
  bool singleRate;
  String strBillAdrr1;
  String strBillAdrr2;
  String strBillCity;
  String strBillPostCode;
  String strParentMPAN;
  bool bisGreenCertificate;
  bool bIsSingleRate;
  String energyErr;
  String mPANCore;
  String eACDay;
  String eACNight;
  String eACEWE;
  String mPRN;
  String eACGAS;

  SiteListModel(
      {this.businessName,
      this.strPostCode,
      this.fullMpanNumber,
      this.gasMprn,
      this.electricityNightEAC,
      this.electricityDayEAC,
      this.gASEAC,
      this.dteContractStartDate,
      this.dteContractEndDate,
      this.preferedStartDate,
      this.preferedEndDate,
      this.businessNameErr,
      this.postCodeErr,
      this.mpanErr,
      this.nightEACErr,
      this.dayEACErr,
      this.electricityEveningEAC,
      this.eveningEACErr,
      this.mprnErr,
      this.gASEACErr,
      this.startDateErr,
      this.endDateErr,
      this.bothMissErr,
      this.strMPANStatus,
      this.singleRateErr,
      this.strSingleRate,
      this.strSiteAdrr1,
      this.strSiteAdrr2,
      this.strSiteCity,
      this.strSitePostCode,
      this.singleRate,
      this.strBillAdrr1,
      this.strBillAdrr2,
      this.strBillCity,
      this.strBillPostCode,
      this.strParentMPAN,
      this.bisGreenCertificate,
      this.bIsSingleRate,
      this.energyErr,
      this.mPANCore,
      this.eACDay,
      this.eACNight,
      this.eACEWE,
      this.mPRN,
      this.eACGAS});

  SiteListModel.fromJson(Map<String, dynamic> json) {
    businessName = json['Business_Name'];
    strPostCode = json['strPostCode'];
    fullMpanNumber = json['Full_Mpan_Number'];
    gasMprn = json['Gas_Mprn'];
    electricityNightEAC = json['ElectricityNight_EAC'];
    electricityDayEAC = json['ElectricityDay_EAC'];
    gASEAC = json['GAS_EAC'];
    dteContractStartDate = json['dteContractStartDate'];
    dteContractEndDate = json['dteContractEndDate'];
    preferedStartDate = json['PreferedStartDate'];
    preferedEndDate = json['PreferedEndDate'];
    businessNameErr = json['Business_NameErr'];
    postCodeErr = json['PostCodeErr'];
    mpanErr = json['MpanErr'];
    nightEACErr = json['Night_EACErr'];
    dayEACErr = json['Day_EACErr'];
    electricityEveningEAC = json['ElectricityEvening_EAC'];
    eveningEACErr = json['Evening_EACErr'];
    mprnErr = json['MprnErr'];
    gASEACErr = json['GAS_EACErr'];
    startDateErr = json['StartDateErr'];
    endDateErr = json['EndDateErr'];
    bothMissErr = json['BothMissErr'];
    strMPANStatus = json['strMPANStatus'];
    singleRateErr = json['SingleRateErr'];
    strSingleRate = json['strSingleRate'];
    strSiteAdrr1 = json['strSiteAdrr1'];
    strSiteAdrr2 = json['strSiteAdrr2'];
    strSiteCity = json['strSiteCity'];
    strSitePostCode = json['strSitePostCode'];
    singleRate = json['SingleRate'];
    strBillAdrr1 = json['strBillAdrr1'];
    strBillAdrr2 = json['strBillAdrr2'];
    strBillCity = json['strBillCity'];
    strBillPostCode = json['strBillPostCode'];
    strParentMPAN = json['strParentMPAN'];
    bisGreenCertificate = json['bisGreenCertificate'];
    bIsSingleRate = json['bIsSingleRate'];
    energyErr = json['EnergyErr'];
    mPANCore = json['MPANCore'];
    eACDay = json['EAC_Day'];
    eACNight = json['EAC_Night'];
    eACEWE = json['EAC_EWE'];
    mPRN = json['MPRN'];
    eACGAS = json['EAC_GAS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Business_Name'] = this.businessName;
    data['strPostCode'] = this.strPostCode;
    data['Full_Mpan_Number'] = this.fullMpanNumber;
    data['Gas_Mprn'] = this.gasMprn;
    data['ElectricityNight_EAC'] = this.electricityNightEAC;
    data['ElectricityDay_EAC'] = this.electricityDayEAC;
    data['GAS_EAC'] = this.gASEAC;
    data['dteContractStartDate'] = this.dteContractStartDate;
    data['dteContractEndDate'] = this.dteContractEndDate;
    data['PreferedStartDate'] = this.preferedStartDate;
    data['PreferedEndDate'] = this.preferedEndDate;
    data['Business_NameErr'] = this.businessNameErr;
    data['PostCodeErr'] = this.postCodeErr;
    data['MpanErr'] = this.mpanErr;
    data['Night_EACErr'] = this.nightEACErr;
    data['Day_EACErr'] = this.dayEACErr;
    data['ElectricityEvening_EAC'] = this.electricityEveningEAC;
    data['Evening_EACErr'] = this.eveningEACErr;
    data['MprnErr'] = this.mprnErr;
    data['GAS_EACErr'] = this.gASEACErr;
    data['StartDateErr'] = this.startDateErr;
    data['EndDateErr'] = this.endDateErr;
    data['BothMissErr'] = this.bothMissErr;
    data['strMPANStatus'] = this.strMPANStatus;
    data['SingleRateErr'] = this.singleRateErr;
    data['strSingleRate'] = this.strSingleRate;
    data['strSiteAdrr1'] = this.strSiteAdrr1;
    data['strSiteAdrr2'] = this.strSiteAdrr2;
    data['strSiteCity'] = this.strSiteCity;
    data['strSitePostCode'] = this.strSitePostCode;
    data['SingleRate'] = this.singleRate;
    data['strBillAdrr1'] = this.strBillAdrr1;
    data['strBillAdrr2'] = this.strBillAdrr2;
    data['strBillCity'] = this.strBillCity;
    data['strBillPostCode'] = this.strBillPostCode;
    data['strParentMPAN'] = this.strParentMPAN;
    data['bisGreenCertificate'] = this.bisGreenCertificate;
    data['bIsSingleRate'] = this.bIsSingleRate;
    data['EnergyErr'] = this.energyErr;
    data['MPANCore'] = this.mPANCore;
    data['EAC_Day'] = this.eACDay;
    data['EAC_Night'] = this.eACNight;
    data['EAC_EWE'] = this.eACEWE;
    data['MPRN'] = this.mPRN;
    data['EAC_GAS'] = this.eACGAS;
    return data;
  }
}
