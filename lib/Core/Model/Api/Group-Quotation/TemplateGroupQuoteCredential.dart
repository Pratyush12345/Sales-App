class TemplateGroupQuoteCredential {
  String AccountId;
  String Type;
  String intGroupid;
  String bitLtdPPC;
  String bitPlcPPC;
  String bitCharityPPC;
  String bitPublicSectorPPC;
  String bitSTPPC;
  String bitLlpPPC;
  String bitpPPC;
  String bitLlc;
  String bteMicroBusiness;
  String chkBillAddr;
  String strUniqueRefNoPPC;
  String strBusinessNamePPC;
  String RegisterCompanyNamePPC;
  String RegisterCompanyNoPPC;
  String RegisterCharityNoPPC;
  String strAddress1PPC;
  String strTownPPC;
  String strPostcodeHomePPC1bb;
  String strName1PPC;
  String strEmailBusinessPPC;
  String strPhoneBusinessPPC;
  String MobileNoPPC;
  var Imagebase64Premisescontract;
  String signature1;
  String name1;
  String date1;
  String signature2;
  String name2;
  String date2;

  TemplateGroupQuoteCredential({
    this.AccountId,
    this.Type,
    this.intGroupid,
    this.bitLtdPPC,
    this.bitPlcPPC,
    this.bitCharityPPC,
    this.bitPublicSectorPPC,
    this.bitSTPPC,
    this.bitLlpPPC,
    this.bitpPPC,
    this.bitLlc,
    this.bteMicroBusiness,
    this.chkBillAddr,
    this.strUniqueRefNoPPC,
    this.strBusinessNamePPC,
    this.RegisterCompanyNamePPC,
    this.RegisterCompanyNoPPC,
    this.RegisterCharityNoPPC,
    this.strAddress1PPC,
    this.strTownPPC,
    this.strPostcodeHomePPC1bb,
    this.strName1PPC,
    this.strEmailBusinessPPC,
    this.strPhoneBusinessPPC,
    this.MobileNoPPC,
    this.Imagebase64Premisescontract,
    this.signature1,
    this.name1,
    this.date1,
    this.signature2,
    this.name2,
    this.date2,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['AccountId'] = this.AccountId ?? "";
    data['Type'] = this.Type ?? "";
    data['intGroupid'] = this.intGroupid ?? "";
    data['bitLtdPPC'] = this.bitLtdPPC ?? "";
    data['bitPlcPPC'] = this.bitPlcPPC ?? "";
    data['bitCharityPPC'] = this.bitCharityPPC ?? "";
    data['bitPublicSectorPPC'] = this.bitPublicSectorPPC ?? "";
    data['bitSTPPC'] = this.bitSTPPC ?? "";
    data['bitLlpPPC'] = this.bitLlpPPC ?? "";
    data['bitpPPC'] = this.bitpPPC ?? "";
    data['bitLlc'] = this.bitLlc ?? "";
    data['bteMicroBusiness'] = this.bteMicroBusiness ?? "";
    data['chkBillAddr'] = this.chkBillAddr ?? "";
    data['strUniqueRefNoPPC'] = this.strUniqueRefNoPPC ?? "";
    data['strBusinessNamePPC'] = this.strBusinessNamePPC ?? "";
    data['RegisterCompanyNamePPC'] = this.RegisterCompanyNamePPC ?? "";
    data['RegisterCompanyNoPPC'] = this.RegisterCompanyNoPPC ?? "";
    data['RegisterCharityNoPPC'] = this.RegisterCharityNoPPC ?? "";
    data['strAddress1PPC'] = this.strAddress1PPC ?? "";
    data['strTownPPC'] = this.strTownPPC ?? "";
    data['strPostcodeHomePPC1bb'] = this.strPostcodeHomePPC1bb ?? "";
    data['strName1PPC'] = this.strName1PPC ?? "";
    data['strEmailBusinessPPC'] = this.strEmailBusinessPPC ?? "";
    data['strPhoneBusinessPPC'] = this.strPhoneBusinessPPC ?? "";
    data['MobileNoPPC'] = this.MobileNoPPC ?? "";
    data['Imagebase64Premisescontract'] =
        this.Imagebase64Premisescontract ?? "";
    data['signature1'] = this.signature1 ?? "";
    data['name1'] = this.name1 ?? "";
    data['date1'] = this.date1 ?? "";
    data['signature2'] = this.signature2 ?? "";
    data['name2'] = this.name2 ?? "";
    data['date2'] = this.date2 ?? "";

    return data;
  }
}
